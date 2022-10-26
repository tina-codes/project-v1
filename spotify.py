'''Utilities for Spotify Authorization Flow

Adapted from https://github.com/hereismari/spotify-flask'''

from flask import (Flask, render_template, request, flash, session,
                   redirect, jsonify)
import os
import base64
import urllib.request, urllib.error
import urllib.parse as urllibparse
import requests
import json
import model
import crud

CLIENT_ID = os.environ['SPOTIFY_CLIENT_ID']
CLIENT_SECRET = os.environ['SPOTIFY_CLIENT_SECRET']
REDIRECT_URI = os.environ['SPOTIFY_REDIRECT_URI']

SPOTIFY_API_BASE_URL = 'https://api.spotify.com'
API_VERSION = "v1"
SPOTIFY_API_URL = "{}/{}".format(SPOTIFY_API_BASE_URL, API_VERSION)

SPOTIFY_AUTH_BASE_URL = "https://accounts.spotify.com/{}"
SPOTIFY_AUTH_URL = SPOTIFY_AUTH_BASE_URL.format('authorize')
SPOTIFY_TOKEN_URL = SPOTIFY_AUTH_BASE_URL.format('api/token')

CLIENT_SIDE_URL = os.environ['CLIENT_SIDE_URL']
PORT = os.environ['PORT']
SCOPE = 'playlist-modify-public user-top-read user-read-private'
STATE = ''
SHOW_DIALOG_bool = True
SHOW_DIALOG_str = str(SHOW_DIALOG_bool).lower()


PARAMETERS = {
    "response_type": "code",
    "redirect_uri": REDIRECT_URI,
    "scope": SCOPE,
    # "state": STATE,
    # "show_dialog": SHOW_DIALOG_str,
    "client_id": CLIENT_ID
}

URL_ARGS = "&".join(["{}={}".format(key, urllibparse.quote(val))
                for key, val in list(PARAMETERS.items())])


AUTH_URL = "{}/?{}".format(SPOTIFY_AUTH_URL, URL_ARGS)


def authorize(auth_token):

    code_payload = {
        "grant_type": "authorization_code",
        "code": str(auth_token),
        "redirect_uri": REDIRECT_URI
    }
    
    base64encoded = base64.b64encode(("{}:{}".format(CLIENT_ID, CLIENT_SECRET)).encode())
    headers = {"Authorization": "Basic {}".format(base64encoded.decode())}
    

    post_request = requests.post(SPOTIFY_TOKEN_URL, data=code_payload,
                                 headers=headers)

    # tokens are returned to the app
    response_data = json.loads(post_request.text)
    access_token = response_data["access_token"]

    # use the access token to access Spotify API
    auth_header = {"Authorization": "Bearer {}".format(access_token)}
    return auth_header

def get_users_profile(auth_header):
    url = '{}/{}'.format(SPOTIFY_API_URL, 'me')
    res = requests.get(url, headers=auth_header)
    return res


def get_users_top_items(auth_header, sptype, timespan):
    url = '{}/{}/{}?time_range={}&limit=50'.format(SPOTIFY_API_URL, 'me', 'top', sptype, timespan)
    res = requests.get(url, headers=auth_header)
    return res

def get_audio_features(auth_header, query_string):
    url = '{}/{}?ids={}'.format(SPOTIFY_API_URL, 'audio-features', query_string)
    res = requests.get(url, headers=auth_header)
    return res
