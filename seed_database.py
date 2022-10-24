"""Script to seed database."""

import os
import json
from random import choice, randint
from datetime import datetime

import crud
import model
import server

os.system("dropdb spotifyunwrapped")
os.system('createdb spotifyunwrapped')
model.connect_to_db(server.app)
model.db.create_all()

with open('FILENAME HERE') as f:
    test_data = json.loads(f.read())


# Add functions here