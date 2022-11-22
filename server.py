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

    return render_template('homepage.html')

@app.route('/unwrapped')
def unwrapped():
    '''Load page if user is logged in, redirect to homepage if not.'''

    if 'user' in session:
        session['userview'] = session['user']
        return render_template('unwrapped.html')

    else:
        return redirect('/')

# @app.route('/unwrapped/<user_id>')
# def unwrapped_friends_view(friend_id):
#     '''Load Unwrapped with friend's music.'''

#     session['friend'] = friend_id

#     return render_template('unwrapped.html')

@app.route('/unwrapped/<user_id>')
def unwrapped_friend(user_id):
    '''Load page if user is logged in, redirect to homepage if not.'''

    if 'user' in session:
        session['userview'] = user_id

        return render_template('unwrapped.html')

    else:
        return redirect('/')

@app.route('/login')
def login():
    ''' Send user to Spotify for authorization'''

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
        timestamp = datetime.now().timestamp()
        
        res = spotify.get_users_profile(auth_header)
        api_response = res.json()
        current_user, query_string = crud.create_update_user(api_response, timestamp)

        # user_id = api_response['id']
        # session['user'] = user_id
        # session['photo'] = api_response['images'][0]['url']
        # session['name'] = api_response['display_name']

        user_id = current_user.user_id
        session['user'] = user_id
        session['photo'] = current_user.profile_photo
        session['name'] = current_user.display_name

        last_data_pull = crud.get_last_data_refresh_date(user_id)

        if len(query_string) > 0:
            res2 = spotify.check_user_follows(auth_header, query_string)
            following_check = res2.json()
            crud.create_user_relationship(current_user, query_string, following_check)
            if valid_token(following_check):
                if last_data_pull is None:
                    return redirect('/api/topitems')
                else:
                    return redirect('/unwrapped')

        else:
            if valid_token(api_response):
                if last_data_pull is None:
                    return redirect('/api/topitems')
                else:
                    return redirect('/unwrapped')

    return redirect('/')

@app.route('/profile')
def show_profile():
    '''Show user profile.'''

    user_id = session.get('user')
    current_user = crud.get_user_by_id(user_id)
    tastes = crud.get_users_taste_profile(user_id)
    following, followers = crud.get_user_friends(user_id)
    last_data_pull = crud.get_last_data_refresh_date(user_id)
    last_refresh = datetime.fromtimestamp(last_data_pull).strftime('%B %d, %Y')

    return render_template('profile.html',
                            current_user=current_user,
                            last_refresh=last_refresh,
                            tastes=tastes,
                            following=following,
                            followers=followers)

@app.route('/deleteuser')
def delete_user_data():
    '''Delete user's data and profile.'''
    user_id = session.get('user')
    crud.delete_user_data(user_id)

    return redirect('/')


@app.route('/logout')
def log_out():
    '''Log user out.'''

    session.clear()

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

            artist_queries.extend(crud.create_top_artists(artists, user_id, timestamp, timespan))

        for query_string in artist_queries:
            feature_queries = []
            res = spotify.get_artist_top_tracks(auth_header, query_string)
            api_response = res.json()
            feature_queries.append(crud.create_artist_tracks(api_response))

            for query_string in feature_queries:
                if len(query_string) > 0:
                    res = spotify.get_audio_features(auth_header, query_string)
                    api_response = res.json()
                    crud.create_audio_features(api_response)

    return redirect('/unwrapped')


# @app.route('/get-items')
# def get_items_json():
#     '''Return a JSON response with nav items.'''
    
#     if 'friend' in session:
#         user_id = session.get('friend')
#     else:
#         user_id = session.get('user')
        
#     photo = session.get('photo')
#     timespan = request.args.get('timespan')
#     item_type = request.args.get('item_type')
#     parentItem, items = crud.get_items_for_nav(item_type, user_id, timespan)
#     viewOptions = crud.get_view_options_by_type(item_type)

#     return jsonify({'viewOptions': viewOptions, 'parentItem': parentItem, 'items': items, 'photo': photo})

@app.route('/get-items')
def get_items_json():
    '''Return a JSON response with nav items.'''
    
    curr_user_id = session.get('user')
    user_id = session.get('userview')
        
    photo = session.get('photo')
    timespan = request.args.get('timespan')
    item_type = request.args.get('item_type')
    parentItem, items = crud.get_items_for_nav(item_type, user_id, timespan)
    viewOptions = crud.get_view_options_by_type(item_type)

    return jsonify({'viewOptions': viewOptions, 'parentItem': parentItem, 'items': items, 'photo': photo})




if __name__ == "__main__":
    connect_to_db(app)
    app.run(host="0.0.0.0", debug=True)
