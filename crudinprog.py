

    




def get_snapshot_dates(user_id):
    '''Check for dates the user has run the program.'''

    # q = db.session.query(Item).filter(Item.user_id == user_id)
    # snapshots = q.distinct(Item.date).all()

    snapshot = Item.query.filter(user_id == user_id).distinct(Item.timespan).all()
    # snapshots = user_items.query.distinct(Item.date).all()

    return snapshot

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