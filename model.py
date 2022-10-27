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




class User(db.Model):
    '''A user.
    
    Information in this table retrieved by API call
    and should remain up to date with user's Spotify profile'''

    __tablename__ = 'users'

    user_id = db.Column(db.String(30),
                        primary_key=True)
    display_name = db.Column(db.String(30))
    profile_photo = db.Column(db.String)

    items = db.relationship('Item', back_populates='user')

    def __repr__(self):
        return f"<User user_id={user_id}>"

class Item(db.Model):
    """A user's top Spotify items.
    
    This will be used to filter through tracks and artists"""

    __tablename__ = 'items'

    id = db.Column(db.Integer,
                    autoincrement=True,
                    primary_key=True)
    user_id = db.Column(db.String(30), 
                        db.ForeignKey('users.user_id'),
                        nullable=False)
    date = db.Column(db.Integer, nullable=False)
    item_type = db.Column(db.String(10), nullable=False)
    timespan = db.Column(db.String(11), nullable=False)
    rank = db.Column(db.Integer, nullable=False)
    spotify_id = db.Column(db.String(22), nullable=False)

    user = db.relationship('User', back_populates='items')

    def __repr__(self):
        f'<Item id={id} user_id={user_id} item_type={item_type} spotify_id={spotify_id}>'

class Album(db.Model):
    '''An album'''

    __tablename__ = 'albums'

    album_id = db.Column(db.String(22),
                            primary_key=True)
    artist_id = db.Column(db.String(22),
                            db.ForeignKey('artists.artist_id'),
                            nullable=False)
    name = db.Column(db.String(50), nullable=False)
    release_year = db.Column(db.Integer)
    img_url = db.Column(db.String)

    artist = db.relationship('Artist', back_populates='albums')
    tracks = db.relationship('Track', back_populates='album')

    def __repr__(self):
        return f'<Album album_id={album_id} name={name}>'

class Track(db.Model):
    '''A single track'''

    __tablename__ = 'tracks'

    track_id = db.Column(db.String(22),
                            primary_key=True)
    artist_id = db.Column(db.String(22),
                            db.ForeignKey('artists.artist_id'),
                            nullable=False)
    album_id = db.Column(db.String(22),
                            db.ForeignKey('albums.album_id'),
                            nullable=False)
    name = db.Column(db.String(50), nullable=False)
    popularity = db.Column(db.Integer, nullable=False)
    
    artist = db.relationship('Artist', back_populates='tracks')
    album = db.relationship('Album', back_populates='tracks')
    feature = db.relationship('Feature', uselist=False, back_populates='track')

    def __repr__(self):
        return f'<Track track_id={track_id} name={name}>'

class Feature(db.Model):
    '''Audio features of a track.'''

    __tablename__ = "features"

    track_id = db.Column(db.String(22),
                        db.ForeignKey('tracks.track_id'),
                        primary_key=True)
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
    ### Better to use ints for key/mode/etc or convert to string?

    track = db.relationship('Track', uselist=False, back_populates='feature')
    

    def __repr__(self):
        return f'<Feature track_id={track_id}>'


class Artist(db.Model):
    '''An artist'''

    __tablename__ = 'artists'

    artist_id = db.Column(db.String(22),
                            primary_key=True)
    name = db.Column(db.String(50), nullable=False)
    ## These are for version 2
    # popularity = db.Column(db.Integer) #Only through artist item
    # followers = db.Column(db.Integer) #Only through artist item
    # img_url = db.Column(db.String) #Only through artist item
    
    albums = db.relationship('Album', back_populates='artist')
    tracks = db.relationship('Track', back_populates='artist')
    # artist_genres = db.relationship('ArtistGenre', back_populates='artist')

    def __repr__(self):
        return f'<Artist artist_id={artist_id} name={name}>'


###### Genres only come up in top artist search, add to V2

# class ArtistGenre(db.Model):
#     '''Connection between artists and genres.'''

#     __tablename__ = 'artists_genres'
#     __table_args__ = (db.UniqueConstraint
#                     ('artist_id', 'genre_id', 
#                     name='unique_artist_genre'))       
#     id = db.Column(db.Integer,
#                     autoincrement=True,
#                     primary_key=True)
#     artist_id = db.Column(db.String(22),
#                     ForeignKey(artists.artist_id),
#                     nullable=False)
#     genre = db.Column(db.String(30),
#                     ForeignKey(genres.genre),
#                     nullable=False)

#     artist = db.relationship('Artist', back_populates='artist_genres')
#     genres = db.relationship('Genre', back_populates='artist_genres')

#     def __repr__(self):
#         return f'<ArtistGenre id={id} artist_id={artist_id} genre={genre}>'

# class Genre(db.Model):
#     '''Music genres.'''

#     __tablename__ = 'genres'

#     genre = db.Column(db.String(30),
#                     primary_key=True,
#                     nullable=False)
#     is_seed = db.Column(db.Boolean,
#                         default=False,
#                         nullable=False)

#     artist_genres = db.relationship('ArtistGenre', back_populates='genres')

#     def __repr__(self):
#         return f"<Genre genre={genre}>"
    

                
    

if __name__ == "__main__":
    from server import app
    
    connect_to_db(app)
    db.create_all()
    
