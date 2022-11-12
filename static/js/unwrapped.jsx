let chart;

function createChart(selectedItem) {

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
                // label: selectedItem.displayText,
                data: selectedItem.featureData,
                fill: true,
                backgroundColor: 'rgba(255, 99, 132, 0.2)',
                borderColor: 'rgb(255, 99, 132)',
                pointBackgroundColor: 'rgb(255, 99, 132)',
                pointBorderColor: '#fff',
                pointHoverBackgroundColor: '#fff',
                pointHoverBorderColor: 'rgb(255, 99, 132)'
            }, ]
            },
        options: {
            plugins: {
                legend: {
                    display: false
                },
                title: {
                    display: true,
                    text: selectedItem.displayText
                }
            },
            scales: {
                r: {
                    angleLines: {
                        display: false
                    },
                    suggestedMin: 0,
                    suggestedMax: 1
                }
            }
        },
        });
    };


function CreateItemNavs(props) {
    return (
        <li><button className="itemLink" id={props.itemId} onClick={() => props.handleNonTrackSelect(props.item)}> {props.displayText}</button></li>
    );
}

function CreateItemNavsTrack(props) {
    return (
        <li><button className="itemLink" id={props.itemId} onClick={() => props.handleItemSelect(props.item)}> {props.displayText}</button></li>
    );
}

// Main function that contains everything else
function GetData() {

    const [searchTerms, setSearchTerms] = React.useState({'type': 'track', 'view': 'short_term'})
    
    console.log("#########  Rendering GetData  #########");
    // console.log('type:', type)
    // console.log('viewOptions:', viewOptions)
    // console.log('view:', view)
    // console.log('selectedItem:', selectedItem)
    // console.log('parentItem:', parentItem)
    // console.log('navType:', navType)
    // console.log('searchTerms:', searchTerms)
    // console.log('items:', items)

    const url = '/get-items';

    React.useEffect(() => {
        console.log('#########  Running UseEffect  #########')
        // console.log(`type: ${type} searchTerms.type ${searchTerms.type}`)
        // console.log(`view: ${view} searchTerms.view ${searchTerms.view}`)
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
            });
            console.log("#########  Finishing Fetch Request  #########");
            console.log('type:', type)
            console.log('viewOptions:', viewOptions)
            console.log('view:', view)
            console.log('selectedItem:', selectedItem)
            console.log('parentItem:', parentItem)
            console.log('navType:', navType)
            console.log('searchTerms:', searchTerms)
            console.log('items:', items)
    }, [searchTerms]);

    const [type, setType] = React.useState('track'); // Set by navbar onClick
    const [viewOptions, setViewOptions] = React.useState([]); // Set by fetch req
    const [view, setView] = React.useState('short_term'); // Set by viewNav onClick
    const [items, setItems] = React.useState([]); // Set by fetch req
    const [selectedItem, setSelectedItem] = React.useState({}); // set by itemNav onClick
    const [parentItem, setParentItem] = React.useState({});
    const [navType, setNavType] = React.useState('track')
    const [profilePhoto, setProfilePhoto] = React.useState('')
    
    const itemOptions = [];

    console.log('#########  Creating Item Navs  #########')
        console.log('type:', type)
        console.log('viewOptions:', viewOptions)
        console.log('view:', view)
        console.log('selectedItem:', selectedItem)
        console.log('parentItem:', parentItem)
        console.log('navType:', navType)
        console.log('searchTerms:', searchTerms)
        console.log('items:', items)

    for (const item of items) {
        if ((navType === 'genre') || (navType === 'artist')) {
            const itemId = item[0]['itemId']
            const displayText = item[0]['displayText']
            console.log('### CreateItemNavs Nontracks ###')
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
            console.log('### CreateItemNavs Tracks ###')
            // console.log(item.itemId)
            // console.log(item.displayText)
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

    // console.log("NavItems");
    // console.log(itemOptions);

    if (selectedItem != {}) {
        createChart(selectedItem);
    };

    const viewOptionsList = [];    

    for (const option of viewOptions) {
        viewOptionsList.push(
          <button className="viewLink" key= {option.timespan} id={option.timespan} onClick={() => handleViewSelect(option.timespan)}>{option.displayText}</button>
        );
    };

    function displayChart() {
        if (chart) {
            chart.destroy();
        };
        createChart(selectedItem);
    };

    function handleParentSelect(parentItem) {
        console.log("!!!!!!!!!!!!!!!!!!!!!!!! Handle parent select");
        setSelectedItem(parentItem);
        displayChart(selectedItem);
    };

    function handleNonTrackSelect(item) {
        console.log("!!!!!!!!!!!!!!!!!!!!!!!! Handle non track select");
        const parent = item[0]
        const tracklist = item[1]['items']
        setNavType('track')
        setItems(tracklist);
        setSelectedItem(parent);
        setParentItem(parent);
        displayChart(selectedItem);
    };

    function handleItemSelect(item) {
        console.log("!!!!!!!!!!!!!!!!!!!!!!!! Handle track select");
        setSelectedItem({'itemId': item.itemId,
                            'displayText': item.displayText,
                            'featureData': item.featureData,
                            'itemType': item.itemType});
        displayChart(selectedItem);
    };

    function handleNavClick(newType) {
        console.log("!!!!!!!!!!!!!!!!!!!!!!!! Handle Nav select");
        // setNavType(newType);
        setType(newType);
        // setView('short_term');
        // handleSearchTerms();
        setSearchTerms({'type': newType, 'view': 'short_term'})
    };

    function handleViewSelect(newView) {
        console.log("!!!!!!!!!!!!!!!!!!!!!!!! Handle view select");
        setView(newView);
        // handleSearchTerms();
        setSearchTerms({'type': type, 'view': newView})
    };


    return (
        <React.Fragment>
            <div className="container">
                <div className="row">
                    <div className="col">
                        <div id="navBar">
                        <button className="navbar" id="track" onClick={() => handleNavClick('track')}>Track</button>
                        <button className="navbar" id="artist" onClick={() => handleNavClick('artist')}>Artists</button>
                        <button className="navbar" id="genre" onClick={() => handleNavClick('genre')}>Genres</button>
                        <a href="/profile" className="navbar" id="profile"><img src={profilePhoto}/></a>
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
                            <ol>{itemOptions}</ol>
                            </div>
                        </div>
                    </div>
                    <div className="col">
                        <div id="displayNav">
                        {/* {displayNavWindow} */}
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

