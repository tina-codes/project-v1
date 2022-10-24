'''Models for Spotify Unwrapped'''

from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


def connect_to_db(flask_app, db_uri="postgresql:///spotifyunwrapped"):
    flask_app.config["SQLALCHEMY_DATABASE_URI"] = db_uri
    flask_app.config["SQLALCHEMY_ECHO"] = False
    flask_app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

    db.app = flask_app
    db.init_app(flask_app)

    print("Connected to the db!")

# Data models go here

class User(db.Model):
    '''A user.'''

    __tablename__ = 'users'

    # user_id will be same as spotify user id
    # profile_photo is url
    user_id = db.Column(db.String(30),
                        primary_key=True)
    display_name = db.Column(db.String(30))
    profile_photo = db.Column(db.String)

    def __repr__(self):
        return f"<User user_id={self.user_id}>"

class TopItem(db.Model):
    """A users top Spotify items.
    
    This will be used to filter through tracks and artists"""

    __tablename__ = 'top_items'

    id = db.Column(db.Integer,
                    autoincrement=True,
                    primary_key=True)
    user_id = db.Column(db.String(30), 
                        db.ForeignKey('users.user_id'),
                        nullable=False)
    date = db.Column(db.DateTime, nullable=False) #can I default this to current time?
    sp_type = db.Column(db.String(10), nullable=False)
    timespan = db.Column(db.String(2), nullable=False)
    rank = db.Column(db.Integer, nullable=False)
    spotify_id = db.Column(db.String(22), nullable=False)

    def __repr__(self):
        f'<TopItem id={id} user_id={user_id} sp_type={sp_type} spotify_id={spotify_id}>'

class Album(db.Model):
'''An album'''

    __tablename__ = 'albums'

    album_id = db.Column(db.String(22),
                            primary_key=True)
    artist_id = db.Column(db.String(22),
                            db.ForeignKey('artist.artist_id'),
                            nullable=False)
    name = db.Column(db.String(50), nullable=False)
    release_date = db.Column(db.DateTime)
    img_url = db.Column(db.String)

    def __repr__(self):
        return f'<Album album_id={album_id} name={name}>'

class Tracks(db.Model):
    '''Track listings'''

    __tablename__ = 'tracks'

    track_id = db.Column(db.String(22),
                            primary_key=True)
    album_id = db.Column(db.String(22),
                            db.ForeignKey('albums.album_id'),
                            nullable=False)
    name = db.Column(db.String(50), nullable=False)
    popularity = db.Column(db.Integer, nullable=False)

    def __repr__(self):
        return f'<Track track_id={track_id} name={name}>'

class AudioFeatures(db.Model):
    '''Audio features of a track.'''

    __tablename__ = "audio_features"

    track_id = db.Column(db.String(22),
                        primary_key=True,
                        db.ForeignKey('tracks.track_id'))
    danceability = db.Column(db.Float, nullable=False)
    energy = db.Column(db.Float, nullable=False)
    key = db.Column(db.Integer, nullable=False)
    loudness = db.Column(db.Float, nullable=False)
    mode = db.Column(db.Integer, nullable=False)
    speechiness = db.Column(db.Float, nullable=False)
    acousticness = db.Column(db.Float, nullable=False)
    instrumentalness = db.Column(db.Float, nullable=False)
    liveness = db.Column(db.Float, nullable=False)
    valence = db.Column(db.Float, nullable=False)
    tempo = db.Column(db.Float, nullable=False)
    time_signature = db.Column(db.Integer, nullable=False)
    duration_ms = db.Column(db.Integer, nullable=False)

    def __repr__(self):
        return f'<AudioFeatures track_id={track_id}>'


class Artist(db.Model):
    '''An artist'''

    __tablename__ = 'artists'

    artist_id = db.Column(db.String(22),
                            primary_key=True)
    name = db.Column(db.String(50), nullable=False)
    popularity = db.Column(db.Integer)
    followers = db.Column(db.Integer)
    img_url = db.Column(db.String)

    def __repr__(self):
        return f'<Artist artist_id={artist_id} name={name}>'

class ArtistGenre(db.Model):
    '''Connection between artists and genres.'''

    __tablename__ = 'artists_genres'

    id = db.Column(db.Integer,
                    autoincrement=True,
                    primary_key=True)
    artist_id = db.Column(db.String(22),
                    ForeignKey(artists.artist_id),
                    nullable=False)
    genre = db.Column(db.String(30),
                    ForeignKey(genres.genre),
                    nullable=False)

    def __repr__(self):
        return f'<ArtistGenre id={id} artist_id={artist_id} genre={genre}>'

class Genre(db.Model):
    '''Music genres.'''

    __tablename__ = 'genres'

    genre = db.Column(db.String(30),
                    primary_key=True,
                    nullable=False)
    is_seed = db.Column(db.Boolean,
                        default=False,
                        nullable=False)

    def __repr__(self):
        return f"<Genre genre={genre}>"
    

                
    

if __name__ == "__main__":
    from server import app

    # Call connect_to_db(app, echo=False) if your program output gets
    # too annoying; this will tell SQLAlchemy not to print out every
    # query it executes.

    connect_to_db(app)