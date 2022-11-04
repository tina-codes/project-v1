""" Crud operations """

from model import db, connect_to_db, User, Item, Artist, Track, Album, Feature
from datetime import datetime


##### Creation Functions #####

def create_update_user(profile_data):
    '''Create or update and return a user.'''

    user_id = profile_data['id']
    display_name = profile_data['display_name']
    profile_photo = profile_data['images'][0]['url']

    current_user = User.query.get(user_id)

    if current_user is None:
        current_user = User(user_id=user_id,
                    display_name=display_name,
                    profile_photo=profile_photo)
        db.session.add(current_user)
    
    else:
        current_user.display_name = display_name
        current_user.profile_photo = profile_photo


    return current_user

def create_top_tracks(user_top_items, user_id, timestamp, timespan):
    '''Processes user's top tracks, returns list of lists.
    
    Takes in dictionary of items from spotify api call,
    creates top track listings, tracks, artists and albums.

    user = session[user], date = timestamp in route, 
    timespan = lt (long term) mt (medium term) or st (short term)
    
    return value index listed below'''

    track_ids = []  #0 - For features api call, need to join to a string
    artist_ids = []  #1 - For artists api call, need to join to a string
    album_ids = []
    top_items = []  
    artists = []    
    albums = []     
    tracks = []    
    rank_counter = 0 

    user_items = user_top_items['items']
   
    for item in user_items:

         # Create user's ranked list
        rank_counter += 1
        spotify_id = item['id']
        top_item = Item(user_id=user_id, date=timestamp,
                    item_type='track', timespan=timespan,
                    rank=rank_counter, spotify_id=spotify_id)
        
        top_items.append(top_item)
        
        # Create associated artists
        artist_id = item['artists'][0]['id']
        artist_name=item['artists'][0]['name']

        curr_artist = Artist.query.get(artist_id)
        if curr_artist == None and artist_id not in artist_ids:
            artist = Artist(artist_id=artist_id,
                            name=artist_name)
            artist_ids.append(artist_id)
            artists.append(artist)

        # Create associated albums
        album_id = item['album']['id']
        album_name = item['album']['name']
        release_date = item['album']['release_date']
        release_year = int(release_date[:4])
        img_url = item['album']['images'][0]['url']

        curr_album = Album.query.get(album_id)
        if curr_album == None and album_id not in album_ids:
            album = Album(album_id=album_id,
                        name=album_name,
                        release_year=release_year,
                        img_url=img_url,
                        artist_id=artist_id)
            albums.append(album)
            album_ids.append(album_id)

        # Create associated tracks
        track_id = item['id']
        track_name = item['name']
        popularity = item['popularity']
        curr_track = Track.query.get(track_id)
        if curr_track == None and track_id not in track_ids:
            track = Track(track_id = track_id,
                        artist_id= artist_id,
                        album_id = album_id,
                        name = track_name,
                        popularity = popularity)
            tracks.append(track)
            track_ids.append(track_id)
        
    db.session.add_all(top_items)
    db.session.add_all(albums)
    db.session.add_all(artists)
    db.session.add_all(tracks)
    db.session.commit()

    feature_query_string = ','.join(track_ids)

    return feature_query_string


def create_audio_features(api_response):
    '''Creates and returns list of audio features objects.'''

    all_track_features = []

    features = api_response['audio_features']

    for track in features:
        track_id = track['id']
        danceability = track['danceability']
        energy = track['energy']
        key = track['key']
        loudness = track['loudness']
        mode = track['mode']
        speechiness = track['speechiness']
        acousticness = track['acousticness']
        instrumentalness = track['instrumentalness']
        liveness = track['liveness']
        valence = track['valence']
        tempo = track['tempo']
        time_signature = track['time_signature']
        duration_ms = track['duration_ms']

        curr_track = Feature.query.get(track_id)
        if curr_track == None:
            track_features = Feature(track_id=track_id,
                        danceability=danceability,
                        energy=energy,
                        key=key,
                        loudness=loudness,
                        mode=mode,
                        speechiness=speechiness,
                        acousticness=acousticness,
                        instrumentalness=instrumentalness,
                        liveness=liveness,
                        valence=valence,
                        tempo=tempo,
                        time_signature=time_signature,
                        duration_ms=duration_ms)

            all_track_features.append(track_features)
    
    db.session.add_all(all_track_features)
    db.session.commit()

    return all_track_features

##### Retrieval Functions #####

def get_user_by_id(user_id):
    '''Get current user by user_id.'''
    return User.query.get(user_id)

def check_for_top_tracks(user_id, timestamp):
    '''Checks to see if top tracks available and more than one week old.'''
    user_items = Item.query.filter(user_id == user_id).first()

    if user_items is None:
        return True

    elif user_items is not None and (timestamp - user_items.date) > 604800:
        return True

def get_snapshot_dates(user_id):
    '''Check for dates the user has run the program.'''

    # q = db.session.query(Item).filter(Item.user_id == user_id)
    # snapshots = q.distinct(Item.date).all()

    snapshot = Item.query.filter(user_id == user_id).distinct(Item.timespan).all()
    # snapshots = user_items.query.distinct(Item.date).all()

    return snapshot


def get_top_items(user_id, view, item_type):
    '''Returns list of ids for user's most recent top items.'''

    if item_type == 'track':
        user_items = Item.query.filter(Item.user_id == user_id,
                                Item.timespan == view,
                                Item.item_type == item_type).all()

        item_list = []
        top_items = []
        viewOptions = [{'timespan': 'short_term', 'displayText': 'Month'},
                {'timespan': 'medium_term', 'displayText': 'Six Months'},
                {'timespan': 'long_term', 'displayText': 'All Time'}]
        
        all_tracks = []
        rank = 0

        tt_acousticness = 0
        tt_danceability = 0
        tt_energy = 0
        tt_instrumentalness = 0
        tt_liveness = 0
        tt_speechiness = 0
        tt_valence = 0

        for item in user_items:
            item_list.append(item.spotify_id)

        for item in item_list:
            rank += 1
            track = Track.query.get(item)
            top_items.append({'rank': rank,
                            'artist': track.artist.name,
                            'album': track.album.name,
                            'name': track.name,
                            'itemId': track.track_id,
                            'itemType': 'track',
                            'displayText': f'{track.artist.name} - {track.name}',
                            'featureData': [track.feature.acousticness,
                                    track.feature.danceability,
                                    track.feature.energy,
                                    track.feature.instrumentalness,
                                    track.feature.liveness,
                                    track.feature.speechiness,
                                    track.feature.valence]})
            tt_acousticness += track.feature.acousticness
            tt_danceability += track.feature.danceability
            tt_energy += track.feature.energy
            tt_instrumentalness += track.feature.instrumentalness
            tt_liveness += track.feature.liveness
            tt_speechiness += track.feature.speechiness
            tt_valence += track.feature.valence

            top_tracks_features = []

            top_tracks_features.append(tt_acousticness/50)
            top_tracks_features.append(tt_danceability/50)
            top_tracks_features.append(tt_energy/50)
            top_tracks_features.append(tt_instrumentalness/50)
            top_tracks_features.append(tt_liveness/50)
            top_tracks_features.append(tt_speechiness/50)
            top_tracks_features.append(tt_valence/50)
        
        return [viewOptions, top_items, top_tracks_features]

def get_features_by_track_id(track_id):
    ''' Return lists of labels and features for given track.'''

    track = Feature.query.get(track_id)

    featuresLabels = [
        'acousticness',
        'danceability',
        'energy',
        'instrumentalness',
        'liveness',
        'speechiness',
        'valence']

    featuresData = [
        track.acousticness,
        track.danceability,
        track.energy,
        track.instrumentalness,
        track.liveness,
        track.speechiness,
        track.valence]

    # print(f"labels: {featuresLabels}")
    # print(f"data: {featuresData}")

    return featuresLabels, featuresData

    
    



##### Update functions #####

# def update_user(user_id, display_name, profile_photo):
#     '''Returns an updated user.'''

#     user = User.query.get(user_id)
#     user.display_name = display_name
#     user.profile_photo = profile_photo

#     db.session.commit()

#     return user




if __name__ == '__main__':
    from server import app
    connect_to_db(app)