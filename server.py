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

# Flask routes go here

@app.route('/')
def show_homepage():
    '''Show the application's homepage.'''

    return render_template('homepage.html')

@app.route('/unwrapped')
def unwrapped():
    user_id = session.get('user')
    current_user = crud.get_user_by_id(user_id)

    top_items = crud.get_top_tracks(user_id)

    return render_template('unwrapped.html',
                            user=current_user,
                            top_items=top_items)

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

@app.route('/loggedin.json')
def loggedin():
    '''Confirm user is logged in and send api requests'''
    if 'auth_header' in session:
        auth_header = session['auth_header']
        
        res = spotify.get_users_profile(auth_header)
        profile_data = res.json()
        current_user = crud.create_update_user(profile_data)
        session['user'] = profile_data['id']

        db.session.commit()

        if valid_token(profile_data):
            return redirect('/topitems.json')

    return render_template('unwrapped.html')

@app.route('/topitems.json')
def get_user_items():

    user_id = session.get('user')
    top_tracks = crud.check_for_top_tracks(user_id)
    
    if top_tracks == None:
        auth_header = session['auth_header']
        timestamp = datetime.now()
        feature_queries = []
        timespans = ['long_term', 'medium_term', 'short_term']

        for timespan in timespans:
            res = spotify.get_users_top_items(auth_header, 'tracks', timespan)
            tracks = res.json()
            feature_queries.append(crud.create_top_tracks(tracks, user_id, timestamp, timespan))

        for query_string in feature_queries:
            res = spotify.get_audio_features(auth_header, query_string)
            api_response = res.json()
            print(api_response)
            crud.create_audio_features(api_response)

    return redirect('/unwrapped')



if __name__ == "__main__":
    connect_to_db(app)
    app.run(host="0.0.0.0", debug=True)
