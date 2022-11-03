// React Components for Unwrapped

//////// need to create CurrentItem - similar to ItemNav but for all tracks

function ItemNav(props) {
// Takes in list of items to show in item nav (ex top tracks)
// On click will set selectedItem

    return (
        <li><button className="itemLink" id={props.id}>{props.displayText}</button></li>
    );
};

function ViewNav(props) {
    // Takes in list of items to show in item nav (ex top tracks)
    // On click will set view
        return (
            <button className="viewLink" id={props.id}>{props.displayText}</button>
        );
    };

// This component displays if selectedItem a track
function DisplayDetails(props) {
    return (
        <h4>{props.artist} - {props.name}</h4>
    );
};

// This component displays if selectedItem is top_tracks
function DisplayNav(props) {
    return (
        <button className="displayNav" id={props.option}>{props.option}</button>
    );
};

    // Main function that contains everything else
function GetData() {
    const [type, setType] = React.useState('track'); // Set by navbar onClick
    const [viewOptions, setViewOptions] = React.useState([]); // Set by fetch req
    const [view, setView] = React.useState('short_term'); // Set by viewNav onClick
    const [items, setItems] = React.useState([]); // Set by fetch req
    const [selectedItem, setSelectedItem] = React.useState('top_tracks'); // set by itemNav onClick
    
    
    const url = '/get-items';
    const queryUrl = `${url}?item_type=${type}&timespan=${view}` // Tell crud function what to send back
    
    React.useEffect(() => {
        fetch(queryUrl)
        .then((response) => response.json())
        .then((data) => {
          setViewOptions(data.viewOptions);
          setItems(data.items);
        });
      }, []); /// setView can be called other places than just the ViewNav
    
    const viewOptionsList = [];
    const itemOptions = [];
    
    for (const option of viewOptions) {
        viewOptionsList.push(
          <ViewNav 
          key={option.timespan}
          id={option.timespan}
          displayText={option.displayText}
          />
        );
    };
    
    for (const item of items) {
      itemOptions.push(
          <ItemNav
          key={item.itemId}
          id={item.itemId}
          displayText={item.displayText}
          />
      );
      };

    
    const displayNavWindow = [];
        
    if (selectedItem === 'top_tracks') {
        const displayNav = [
            'acousticness',
            'danceability',
            'energy',
            'instrumentalness',
            'liveness',
            'speechiness',
            'valence'];

        for (const option of displayNav) {
            displayNavWindow.push(
                <DisplayNav
                key={option}
                option={option}
                />
            );
        };
    } else {
        for (const item of items) {
            if (item.itemID === selectedItem) {
                displayNavWindow.push(
                    <DisplayDetails
                    artist={item.artist}
                    name={item.name}
                    />
                );
            };
        };
    };


    return (
        <React.Fragment>
            <div className="container">
                <div className="row">
                    <div className="col"><div id="navBar"><NavBar /></div></div>
                </div>
                <div className="row">
                    <div className="col">
                        <div id="viewNav">
                            {viewOptionsList}
                        </div>
                        <div id="currentItem">
                        <h2>Top Tracks:</h2>
                        </div>
                        <div id="itemNav">
                        <ol>{itemOptions}</ol>
                        </div>
                    </div>
                    <div className="col">
                        <div id="displayNav">
                        {displayNavWindow}
                        </div>
                        <div id="chartDisplay">
                            DISPLAY CHART HERE
                            <canvas id="dataChart" width="400" height="400"></canvas>
                        </div>
                    </div>
                </div>
                <div className="row">
                    <div className="col">
                        <div id="footer">Footer links go here</div>
                    </div>
                </div>
            </div>
        </React.Fragment>
    );

}

function NavBar() {

    return (
      <React.Fragment>
        <button className="navbar" key="tracks">Tracks</button>
        <button className="navbar" key="profile">View Profile</button>
      </React.Fragment>
    );
  };


// pass selectedItem as props






ReactDOM.render(<GetData />, document.querySelector('#root'));


