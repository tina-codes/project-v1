""" Crud operations """

from model import db, connect_to_db, User, Item, Artist, Track, Album, Feature, Genre, ArtistGenre
from datetime import datetime


#################### Creation Functions #########################

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

def create_ranked_list(user_items, user_id, timestamp, timespan, item_type):
    '''Create user's ranked list.'''

    rank_counter = 0 
    top_items = []
    top_item_ids = []

    for item in user_items:
        rank_counter += 1
        spotify_id = item['id']
        top_item = Item(user_id=user_id, date=timestamp,
                    item_type=item_type, timespan=timespan,
                    rank=rank_counter, spotify_id=spotify_id)
        top_items.append(top_item)
        top_item_ids.append(spotify_id)

    return top_items, top_item_ids


def create_artists_basic(user_items):
    '''Create artist.'''
    artist_ids = []
    artists = []

    for item in user_items:
        artist_id = item['artists'][0]['id']
        artist_name=item['artists'][0]['name']

        curr_artist = Artist.query.get(artist_id)
        if curr_artist == None and artist_id not in artist_ids:
            artist = Artist(artist_id=artist_id,
                            name=artist_name)
            artist_ids.append(artist_id)
            artists.append(artist)

    return artists, artist_ids

def create_artists_full(user_items):
    '''Create artist.'''
    artist_ids = []
    artists = []

    for item in user_items:
        artist_id = item['id']
        artist_name = item['name']
        followers = item['followers']['total']
        genres = item['genres']
        img_url = item['images'][0]['url']
        popularity = item['popularity']

        curr_artist = Artist.query.get(artist_id)
        if curr_artist == None and artist_id not in artist_ids:
            artist = Artist(artist_id=artist_id,
                            name=artist_name,
                            popularity=popularity,
                            followers=followers,
                            img_url=img_url) 
            artist_ids.append(artist_id)
            artists.append(artist)

    return artists, artist_ids


def create_albums(user_items):
    '''Create album.'''
    albums = []
    album_ids = []

    for item in user_items:
        artist_id = item['artists'][0]['id']
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

    return albums, album_ids

def create_tracks(user_items):
    '''Create track.'''
    tracks = []
    track_ids = []

    for item in user_items:
        artist_id = item['artists'][0]['id']
        album_id = item['album']['id']
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
  
    return tracks, track_ids

def create_genres(user_items):
    '''Create genres.'''

    genre_list = []
    genre_ids = []

    for item in user_items:
        genres = item['genres']

        for genre in genres:
            curr_genre = Genre.query.get(genre)

            if curr_genre == None and genre not in genre_ids:
                add_genre = Genre(genre=genre,
                            is_seed=False)
                genre_list.append(add_genre)
                genre_ids.append(genre)

    return genre_list, genre_ids

def create_artist_genre(user_items):
    '''Create an artist/genre link.'''

    artist_genre_tuples = []
    artist_genres = []

    for item in user_items:
        genres = item['genres']
        artist_id = item['id']

        for genre in genres:
            artist_genre_pairing = ArtistGenre.query.filter(genre == genre, artist_id == artist_id).first()
            artist_genre_tuple = (genre, artist_id)
            if artist_genre_pairing == None and artist_genre_tuple not in artist_genre_tuples:
                artist_genre = ArtistGenre(genre=genre,
                                            artist_id=artist_id)
                artist_genre_tuples.append(artist_genre_tuple)
                artist_genres.append(artist_genre)

    return artist_genres

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

def update_artists(api_response):
    '''Update artists to include missing data.'''

    artists = api_response['artists']

    for item in artists:
        artist_id = item['id']
        
        artist = Artist.query.get(artist_id)

        followers = item['followers']['total']
        genres = item['genres']
        img_url = item['images'][0]['url']
        artist_id = item['id']
        popularity = item['popularity']

        artist.followers = followers
        artist.img_url = img_url
        artist.popularity = popularity


    genre_list, genre_ids = create_genres(artists)
    artist_genres = create_artist_genre(artists)

    db.session.add_all(genre_list)
    db.session.add_all(artist_genres)
    db.session.commit()

#################### Process API Data Lists ######################

def create_top_artists(user_top_items, user_id, timestamp, timespan):
    '''Processes user's top artists, returns list of artist IDs.'''

    user_items = user_top_items['items']

    top_items, top_item_ids = create_ranked_list(user_items, user_id, timestamp, timespan, 'artist')
    artists, artist_ids = create_artists_full(user_items)
    genre_list, genre_ids = create_genres(user_items)
    artist_genres = create_artist_genre(user_items)

    db.session.add_all(top_items)
    db.session.add_all(artists)
    db.session.add_all(genre_list)
    db.session.add_all(artist_genres)
    db.session.commit()

    return top_item_ids

def create_top_tracks(user_top_items, user_id, timestamp, timespan):
    '''Processes user's top tracks, returns list of lists.'''
   
    user_items = user_top_items['items']

    top_items, top_item_ids = create_ranked_list(user_items, user_id, timestamp, timespan, 'track')
    artists, artist_ids = create_artists_basic(user_items)
    albums, album_ids = create_albums(user_items)
    tracks, track_ids = create_tracks(user_items)
        
    db.session.add_all(top_items)
    db.session.add_all(albums)
    db.session.add_all(artists)
    db.session.add_all(tracks)
    db.session.commit()

    feature_query_string = ','.join(track_ids)
    artist_query_string = ','.join(artist_ids)

    return [feature_query_string, artist_query_string]

def create_artist_tracks(api_response):
    '''Create an artist's top tracks, returns list of track ids.'''

    items = api_response['tracks']

    artists, artist_ids = create_artists_basic(items)
    albums, album_ids = create_albums(items)
    tracks, track_ids = create_tracks(items)
        
    db.session.add_all(albums)
    db.session.add_all(artists)
    db.session.add_all(tracks)
    db.session.commit()

    feature_query_string = ','.join(track_ids)

    return feature_query_string

#################### Retrieval Functions #########################

########## User ##########

def get_user_by_id(user_id):
    '''Get current user by user_id.'''
    return User.query.get(user_id)

def check_for_top_items(user_id, timestamp, item_type):
    '''Checks to see if top items available and more than one week old.'''
    user_items = Item.query.filter_by(user_id = user_id, item_type = item_type).first()

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


############### Items ###############

#### Need to complete this - figure out what/how to return.
#### Also very repetetive and need to break it down into smaller functions 
def get_top_items(user_id, view, item_type):
    '''Returns list of ids for user's most recent top items.'''

    top_items = []
    top_tracks_features = []
    user_items = Item.query.filter(Item.user_id == user_id,
                                Item.timespan == view,
                                Item.item_type == item_type).all()

    item_list = []
    for item in user_items:
            item_list.append(item.spotify_id)

    rank = 0
    viewOptions = [{'timespan': 'short_term', 'displayText': 'Month'},
                {'timespan': 'medium_term', 'displayText': 'Six Months'},
                {'timespan': 'long_term', 'displayText': 'All Time'}]

    if item_type == 'artist':

        #for each artist in the list
        for item in item_list:
            rank += 1
            artist = Artist.query.get(item)

            #get all tracks by that artist
            artist_tracks = Track.query.filter(Track.artist_id == item).all()

            artist_top_items = []
            top_tracks_features = []

            tt_acousticness = 0
            tt_danceability = 0
            tt_energy = 0
            tt_instrumentalness = 0
            tt_liveness = 0
            tt_speechiness = 0
            tt_valence = 0

            count = 0

            #for each of that artist's tracks create an item:
            for each in artist_tracks:
                count += 1
                track = Track.query.get(item)
                artist_top_items.append({
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

                top_tracks_features.append(tt_acousticness/count)
                top_tracks_features.append(tt_danceability/count)
                top_tracks_features.append(tt_energy/count)
                top_tracks_features.append(tt_instrumentalness/count)
                top_tracks_features.append(tt_liveness/count)
                top_tracks_features.append(tt_speechiness/count)
                top_tracks_features.append(tt_valence/count)

                top_items.append({'rank': rank,
                                'name': artist.name,
                                'itemId': artist.artist_id,
                                'itemType': 'artist',
                                'displayText': f'{artist.name}',
                                'artistTracks': artist_top_items,
                                'artistAllFeatures': top_tracks_features})

    if item_type == 'track':
        
        all_tracks = []

        tt_acousticness = 0
        tt_danceability = 0
        tt_energy = 0
        tt_instrumentalness = 0
        tt_liveness = 0
        tt_speechiness = 0
        tt_valence = 0
        
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

        top_tracks_features.append(tt_acousticness/rank)
        top_tracks_features.append(tt_danceability/rank)
        top_tracks_features.append(tt_energy/rank)
        top_tracks_features.append(tt_instrumentalness/rank)
        top_tracks_features.append(tt_liveness/rank)
        top_tracks_features.append(tt_speechiness/rank)
        top_tracks_features.append(tt_valence/rank)
        
        return [viewOptions, top_items, top_tracks_features]

###############################################################################
########## Top Artists ##########

# def create_top_artists(user_top_items, user_id, timestamp, timespan):
#     '''Processes user's top artists, returns list of artist IDs

#     Takes in dictionary of items from spotify api call,
#     creates top artist listings, genres, and artist/genre records.

#     user = session[user], date = timestamp in route, 
#     timespan = lt (long term) mt (medium term) or st (short term)'''

#     all_artists = [] #For top tracks
#     artist_ids = []
#     artists = []
#     top_items = []
#     genre_list = []
#     genre_ids = []
#     artist_genres = []
#     artist_genre_tuples = []
     
#     rank_counter = 0 

#     user_items = user_top_items['items']
#     top_items = []  

   
#     for item in user_items:

#         # Create user's ranked list - working fine
#         rank_counter += 1
#         spotify_id = item['id']
#         top_item = Item(user_id=user_id, date=timestamp,
#                     item_type='artist', timespan=timespan,
#                     rank=rank_counter, spotify_id=spotify_id)
        
#         top_items.append(top_item)
#         all_artists.append(spotify_id)

#         # Create associated artists - throwing duplication errors
#         artist_name = item['name']
#         followers = item['followers']['total']
#         genres = item['genres']
#         img_url = item['images'][0]['url']
#         artist_id = item['id']
#         popularity = item['popularity']

#         curr_artist = Artist.query.get(artist_id)
#         if curr_artist == None and artist_id not in artist_ids:
#             artist = Artist(artist_id=artist_id,
#                             name=artist_name,
#                             popularity=popularity,
#                             followers=followers,
#                             img_url=img_url) 
#             artist_ids.append(artist_id)
#             artists.append(artist)

#         for genre in genres:
#             curr_genre = Genre.query.get(genre)
#             if curr_genre == None and genre not in genre_ids:
#                 add_genre = Genre(genre=genre,
#                             is_seed=False)
#                 genre_list.append(add_genre)
#                 genre_ids.append(genre)


#             #Create Artist/Genre connection - Not working
#             artist_genre_pairing = ArtistGenre.query.filter(genre == genre, artist_id == artist_id).first()
#             artist_genre_tuple = (genre, artist_id)
#             if artist_genre_pairing == None and artist_genre_tuple not in artist_genre_tuples:
#                 artist_genre = ArtistGenre(genre=genre,
#                                             artist_id=artist_id)
#                 artist_genre_tuples.append(artist_genre_tuple)
#                 artist_genres.append(artist_genre)
    

#     db.session.add_all(top_items)
#     db.session.add_all(artists)
#     db.session.add_all(genre_list)
#     db.session.add_all(artist_genres)
#     db.session.commit()

#     return all_artists


# def update_artists(api_response):
#     '''Update artists from Top Tracks to include missing data.'''

#     artists = api_response['artists']
#     genre_ids = []
#     genre_list = []
#     artist_genre_tuples = []
#     artist_genres = []


#     for item in artists:
#         artist_id = item['id']
        
#         artist = Artist.query.get(artist_id)

#         followers = item['followers']['total']
#         genres = item['genres']
#         img_url = item['images'][0]['url']
#         artist_id = item['id']
#         popularity = item['popularity']

#         artist.followers = followers
#         artist.img_url = img_url
#         artist.popularity = popularity

#             # Create genres 
#         for genre in genres:
#             curr_genre = Genre.query.get(genre)
#             if curr_genre == None and genre not in genre_ids:
#                 add_genre = Genre(genre=genre,
#                             is_seed=False)
#                 genre_list.append(add_genre)
#                 genre_ids.append(genre)


#             #Create Artist/Genre connection
#             artist_genre_pairing = ArtistGenre.query.filter(genre == genre, artist_id == artist_id).first()
#             artist_genre_tuple = (genre, artist_id)
#             if artist_genre_pairing == None and artist_genre_tuple not in artist_genre_tuples:
#                 artist_genre = ArtistGenre(genre=genre,
#                                             artist_id=artist_id)
#                 artist_genre_tuples.append(artist_genre_tuple)
#                 artist_genres.append(artist_genre)

#     db.session.add_all(genre_list)
#     db.session.add_all(artist_genres)
#     db.session.commit()
        
# ########## Tracks ##########

# def create_top_tracks(user_top_items, user_id, timestamp, timespan):
#     '''Processes user's top tracks, returns list of lists.
    
#     Takes in dictionary of items from spotify api call,
#     creates top track listings, tracks, artists and albums.

#     user = session[user], date = timestamp in route, 
#     timespan = lt (long term) mt (medium term) or st (short term)'''

#     track_ids = []  # For features api call, need to join to a string
#     artist_ids = []  # For artists api call, need to join to a string
#     album_ids = []
#     top_items = []  
#     artists = []    
#     albums = []     
#     tracks = []    
#     rank_counter = 0 

#     user_items = user_top_items['items']

    
   
#     for item in user_items:

#          # Create user's ranked list
#         rank_counter += 1
#         spotify_id = item['id']
#         top_item = Item(user_id=user_id, date=timestamp,
#                     item_type='track', timespan=timespan,
#                     rank=rank_counter, spotify_id=spotify_id)
        
#         top_items.append(top_item)
        
#         # Create associated artists
#         artist_id = item['artists'][0]['id']
#         artist_name=item['artists'][0]['name']

#         curr_artist = Artist.query.get(artist_id)
#         if curr_artist == None and artist_id not in artist_ids:
#             artist = Artist(artist_id=artist_id,
#                             name=artist_name)
#             artist_ids.append(artist_id)
#             artists.append(artist)

#         # Create associated albums
#         album_id = item['album']['id']
#         album_name = item['album']['name']
#         release_date = item['album']['release_date']
#         release_year = int(release_date[:4])
#         img_url = item['album']['images'][0]['url']

#         curr_album = Album.query.get(album_id)
#         if curr_album == None and album_id not in album_ids:
#             album = Album(album_id=album_id,
#                         name=album_name,
#                         release_year=release_year,
#                         img_url=img_url,
#                         artist_id=artist_id)
#             albums.append(album)
#             album_ids.append(album_id)

#         # Create associated tracks
#         track_id = item['id']
#         track_name = item['name']
#         popularity = item['popularity']
#         curr_track = Track.query.get(track_id)
#         if curr_track == None and track_id not in track_ids:
#             track = Track(track_id = track_id,
#                         artist_id= artist_id,
#                         album_id = album_id,
#                         name = track_name,
#                         popularity = popularity)
#             tracks.append(track)
#             track_ids.append(track_id)
        
#     db.session.add_all(top_items)
#     db.session.add_all(albums)
#     db.session.add_all(artists)
#     db.session.add_all(tracks)
#     db.session.commit()

#     feature_query_string = ','.join(track_ids)
#     artist_query_string = ','.join(artist_ids)

#     return [feature_query_string, artist_query_string]

# def create_tracks(api_response):
#     '''Create an artist's top tracks, returns list of track ids.
    
#     Takes in dictionary of items from spotify api call,
#     creates tracks and albums.'''

#     track_ids = []  # For features api call, need to join to a string
#     album_ids = []
#     artist_ids = []
#     artists = []    
#     albums = []     
#     tracks = []    

#     items = api_response['tracks']
   
#     for item in items:
#         artist_id = item['artists'][0]['id']

#         # Create associated artists
#         artist_id = item['artists'][0]['id']
#         artist_name=item['artists'][0]['name']

#         curr_artist = Artist.query.get(artist_id)
#         if curr_artist == None and artist_id not in artist_ids:
#             artist = Artist(artist_id=artist_id,
#                             name=artist_name)
#             artist_ids.append(artist_id)
#             artists.append(artist)

#         # Create associated albums
#         album_id = item['album']['id']
#         album_name = item['album']['name']
#         release_date = item['album']['release_date']
#         release_year = int(release_date[:4])
#         img_url = item['album']['images'][0]['url']

#         curr_album = Album.query.get(album_id)
#         if curr_album == None and album_id not in album_ids:
#             album = Album(album_id=album_id,
#                         name=album_name,
#                         release_year=release_year,
#                         img_url=img_url,
#                         artist_id=artist_id)
#             albums.append(album)
#             album_ids.append(album_id)

#         # Create associated tracks
#         track_id = item['id']
#         track_name = item['name']
#         popularity = item['popularity']
#         curr_track = Track.query.get(track_id)
#         if curr_track == None and track_id not in track_ids:
#             track = Track(track_id = track_id,
#                         artist_id= artist_id,
#                         album_id = album_id,
#                         name = track_name,
#                         popularity = popularity)
#             tracks.append(track)
#             track_ids.append(track_id)
        
#     db.session.add_all(artists)
#     db.session.add_all(albums)
#     db.session.add_all(tracks)
#     db.session.commit()

#     feature_query_string = ','.join(track_ids)

#     return feature_query_string

# def get_features_by_track_id(track_id):
#     ''' Return lists of labels and features for given track.'''

#     track = Feature.query.get(track_id)

#     featuresLabels = [
#         'acousticness',
#         'danceability',
#         'energy',
#         'instrumentalness',
#         'liveness',
#         'speechiness',
#         'valence']

#     featuresData = [
#         track.acousticness,
#         track.danceability,
#         track.energy,
#         track.instrumentalness,
#         track.liveness,
#         track.speechiness,
#         track.valence]

#     # print(f"labels: {featuresLabels}")
#     # print(f"data: {featuresData}")

#     return featuresLabels, featuresData

    




    



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