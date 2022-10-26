""" Crud operations """

from model import db, connect_to_db, User, Item, Artist, Track, Album, Feature
from datetime import datetime


##### Creation Functions #####

# Should this be create/retrieve? Will pull profile info
# and update it every time user logs in
def create_update_user(profile_data):
    '''Createn or update and return a user.'''

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
    top_items = []  #2
    artists = []    #3
    albums = []     #4
    tracks = []     #5

    user_items = user_top_items['item']
   
    for item in user_items:

         # Create user's ranked list
        rank_counter = 1
        spotify_id = item['id']
        top_item = Item(user_id=user_id, date=timestamp,
                    item_type='track', timespan=timespan,
                    rank=rank_counter, spotify_id=spotify_id)
        rank_counter += 1
        track_ids.append(spotify_id)
        top_items.append(top_item)

        # Create associated artists
        artist_id = item['artists'][0]['id']
        artist_name=item['artists'][0]['name']
        artist = Artist(artist_id=artist_id,
                        name=artist_name)
        artist_ids.append(artist_id)
        artists.append(artist)

        # Create associated albums
        album_id = item['album']['id'],
        album_name = item['album']['name'],
        release_date = date.strptime(item['album']['release_date'], '%Y-%m-%d'),
        img_url = item['album']['images'][0]['url'],
        album = Album(album_id=album_id,
                    name=album_name,
                    release_date=release_date,
                    img_url=img_url,
                    artist_id=artist_id)
        albums.append(album)

        # Create associated tracks
        track_id = item['id'],
        track_name = item['name'],
        popularity = item['popularity'],
        track = Track(track_id = track_id,
                    album_id = album_id,
                    name = track_name,
                    popularity = popularity)
        tracks.append(track)
        
    db.session.add_all(top_items)
    db.session.add_all(albums)
    db.session.add_all(artists)
    db.session.add_all(tracks)

    feature_query_string = '%2C'.join(track_ids)

    return feature_query_string


def create_audio_features(response_item):
    '''Creates and returns list of audio features objects.'''

    all_track_features = []

    audio_features = response_item['audio_features']

    for track in audio_features:
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

    return all_track_features

##### Retrieval Functions #####

# def get_user_by_id(user_id):
#     '''Returns an updated user.'''

#     return User.query.get(user_id)

# def get_most_recent_top_items(user_id, item_type, timespan, date):
#     '''Returns list of ids for users most recent top items.'''

#     ### Date passed through 

#     top_items = TopItem.query.filter(user_id == user_id,
#                             item_type == item_type, 
#                             timespan == timespan,
#                             date == date)
#     item_list = []

#     for item in top_items:



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