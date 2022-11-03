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

#### TEST ROUTES ####
@app.route('/test')
def show_page():
    '''Show test page.'''

    return render_template('final_unwrapped.html')

#####################

@app.route('/')
def show_homepage():
    '''Show the application's homepage.'''

    return render_template('homepage.html')

@app.route('/unwrapped')
def unwrapped():
    '''Load page if user is logged in, redirect to homepage if not.'''

    if 'user' in session:
        user_id = session.get('user')

        current_user = crud.get_user_by_id(user_id)
        # top_items = crud.get_top_tracks(user_id)
        # snapshot = crud.get_snapshot_dates(user_id)

        return render_template('unwrapped.html',
                                # snapshot=snapshot,
                                # top_items=top_items
                                user=current_user)

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
        
        res = spotify.get_users_profile(auth_header)
        profile_data = res.json()
        current_user = crud.create_update_user(profile_data)
        session['user'] = profile_data['id']

        db.session.commit()

        if valid_token(profile_data):
            return redirect('/api/topitems')

    return redirect('/')

@app.route('/api/topitems')
def get_user_items():
    '''Request top tracks and audio features'''
    
    timestamp = datetime.now().timestamp()
    user_id = session.get('user')
    top_tracks = crud.check_for_top_tracks(user_id, timestamp)
    
    if top_tracks == True:
        auth_header = session['auth_header']
        feature_queries = []
        timespans = ['long_term', 'medium_term', 'short_term']

        for timespan in timespans:
            res = spotify.get_users_top_items(auth_header, 'tracks', timespan)
            tracks = res.json()
            feature_queries.append(crud.create_top_tracks(tracks, user_id, timestamp, timespan))

        for query_string in feature_queries:
            res = spotify.get_audio_features(auth_header, query_string)
            api_response = res.json()
            crud.create_audio_features(api_response)

    return redirect('/test')
##### CHANGE BACK TO '/unwrapped'

@app.route('/get-items')
def get_items_json():
    """Return a JSON response with top items."""
    user_id = session.get('user')
    timespan = request.args.get('timespan')
    item_type = request.args.get('item_type')
    viewOptions, top_items = crud.get_top_items(user_id, timespan, item_type)

    print('Flask works!')


    return jsonify({'viewOptions': viewOptions, 'items': top_items, 'currentView': 'Top Tracks'})

@app.route('/track-data')
def get_chart_data():
    '''Return a JSON response with track features.'''

    item_id = request.args.get('item_id')

    # data = list of lists: featuresLabels and featuresData
    data = get_features_by_track_id(item_id)

    return jsonify({'data': data})



if __name__ == "__main__":
    connect_to_db(app)
    app.run(host="0.0.0.0", debug=True)
