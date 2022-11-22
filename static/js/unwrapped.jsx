let chart;

function createChart(chartItem) {

    if (chart) {
        chart.destroy();
    };

    chart = new Chart(document.querySelector('#dataChart'), {
        type: 'radar',
        data: {
            labels: [
                'acousticness',
                'danceability',
                'energy',
                'instrumentalness',
                'liveness',
                'speechiness',
                'valence'],
            datasets: [{
                data: chartItem.featureData.slice(0, 7),
                fill: true,
                backgroundColor: 'rgba(30, 215, 96, 0.2)',
                borderColor: 'rgb(30, 215, 96)',
                pointBackgroundColor: 'rgb(30, 215, 96)',
                pointBorderColor: '#fff',
                pointHoverBackgroundColor: '#fff',
                pointHoverBorderColor: 'rgb(30, 215, 96)'
            }, ]
            },
        options: {
            plugins: {
                legend: {
                    display: false
                },
                title: {
                    display: false,
                    text: chartItem.displayText
                }
            },
            scales: {
                r: {
                    angleLines: {
                        // display: false
                        color: 'rgba(255, 255, 255, 0.2)'
                    },
                    grid: {
                        color: 'rgba(255, 255, 255, 0.7)'
                    },
                    pointLabels: {
                        color: 'rgba(255, 255, 255)'
                    },
                    ticks: {
                        color: 'rgba(255, 255, 255)',
                        backdropColor: 'rgba(25, 20, 20, 0.5)'
                    },
                    suggestedMin: 0,
                    suggestedMax: 1,
                },
                
            },

        },
        });
    };


function CreateItemNavs(props) {
    return (
        <li key={props.itemId}><button className="itemLink" id={props.itemId} onClick={() => props.handleNonTrackSelect(props.item)}> {props.displayText}</button></li>
    );
}

function CreateItemNavsTrack(props) {
    return (
        <li key={props.itemId}><button className="itemLink" id={props.itemId} onClick={() => props.handleItemSelect(props.item)}> {props.displayText}</button></li>
    );
}

function ItemDetails(props) {
    const pitchNotation = ['C', 'C♯/D♭', 'D', 'D♯/E♭', 'E', 'F', 'F♯/G♭', 'G', 'G♯/A♭', 'A', 'A♯/B♭', 'B']
    const modeList = ['Minor', 'Major']
    const pitchInt = Math.round(props.pitchNotation)
    const pitch = pitchNotation[pitchInt]
    const modeInt = Math.round(props.mode)
    const mode = modeList[modeInt]


    return (
        <React.Fragment>
            <h6>{props.displayText}</h6>
            <div className="detailDisplay"><img className="artistImg" src={props.imgUrl}/></div>
            <div className="detailDisplay">
            <p>Popularity: {Math.round(props.popularity)} | Loudness: {Math.round(props.loudness)} | Tempo: {Math.round(props.tempo)} BPM</p>
            <p>Time Signature: {Math.round(props.timeSignature)}/4 | Key: {pitch} | Mode: {mode}</p>
            <p>Duration: {props.duration}</p>
            </div>
        </React.Fragment>
    );
};

// Main function that contains everything else
function GetData() {
    const [searchTerms, setSearchTerms] = React.useState({'type': 'track', 'view': 'short_term'});
    const [type, setType] = React.useState('track'); // Set by navbar onClick
    const [viewOptions, setViewOptions] = React.useState([]); // Set by fetch req
    const [view, setView] = React.useState('short_term'); // Set by viewNav onClick
    const [items, setItems] = React.useState([]); // Set by fetch req
    const [selectedItem, setSelectedItem] = React.useState({}); // set by itemNav onClick
    const [parentItem, setParentItem] = React.useState({});
    const [navType, setNavType] = React.useState('track');
    const [profilePhoto, setProfilePhoto] = React.useState('');

    const url = '/get-items';


    React.useEffect(() => {
        const queryUrl = `${url}?item_type=${searchTerms.type}&timespan=${searchTerms.view}`
        fetch(queryUrl)
        .then((response) => response.json())
        .then((data) => {
            setViewOptions(data.viewOptions);
            setItems(data.items);
            setNavType(searchTerms.type);
            setSelectedItem(data.parentItem);
            setParentItem(data.parentItem);
            setProfilePhoto(data.photo);
            displayChart(data.parentItem);
        });
    }, [searchTerms]);

    const createItemOptions = React.useMemo(() => {
        const itemOptions = [];

        for (const item of items) {
        
            if ((navType === 'genre') || (navType === 'artist')) {
                const itemId = item[0]['itemId']
                const displayText = item[0]['displayText']
                itemOptions.push(
                    <CreateItemNavs 
                        key={itemId}
                        id={itemId}
                        displayText={displayText}
                        handleNonTrackSelect={handleNonTrackSelect}
                        item={item}
                    />
                );
            } else {
                itemOptions.push(
                    <CreateItemNavsTrack 
                        key={item.itemId}
                        id={item.itemId}
                        displayText={item.displayText}
                        item={item}
                        handleItemSelect={handleItemSelect}
                    />
                );
            };
        };
        return itemOptions
    }, [navType, items]);
    
    console.log(profilePhoto)  //////////////////////////
    const displayDetails = [];

    if (selectedItem.featureData !== undefined) {
        displayDetails.push(
            <ItemDetails
            key={selectedItem.itemId}
            imgUrl={selectedItem.imgUrl}
            displayText={selectedItem.displayText}
            popularity={selectedItem.featureData[13]}
            loudness={selectedItem.featureData[11]}
            tempo={selectedItem.featureData[12]}
            timeSignature={selectedItem.featureData[8]}
            pitchNotation={selectedItem.featureData[9]}
            mode={selectedItem.featureData[10]}
            duration={selectedItem.featureData[7]}
            />
        );
    };


    const viewOptionsList = [];    

    for (const option of viewOptions) {
        viewOptionsList.push(
          <button className="viewLink" key={option.timespan} id={option.timespan} onClick={() => handleViewSelect(option.timespan)}>{option.displayText}</button>
        );
    };

    function displayChart(chartItem) {
        if (chart) {
            chart.destroy();
        };
        createChart(chartItem);
    };

    function handleParentSelect(parentItem) {
        setSelectedItem(parentItem);
        displayChart(parentItem);
    };

    function handleNonTrackSelect(item) {
        const parent = item[0]
        const tracklist = item[1]['items']
        setNavType('track')
        setItems(tracklist);
        setSelectedItem(parent);
        setParentItem(parent);
        displayChart(parent);
    };

    function handleItemSelect(item) {
        setSelectedItem({'itemId': item.itemId,
                            'displayText': item.displayText,
                            'imgUrl': item.imgUrl,
                            'featureData': item.featureData,
                            'itemType': item.itemType});
        displayChart({'itemId': item.itemId,
        'displayText': item.displayText,
        'imgUrl': item.imgUrl,
        'featureData': item.featureData,
        'itemType': item.itemType});
    };

    function handleNavClick(newType) {
        setType(newType);
        setSearchTerms({'type': newType, 'view': 'short_term'});
    };

    function handleNavClickTracks(newType) {
        setNavType('track');
        setType(newType);
        setSearchTerms({'type': newType, 'view': 'short_term'})
    };

    function handleViewSelect(newView) {
        setView(newView);
        setSearchTerms({'type': type, 'view': newView})
    };


    return (
        <React.Fragment>
            <div className="container">
                <div className="row">
                    <div className="col">
                        <div className="row">
                            <div className="col">
                            <button className="navbar" id="track" onClick={() => handleNavClickTracks('track')}>Tracks</button>
                            </div>
                            <div className="col">
                            <button className="navbar" id="artist" onClick={() => handleNavClick('artist')}>Artists</button>
                            </div>
                            <div className="col">
                            <button className="navbar" id="genre" onClick={() => handleNavClick('genre')}>Genres</button>
                            </div>
                            <div className="col">
                            <a href="/profile" className="navbar" id="profile">Profile</a>
                            </div>
                            <div className="col">
                            <a href="/unwrapped" className="navbar" id="profilePhoto">
                                <img className="profileImg" src={profilePhoto}/>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div className="row">
                    <div className="col">
                        <div className="row">
                            <div id="viewNav">
                                {viewOptionsList}
                            </div>
                        </div>
                        <div className="row">
                            <div id="currentItem">
                            <ol>
                            <button className="currView" id={parentItem.itemId} onClick={() => handleParentSelect(parentItem)}>{parentItem.displayText}</button>
                            </ol>
                            </div>
                            <div id="itemNav">
                            <ol>{createItemOptions}</ol>
                            </div>
                        </div>
                    </div>
                    <div className="col">
                        <div id="detailDisplay">
                            {displayDetails}
                        </div>
                        <div id="chartDisplay">
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

ReactDOM.render(<GetData />, document.querySelector('#root'));

