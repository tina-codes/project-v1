""" Crud operations """

from model import db, connect_to_db #need to add tables once they're created


# Crud functions go here

if __name__ == '__main__':
    from server import app
    connect_to_db(app)