'''Dumps and recreates database for testing.'''

import os
import model
import server

os.system('dropdb spotifyunwrapped')
os.system('createdb spotifyunwrapped')
model.connect_to_db(server.app)
model.db.create_all()

