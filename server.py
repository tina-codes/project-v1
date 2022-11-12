""" Server for Spotify Unwrapped """

from flask import (Flask, render_template, request, flash, session,
                   redirect, jsonify)
from model import connect_to_db, db
import crud
import os
import spotify
import requests
import json
from datetime import datetime

from jinja2 import StrictUndefined

app = Flask(__name__)
app.secret_key = 'dev'
app.jinja_env.undefined = StrictUndefined

@app.route('/')
def show_homepage():
    '''Show the application's homepage.'''

    # print(f"homepage: {datetime.now()}") #######

    return render_template('homepage.html')

@app.route('/unwrapped')
def unwrapped():
    '''Load page if user is logged in, redirect to homepage if not.'''

    if 'user' in session:
        user_id = session.get('user')

        current_user = crud.get_user_by_id(user_id)

        return render_template('unwrapped.html',
                                user=current_user)

    else:
        return redirect('/')

@app.route('/login')
def login():
    ''' Send user to Spotify for authorization'''
    # print(f"login: {datetime.now()}") #######

    return redirect(spotify.AUTH_URL)

@app.route('/callback')
def callback():

    auth_token = request.args['code']
    auth_header = spotify.authorize(auth_token)
    session['auth_header'] = auth_header

    return loggedin()

def valid_token(resp):
    return resp is not None and not 'error' in resp

@app.route('/loggedin')
def loggedin():
    '''Confirm user is logged in and request profile data'''
    if 'auth_header' in session:
        auth_header = session['auth_header']
        
        res = spotify.get_users_profile(auth_header)
        api_response = res.json()
        current_user = crud.create_update_user(api_response)
        session['user'] = api_response['id']
        session['photo'] = api_response['images'][0]['url']
        session['name'] = api_response['display_name']

        db.session.commit()

        if valid_token(api_response):
            return redirect('/api/topitems')

    return redirect('/')

@app.route('/profile')
def show_profile():
    '''Show user profile.'''

    name = session.get('name')
    photo = session.get('photo')

    return render_template('profile.html',
                            photo=photo,
                            name=name)

@app.route('/logout')
def log_out():
    '''Log user out.'''

    session['user'] = None
    session.modified = True

    return redirect('/')

@app.route('/api/topitems')
def get_user_tracks():
    '''Request top tracks and audio features'''
    
    timestamp = datetime.now().timestamp()
    user_id = session.get('user')
    top_tracks = crud.check_for_top_items(user_id, timestamp, 'track')
    
    if top_tracks == True:
        auth_header = session['auth_header']
        feature_queries = []
        artist_queries = []
        timespans = ['long_term', 'medium_term', 'short_term']

        for timespan in timespans:
            res = spotify.get_users_top_items(auth_header, 'tracks', timespan)
            tracks = res.json()
            feature_q_string, artist_q_string = crud.create_top_tracks(tracks, user_id, timestamp, timespan)
            feature_queries.append(feature_q_string)
            artist_queries.append(artist_q_string)

        for query_string in feature_queries:
            res = spotify.get_audio_features(auth_header, query_string)
            api_response = res.json()
            crud.create_audio_features(api_response)

        for query_string in artist_queries:
            res = spotify.get_artists_info(auth_header, query_string)
            api_response = res.json()
            crud.update_artists(api_response)

    # return redirect('/unwrapped')
    return redirect('/api/topartists')

@app.route('/api/topartists')
def get_user_artists():
    '''Request top tracks and audio features'''
    photo = session.get('photo')

    print("Beginning of top artists route")
    timestamp = datetime.now().timestamp()
    user_id = session.get('user')
    top_artists = crud.check_for_top_items(user_id, timestamp, 'artist')
    
    if top_artists == True:
        auth_header = session['auth_header']
        artist_queries = []
        timespans = ['long_term', 'medium_term', 'short_term']

        for timespan in timespans:
            res = spotify.get_users_top_items(auth_header, 'artists', timespan)
            artists = res.json()
            print(f"Calling create_top_artists for user_id {user_id}, timespan {timespan}")
            artist_queries.extend(crud.create_top_artists(artists, user_id, timestamp, timespan))
        # print(f"Top artists pulled: {datetime.now()}") ##########

        #Get top tracks for each artist

        # print(f"artist_queries: {artist_queries}") ##########
        for query_string in artist_queries:
            # print(f"query_string: {query_string}") ##########
            feature_queries = []
            res = spotify.get_artist_top_tracks(auth_header, query_string)
            api_response = res.json()
            feature_queries.append(crud.create_artist_tracks(api_response))

            print(f"157 feature_queries: {feature_queries}") ##########
            for query_string in feature_queries:
                if len(query_string) > 0:
                    print(f"159 feature_queries: {feature_queries}") ##########
                    res = spotify.get_audio_features(auth_header, query_string)
                    api_response = res.json()
                    crud.create_audio_features(api_response)
        print(f"end artists top tracks: {datetime.now()}") ##########

    return redirect('/unwrapped')


@app.route('/get-items')
def get_items_json():
    """Return a JSON response with nav items."""

    user_id = session.get('user')
    timespan = request.args.get('timespan')
    item_type = request.args.get('item_type')
    print("getitems params")
    print(item_type, user_id, timespan)
    parentItem, items = crud.get_items_for_nav(item_type, user_id, timespan)
    viewOptions = crud.get_view_options_by_type(item_type)
    photo = session.get('photo')

    # print({'viewOptions': viewOptions, 'parentItem': parentItem, 'items': items, 'photo': photo})

    return jsonify({'viewOptions': viewOptions, 'parentItem': parentItem, 'items': items, 'photo': photo})




if __name__ == "__main__":
    connect_to_db(app)
    app.run(host="0.0.0.0", debug=True)
