# Unwrapped for <img src="/static/images/Spotify_Logo_RGB_Green.png" alt="Artist View" height="35"/>
Unwrapped allows users to explore the data behind the music they love. When a user logs in through the Spotify OAuth process, the application requests their top tracks and artists from the Spotify API, which are appended to the PostgreSQL database for quick retrieval. Users are then brought to the main page, where they can explore the audio feature data for their top tracks, the top tracks for their top artists, or their top genres. This page is implemented fully in React, with visualizations generated using Chart.js. If a user's Spotify friends have also logged in to Unwrapped, they will appear on the user profile page, where they can view each other's Unwrapped data as well.

Learn more about the developer: <a href="https://www.linkedin.com/in/christinanicosia/" target="_blank">https://www.linkedin.com/in/christinanicosia/</a>

## Table of Contents
* [Tech Stack](#tech)
* [Spotify Authorization Flow](#authflow)
* [Data Model](#data)
* [Front End](#frontend)
* [User Views & Options](#views)
* [Top Tracks View](#tracks)
* [Top Artists View](#artists)
* [Top Genres View](#genres)
* [Friends View](#friends)

## <a name="tech"></a>Tech Stack
(dependencies are listed in requirements.txt)
* Python
* Flask
* PostgresSQL
* SQLAlchemy
* React
* Javascript
* Jinja
* Bootstrap
* Chart.js
* Spotify API

## 

## <a name="authflow"></a>Spotify Authorization Flow
The Authorization Flow and Spotify API call utilities are found in spotify.py 
and were adapted from <a href="https://github.com/hereismari/spotify-flask" target="_blank">spotify-flask</a>.

## <a name="datamodel"></a>Data Model
The data model was built to create a division between user data and music catalog data. 
User's top items are stored in the items table, and the spotify_id column references the
artist or track catalog items.
<img src="/static/images/UnwrappedDataModel.png" alt="Data Model" width="700"/>

## <a name="frontend"></a>Front End
The main page of the application was built using React to allow users to interact with their
Spotify data all within one page. A useEffect hook manages AJAX requests which fetch new data
when the user selects an item type from the main navitation or a timespan from the view 
options menu, and a useMemo hook prevents components from updating unnecessarily. 
The page relies heavily on state logic to dictate what data appears where, and when.
Charts are created using Chart.js and are displayed for both track level and aggregate data.

## <a name="views"></a>User Views & Options
The Spotify API allows for the retrieval of a user's top 50 tracks or artists from three
timespans - short term (1 month), medium term (6 months) or long term (all time). 

## <a name="tracks"></a>Top Tracks View
Users can view their top tracks for either of the three timespans. The default view is
short term, and aggregate data for each timespan is also shown.
<img src="/static/images/trackview.gif" alt="Track View" width="700"/>


## <a name="artists"></a>Top Artists View
When a user first logs in to Unwrapped, the application sends API requests for the top 
tracks for each of a user's top artists, generating meaninful data for each of the
artists on a user's list. When selecting the artist view the item navigation component
is initially populated with the list of artists, and upon selecting an artist the
component is re-rendered with a list of that artist's tracks.
<img src="/static/images/artistview.gif" alt="Artist View" width="700"/>


## <a name="genres"></a>Top Genres View
In Spotify's data model, artists have genres but tracks do not. My goal in building this 
application is to add features that enable music discovery, especially by genre exploration,
so the ability to explore tracks by genre was an important one. To enable the genre view
the application queries the database for the genres of the user's top artists, and then
queries the database for any tracks by artists associated with those genres. These artists
and tracks may have been brought into the database via another user's top lists, so will
expand beyond the tracks and artists known to the user.
<img src="/static/images/genreview.gif" alt="Genre View" width="700"/>


## <a name="friends"></a>Friends View
If a user follows or is followed by another Unwrapped user on Spotify, these users will 
automatically be friended on Unwrapped. A user can view a friend's Unwrapped data by 
selecting them from the friend list on the profile page. 
<img src="/static/images/friendview.gif" alt="Friend View" width="700"/>


## <a name="friends"></a>Upcoming Features
I plan to keep working on this application and to add the following features:
* Music taste visualizations
* Album view
* Similar artists view
* User playlist view
* Historical snapshots
* Preview and like tracks
* Recommendation algorithm
* Playlist creation

