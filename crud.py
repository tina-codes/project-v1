""" Crud operations """

from model import db, connect_to_db, User, Item, Artist, Track, Album, Feature, Genre, ArtistGenre
from datetime import datetime

############################## Table of Contents ###################################
### Create/Update:
# create_update_user(profile_data): Create or update and return a user
# create_ranked_list(user_items, user_id, timestamp, timespan, item_type): Create user's ranked list.
# create_artists_basic(user_items): Create artist from Tracks api call.
# create_artists_full(user_items): Create artist from Artists api call.
# create_albums(user_items): Create album.
# create_tracks(user_items): Create track.
# create_genres(user_items): Create genres.
# create_artist_genre(user_items): Create an artist/genre link.
# create_audio_features(api_response): Creates and returns list of audio features objects.
# update_artists(api_response): Update artists to include missing data.
# create_top_artists(user_top_items, user_id, timestamp, timespan): Processes user's top artists, returns list of spotify IDs.
# create_top_tracks(user_top_items, user_id, timestamp, timespan): Processes user's top tracks, returns query string for features API call
#
### Retreive: 
# get_user_by_id(user_id): Get current user by user_id.
# check_for_top_items(user_id, timestamp, item_type): Checks to see if top items available and more than one week old.
# get_user_items(user_id, item_type): Get list of item ids for a user's items.
# get_user_top_list(user_id, item_type, timespan): Get list of item ids for a user's top items.
# def get_item_by_id(item_id, item_type): Return an object by item ID.
# get_items_by_ids(item_ids, item_type): Return a list of objects from a list of item IDs.
# get_artists_by_genre(genre): Return a list of artists objects and IDs for a given genre.
# get_albums_by_artist(artist_id): Return album objects and IDs for an artist.
# get_tracks_by_parent_id(item_id, item_type): Return track objects and IDs for an artist or album.
# get_track_features(tracks): Returns feature data for list of track IDs.
# get_avg_for_tracks(tracks): Calculate feature averages for list of tracks.
# get_tracklist(parent_type, parent_id): Create item list to show in nav.
#
### Content Population:
# get_view_options_by_type(item_type): Return view options for that item type.
# def get_items_for_nav(item_type, user_id, viewOption): Create list of items to show in item nav.
# 
# 
# 
# 
# 

####################################################################################

#################### Creation/Update Functions #########################

def create_update_user(api_response):
    '''Create or update and return a user.'''

    user_id = api_response['id']
    display_name = api_response['display_name']
    profile_photo = api_response['images'][0]['url']

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
    '''Create artist from Tracks api call.'''
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
    '''Create artist from Artists api call.'''
    artist_ids = []
    artists = []

    for item in user_items:
        artist_id = item['id']
        artist_name = item['name']
        followers = item['followers']['total']
        genres = item['genres']
        popularity = item['popularity']

        if item.get('images'):
            img_url = item['images'][0]['url']
        
        else:
            img_url = "None"

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
                                name=genre,
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
        print(f'276: {artist_id}')
        
        artist = Artist.query.get(artist_id)

        followers = item['followers']['total']
        genres = item['genres']
        artist_id = item['id']
        popularity = item['popularity']

        artist.followers = followers
        artist.popularity = popularity

        if item.get('images'):
            img_url = item['images'][0]['url']
            artist.img_url = img_url


    genre_list, genre_ids = create_genres(artists)
    artist_genres = create_artist_genre(artists)

    db.session.add_all(genre_list)
    db.session.add_all(artist_genres)
    db.session.commit()

def create_top_artists(user_top_items, user_id, timestamp, timespan):
    '''Processes user's top artists, returns list of artist IDs.'''

    user_items = user_top_items['items']

    top_items, top_item_ids = create_ranked_list(user_items, user_id, timestamp, timespan, 'artist')
    artists, artist_ids = create_artists_full(user_items)
    genre_list, genre_ids = create_genres(user_items)
    artist_genres = create_artist_genre(user_items)

    db.session.add_all(top_items)
    print(f"Adding artists for timespan {timespan}")
    for artist in artists:
        print(f"Adding artist {artist}")
        db.session.add(artist)
        db.session.commit()
    # db.session.add_all(artists)
    db.session.add_all(genre_list)
    db.session.add_all(artist_genres)
    db.session.commit()

    return top_item_ids

def create_top_tracks(user_top_items, user_id, timestamp, timespan):
    '''Processes user's top tracks, returns query string for features api call.'''
   
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

def get_user_items(user_id, item_type):
    '''Get list of item ids for a user's items.'''

    item_ids = []
    item_list = Item.query.filter(Item.user_id == user_id, Item.item_type == item_type).all()

    for item in item_list:
        item_ids.append(item.spotify_id)

    return item_ids

def get_user_top_list(user_id, item_type, timespan):
    '''Get list of item ids for a user's top items.'''

    item_ids = []

    if item_type == 'genre':
        top_artist_ids = []
        item_list = Item.query.filter(Item.user_id == user_id,
                                    Item.item_type == 'artist',
                                    Item.timespan == timespan).all()
        for item in item_list:
            top_artist_ids.append(item.spotify_id)
            for artist in top_artist_ids:
                genres = ArtistGenre.query.filter(ArtistGenre.artist_id == artist).all()
                for genre in genres:
                    item_ids.append(genre.genre)
        item_ids = set(item_ids)
        item_ids = list(item_ids)


    else:
        item_list = Item.query.filter(Item.user_id == user_id,
                                    Item.item_type == item_type,
                                    Item.timespan == timespan).all()

        for item in item_list:
            item_ids.append(item.spotify_id)

    #print(item_ids)

    return item_ids

def get_item_by_id(item_id, item_type):
    '''Return an object by item ID.'''

    if item_type == 'track':
        return Track.query.get(item_id)

    if item_type == 'artist':
        return Artist.query.get(item_id)

    if item_type == 'album':
        return Album.query.get(item_id)

    if item_type == 'genre':
        return Genre.query.filter(Genre.genre == item_id).first()

    
def get_items_by_ids(item_ids, item_type):
    '''Return a list of objects from a list of item IDs.'''

    items = []

    if item_type == 'track':
        for id in item_ids:
            track = Track.query.get(id)
            items.append(track)
        
    if item_type == 'artist':
        for id in item_ids:
            artist = Artist.query.get(id)
            items.append(artist)

    if item_type == 'album':
        for id in item_ids:
            album = Album.query.get(id)
            items.append(album)

    return items

def get_artists_by_genre(genre):
    '''Return a list of artists objects and IDs for a given genre.'''

    artists = []
    artist_ids = []

    ag_objs = ArtistGenre.query.filter(ArtistGenre.genre == genre).all()
    for obj in ag_objs:
        artist_ids.append(obj.artist_id)
        artists.append(Artist.query.get(obj.artist_id))

    return artists, artist_ids

def get_albums_by_artist(artist_id):
    '''Return album objects and IDs for an artist.'''

    album_ids = []

    albums = Album.query.filter(Album.artist_id == artist_id).all()

    for album in albums:
        album_ids.append(album.album_id)

    return albums, album_ids


def get_tracks_by_parent_id(item_id, item_type):
    '''Return track objects and IDs for an artist or album.'''

    #print(f'get tracks {item_type}: {item_id}')

    track_ids = []

    if item_type == 'artist':
        tracks = Track.query.filter(Track.artist_id == item_id).all()

    if item_type == 'album':
        tracks = Track.query.filter(Track.album_id == item_id).all()

    if item_type == 'genre':
        tracks = []
        artists, artist_ids = get_artists_by_genre(item_id)
        for id in artist_ids:
            artist_tracks = Track.query.filter(Track.artist_id == id).all()
            tracks.extend(artist_tracks)

    for track in tracks:
        track_ids.append(track.track_id)

    #print(track_ids)
    return tracks, track_ids

def get_track_features(tracks):
    '''Returns feature data for list of track objects.'''

    all_tracks = []

    count = 0
    # print(f'511 {tracks}')

    for track in tracks:
        # print(f'513 {track}')
        # print(track.artist)
        # print(track.name)
        # print(track.feature)
        if track.feature == None:
            continue
        count += 1
        all_tracks.append({'itemId': track.track_id,
                    'itemType': 'track',
                    'displayText': f'{count}.{track.artist.name} - {track.name}',
                    'featureData': [track.feature.acousticness,
                            track.feature.danceability,
                            track.feature.energy,
                            track.feature.instrumentalness,
                            track.feature.liveness,
                            track.feature.speechiness,
                            track.feature.valence]})

    return all_tracks


def get_avg_for_tracks(tracks):
    '''Calculate feature averages for list of tracks.
        Can be applied to top items, artists, albums, or genres'''

    features_avg = [0, 0, 0, 0, 0, 0, 0]
    final_avg = []
    count = len(tracks)

    feature_list = ['acousticness', 'danceability', 'energy','instrumentalness',
                    'liveness', 'speechiness', 'valence']

    for item in tracks:
        track = Feature.query.get(item)
        features_avg[0] += track.acousticness
        features_avg[1] += track.danceability
        features_avg[2] += track.energy
        features_avg[3] += track.instrumentalness
        features_avg[4] += track.liveness
        features_avg[5] += track.speechiness
        features_avg[6] += track.valence

    for feature in features_avg:
        final_avg.append(feature / count)

    return final_avg


def get_tracklist(parent_type, parent_id):
    '''Create item list to show in nav.'''
    

    parent_item = get_item_by_id(parent_id, parent_type)
    displayText = parent_item.name

    tracks, track_ids = get_tracks_by_parent_id(parent_id, parent_type) #Objects
    tracklist = get_track_features(tracks) # list of track dictionaries
    all_tracks = get_avg_for_tracks(track_ids) # parent item feature list

    item = [{'itemId': parent_id, 'itemType': parent_type,
            'displayText': displayText, 'featureData': all_tracks},
            {'items': tracklist}]


    # print(f'parent_id: {parent_id}')
    # print(f'track_ids: {track_ids}')


    return item, track_ids


 ########################################### Content Population #############################

 
def get_view_options_by_type(item_type):
    '''Return view options for that item type.'''

    # if item_type == 'genre':
    #     return [{'id': 'all_genres', 'displayText': 'All Genres'}]

    # if item_type == 'artist':
    #     return [{'id': 'albums', 'displayText': 'Albums'},
    #             {'id': 'similar_artists', 'displayText': 'Similar Artists'}]

    # if item_type == 'album':
    #     return [{'id': 'all_albums', 'displayText': 'All Albums'}]

    return [{'timespan': 'short_term', 'displayText': 'Month'},
            {'timespan': 'medium_term', 'displayText': 'Six Months'},
            {'timespan': 'long_term', 'displayText': 'All Time'}]


def get_items_for_nav(item_type, user_id, timespan):
    '''Create list of items to show in item nav.'''

    top_item_ids = get_user_top_list(user_id, item_type, timespan)
    item_id = f'{item_type}s'
    displayText = f'All {item_id}'

    if item_type == 'track':
        tracks = get_items_by_ids(top_item_ids, item_type)
        tracklist = get_track_features(tracks)
        all_tracks = get_avg_for_tracks(top_item_ids)
        
    else:
        tracklist = []
        tracks = []
        for item in top_item_ids:
            # print('get_tracklist(item_type, item)')
            # print(f'itemtype: {item_type} item: {item}')
            item_tracklist, track_ids = get_tracklist(item_type, item)
            tracklist.append(item_tracklist)
            tracks.extend(track_ids)

        all_tracks = get_avg_for_tracks(tracks)

    items = [{'itemId': item_id, 'itemType': item_type,
            'displayText': displayText, 'featureData': all_tracks},
            tracklist]

    return items

### Create function to delete user data, make sure there's some kind of confirmation
def delete_user_data(user_id):
    user_items = Item.query.filter(Item.user_id == user_id).all()


if __name__ == '__main__':
    from server import app
    connect_to_db(app)