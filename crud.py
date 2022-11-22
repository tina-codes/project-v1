""" Crud operations """

from model import db, connect_to_db, User, Item, Artist, Track, Album, Feature, Genre, ArtistGenre
from datetime import datetime
import statistics

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
# get_features_for_tracks(track_ids): Returns dictionary of track feature lists.
# get_avgs_for_lists(feature_lists): Takes in feature dictionary and returns one list of avgs.
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

def create_update_user(api_response, timestamp):
    '''Create or update and return a user.'''

    user_id = api_response['id']
    display_name = api_response['display_name']
    profile_photo = api_response['images'][0]['url']

    current_user = User.query.get(user_id)

    if current_user is None:
        current_user = User(user_id=user_id,
                    display_name=display_name,
                    profile_photo=profile_photo,
                    created=timestamp,
                    last_login=timestamp)
        db.session.add(current_user)
    
    else:
        current_user.display_name = display_name
        current_user.profile_photo = profile_photo
        current_user.last_login = timestamp

    db.session.commit()

    query_string = create_user_following_query(timestamp)

    return current_user, query_string

def create_user_following_query(timestamp):
    '''Create list of users created since last login.'''

    # q = db.session.query(User.user_id)
    # # # new_users = q.filter(User.last_login>last_login)
    # new_users = [r[0] for r in q.filter(User.created>timestamp).all()]
    # query_string = ','.join(new_users)

    users = [r[0] for r in db.session.query(User.user_id).all()]
    query_string = ','.join(users)
    print(query_string)

    return query_string

def create_user_relationship(current_user, query_string, following_check):
    query_string = query_string.split(',')
    print(f"qstring: {query_string}")
    print(f"fcheck: {following_check}")

    for ind, user in enumerate(query_string):
        if following_check[ind] is True:
            userobj = User.query.get(user)
            user_flist = current_user.following
            user_flist.append(userobj)

    db.session.commit()
    return True


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

        curr_artist = Artist.query.get(artist_id)
        if curr_artist == None and artist_id not in artist_ids:
            artist = Artist(artist_id=artist_id,
                            name=artist_name,
                            popularity=popularity,
                            followers=followers)
            if item.get('images'):
                img_url = item['images'][0]['url']
                artist.img_url = img_url
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
            artist_genre_pairing = ArtistGenre.query.filter(ArtistGenre.genre == genre, ArtistGenre.artist_id == artist_id).first()
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
    db.session.add_all(artists)
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

def get_user_friends(user_id):
    user = User.query.get(user_id)

    following = user.following
    followers = user.followers

    return following, followers

def get_last_data_refresh_date(user_id):
    '''Get timestamp for last time user's data was refreshed.'''
    user_items = Item.query.filter_by(user_id = user_id).first()
    if user_items is not None:
        return user_items.date
    else:
        return None
    

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
        all_artist_ids = db.session.query(Item.spotify_id)
        artist_ids = all_artist_ids.filter(Item.user_id==user_id,
                                            Item.item_type=='artist',
                                            Item.timespan==timespan).all()

        for id in artist_ids:
            artist = id[0]
            all_genres = db.session.query(ArtistGenre.genre)
            genres = all_genres.filter(ArtistGenre.artist_id==artist).all()
            for genre in genres:
                item_ids.append(genre[0])


    else:
        item_list = db.session.query(Item.spotify_id)
        item_ids = [r[0] for r in item_list.filter(Item.user_id==user_id,
                                            Item.item_type==item_type,
                                            Item.timespan==timespan).all()]

    item_ids = set(item_ids)

    return list(item_ids)

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

def get_tracks_by_genre(genre): #Not being called anywhere... I think.
    '''Return a list of tracks for a given genre.'''

    tracks = []

    ag_objs = ArtistGenre.query.filter(ArtistGenre.genre == genre).all()

    for obj in ag_objs:
        artist = Artist.query.get(obj.artist_id)
        tracks.extend(artist.tracks)

    return tracks


def get_albums_by_artist(artist_id):
    '''Return album objects and IDs for an artist.'''

    album_ids = []

    albums = Album.query.filter(Album.artist_id == artist_id).all()

    for album in albums:
        album_ids.append(album.album_id)

    return albums, album_ids


def get_tracks_by_parent_id(item_id, item_type):
    '''Return track objects and IDs for an artist or album.'''

    track_ids = []

    if item_type == 'genre':
        tracks = get_tracks_by_genre(item_id)
        for track in tracks:
            track_ids.append(track.track_id)

    if item_type == 'artist':
        artist = Artist.query.get(item_id)
        tracks = artist.tracks
        for track in tracks:
            track_ids.append(track.track_id)

    return track_ids

def get_track_features(track_ids):
    '''Returns feature data for list of track objects.'''

    all_tracks = []

    count = 0

    for id in track_ids:
        feature = Feature.query.get(id)
        track = Track.query.get(id)
        if track.feature == None:
            continue
        count += 1

        duration_seconds = feature.duration_ms / 1000
        duration = datetime.fromtimestamp(duration_seconds).strftime('%-M:%S')
        all_tracks.append({'itemId': track.track_id,
                    'itemType': 'track',
                    'displayText': f'{count}. {track.artist.name} - {track.name}',
                    'imgUrl': track.album.img_url,
                    'featureData': [feature.acousticness, # 0
                            feature.danceability, # 1
                            feature.energy, # 2
                            feature.instrumentalness, # 3
                            feature.liveness, # 4
                            feature.speechiness, # 5
                            feature.valence, # 6
                            duration, # 7
                            feature.time_signature, # 8
                            feature.key, # 9
                            feature.mode, # 10
                            feature.loudness, # 11
                            feature.tempo, # 12
                            track.popularity]}) # 13

    return all_tracks

def get_features_for_tracks(track_ids):
    '''Calculate features for list of tracks.
        Can be applied to top items, artists, albums, or genres'''

    acousticness = []
    danceability = []
    energy = []
    instrumentalness = []
    liveness = []
    speechiness = []
    valence = []
    popularity = []
    time_signature = []
    pitch = []
    mode = []
    loudness = []
    tempo = []
    duration_ms = []


    for id in track_ids:
        trackfeature = Feature.query.get(id)
        track = Track.query.get(id)
        acousticness.append(trackfeature.acousticness)
        danceability.append(trackfeature.danceability)
        energy.append(trackfeature.energy)
        instrumentalness.append(trackfeature.instrumentalness)
        liveness.append(trackfeature.liveness)
        speechiness.append(trackfeature.speechiness)
        valence.append(trackfeature.valence)
        duration_ms.append(trackfeature.duration_ms)
        time_signature.append(trackfeature.time_signature)
        pitch.append(trackfeature.key)
        mode.append(trackfeature.mode)
        loudness.append(trackfeature.loudness)
        tempo.append(trackfeature.tempo)
        popularity.append(track.popularity)

    feature_lists = {'acousticness': acousticness,
                    'danceability': danceability,
                    'energy': energy,
                    'instrumentalness': instrumentalness,
                    'liveness': liveness,
                    'speechiness': speechiness,
                    'valence': valence,
                    'popularity': popularity,
                    'time_signature': time_signature,
                    'key': pitch,
                    'mode': mode,
                    'loudness': loudness,
                    'tempo': tempo,
                    'duration_ms': duration_ms}

    return feature_lists

def get_avgs_for_lists(feature_lists):

    final_avg = []

    feature_keys = ['acousticness', 'danceability', 'energy','instrumentalness',
                    'liveness', 'speechiness', 'valence', 'popularity', 'time_signature',
                    'key', 'mode', 'loudness', 'tempo']

    duration_ms = statistics.mean(feature_lists['duration_ms'])
    duration_seconds = duration_ms / 1000
    duration = datetime.fromtimestamp(duration_seconds).strftime('%-M:%S')
    # print(duration_ms)
    # print(duration_seconds)
    # print(duration)

    for feature in feature_keys:
        final_avg.append(statistics.mean(feature_lists[feature]))

    final_avg.append(duration)
    # print(final_avg)

    return final_avg

def get_avg_for_tracks(track_ids):
    '''Calculate feature averages for list of tracks.
        Can be applied to top items, artists, albums, or genres'''

    feature_lists = get_features_for_tracks(track_ids)
    final_avg = get_avgs_for_lists(feature_lists)

    return final_avg


def get_tracklist(parent_type, parent_id):
    '''Create item list to show in nav.'''
    
    parent_item = get_item_by_id(parent_id, parent_type)
    displayText = parent_item.name
    track_ids = get_tracks_by_parent_id(parent_id, parent_type) ### SUPER SLOW
    tracklist = get_track_features(track_ids) 
    all_tracks = get_avg_for_tracks(track_ids)

    item = [{'itemId': parent_id, 'itemType': parent_type,
            'displayText': displayText, 'imgUrl': '',
            'featureData': all_tracks}, {'items': tracklist}]

    return item, track_ids


 ########################################### Content Population #############################

 
def get_view_options_by_type(item_type):
    '''Return view options for that item type.'''

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
        tracklist = get_track_features(top_item_ids)
        all_tracks = get_avg_for_tracks(top_item_ids)

        
    else:
        tracklist = []
        tracks = []
        for item in top_item_ids:
            item_tracklist, track_ids = get_tracklist(item_type, item)
            tracklist.append(item_tracklist)
            tracks.extend(track_ids)

        all_tracks = get_avg_for_tracks(tracks)

    items = [{'itemId': item_id, 'itemType': item_type,
            'displayText': displayText, 'imgUrl': '',
            'featureData': all_tracks}, tracklist]

    return items

### Create function to delete user data, make sure there's some kind of confirmation
def delete_user_data(user_id):
    user_items = Item.query.filter(Item.user_id == user_id).delete()
    print(f"Items Deleted: {user_items}")
    user = User.query.get(user_id)
    db.session.delete(user)
    db.session.commit()

    return print("User Deleted")

### Data fun time!!!

def get_user_music(user_id):
    '''Get various items to process user's tastes.'''
    top_track_ids = set(get_user_items(user_id, 'track')) # ids for top tracks
    top_track_features = get_features_for_tracks(top_track_ids) # returns dict of features: [list of values]
    top_tracks = get_items_by_ids(top_track_ids, 'track') # top track objects
    top_artist_ids = set(get_user_items(user_id, 'artist')) # ids for top artists
    top_artists = get_items_by_ids(top_artist_ids, 'artist') # top artist objects

    return top_track_ids, top_track_features, top_tracks, top_artist_ids, top_artists

def analyze_decades(top_tracks):
    '''Analyze release dates for top tracks.'''

    track_decades = {}

    for track in top_tracks:
        release_year = track.album.release_year
        if release_year > 2019:
            track_decades['2020s'] = track_decades.get('2020s', 0) + 1
        if release_year < 2020 and release_year > 2009:
            track_decades['2010s'] = track_decades.get('2010s', 0) + 1
        if release_year > 1999 and release_year < 2010:
            track_decades['2000s'] = track_decades.get('2000s', 0) + 1
        if release_year > 1989 and release_year < 2000:
            track_decades['1990s'] = track_decades.get('1990s', 0) + 1
        if release_year > 1979 and release_year < 1990:
            track_decades['1980s'] = track_decades.get('1980s', 0) + 1
        if release_year > 1969 and release_year < 1980:
            track_decades['1970s'] = track_decades.get('1970s', 0) + 1
        if release_year > 1959 and release_year < 1970:
            track_decades['1960s'] = track_decades.get('1960s', 0) + 1
        if release_year > 1949 and release_year < 1960:
            track_decades['1950s'] = track_decades.get('1950s', 0) + 1
        if release_year > 1939 and release_year < 1950:
            track_decades['1940s'] = track_decades.get('1940s', 0) + 1
        if release_year > 1929 and release_year < 1940:
            track_decades['1930s'] = track_decades.get('1930s', 0) + 1
        if release_year > 1919 and release_year < 1930:
            track_decades['1920s'] = track_decades.get('1920s', 0) + 1
        if release_year > 1909 and release_year < 1920:
            track_decades['1910s'] = track_decades.get('1910s', 0) + 1
        if release_year > 1899 and release_year < 1910:
            track_decades['1900s'] = track_decades.get('1900s', 0) + 1
        if release_year < 1900:
            track_decades['Pre-1900s'] = track_decades.get('Pre-1900s', 0) + 1
    
    decade_labels = []
    decade_count = []

    decade_keys = sorted(track_decades)
    for decade in decade_keys:
        decade_labels.append(decade)
        decade_count.append(track_decades[decade])

    return track_decades, decade_labels, decade_count

def analyze_genres(top_tracks):
    '''Analyze genre distribution.'''

    track_genres = []

    top_genres = {}

    for track in top_tracks:
        artist_id = track.artist.artist_id
        artist_genres = db.session.query(ArtistGenre.genre).filter(ArtistGenre.artist_id==artist_id).all()
        for artist in artist_genres:
            track_genres.append(artist[0])

    for genre in track_genres:
        top_genres[genre] = top_genres.get(genre, 0) + 1

    top_genre_values = sorted(top_genres.values())
    top_genre_values.reverse()
    top_10_values = top_genre_values[:10]
    top_genre_labels = []
    top_genre_counts = []

    for genre, count in top_genres.items():
        if count in top_10_values:
            top_genre_labels.append(genre)
            top_genre_counts.append(count)

    return top_genres, top_genre_labels, top_genre_counts

def analyze_artist_popularity(top_artists):
    '''Analyze artists popularity distribution.'''

    artist_popularity_counter = {}

    for artist in top_artists:
        if artist.popularity in artist_popularity_counter:
            artist_popularity_counter[artist.popularity].append(artist.name)
        else:
            artist_popularity_counter[artist.popularity] = [artist.name]

    sorted_artist_popularity = sorted(artist_popularity_counter.keys())
    reversed_artist_popularity = reversed(sorted_artist_popularity)
    
    artist_popularity = []

    for artist in reversed_artist_popularity:
        artist_popularity.append(f"{artist}: {artist_popularity_counter[artist]}")

    return artist_popularity_counter, artist_popularity

def get_users_taste_profile(user_id):
    '''Generate data to describe user's taste in music.'''

    top_track_ids, top_track_features, top_tracks, top_artist_ids, top_artists = get_user_music(user_id)
    track_decades, decade_labels, decade_count = analyze_decades(top_tracks)
    top_genres, top_genre_labels, top_genre_counts = analyze_genres(top_tracks)
    artist_popularity_counter, artist_popularity = analyze_artist_popularity(top_artists)

    return {'artist_popularity': artist_popularity,
            'decade_labels': decade_labels,
            'decade_count': decade_count,
            'top_genre_labels': top_genre_labels,
            'top_genre_counts': top_genre_counts,
            'top_genres': top_genres}




if __name__ == '__main__':
    from server import app
    connect_to_db(app)