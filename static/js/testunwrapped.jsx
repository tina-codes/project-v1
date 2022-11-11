// React Components for Unwrapped
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

function useGetItems(type, view) {
    const [data, setData] = React.useState(null);
    const [isLoading, setIsLoading] = React.useState(false);

    React.useEffect(() => {
        setIsLoading(true)
        console.log('Run UseEffect')
        console.log(type)
        console.log(view)
        const url = '/get-items';
        const queryUrl = `${url}?item_type=${type}&timespan=${view}`
        fetch(queryUrl)
        .then((response) => response.json())
        .then((returnedData) => {
            setData(returnedData)
            setIsLoading
            // setViewOptions(data.viewOptions);
            // setItems(data.items);
            // setSelectedItem(data.parentItem);
            // setParentItem(data.parentItem);
            console.log('fetch request completed')
            return data
            });
    }, []);
    return { isLoading, data };

};
    

// Main function that contains everything else
function GetData() {
    const [type, setType] = React.useState('track'); // Set by navbar onClick
    const [view, setView] = React.useState('short_term'); // Set by viewNav onClick
    const [viewOptions, setViewOptions] = React.useState([]); // Set by fetch req
    const [items, setItems] = React.useState([]); // Set by fetch req
    const [selectedItem, setSelectedItem] = React.useState({}); // set by itemNav onClick
    const [parentItem, setParentItem] = React.useState({});
    console.log("Rendering getData Component");

    function GetInitialData(props) {
        
        const { isLoading, data } = useGetItems(props.type, props.view);

        if (data === null) {
            return 'Loading...'
        }

        setViewOptions(data.viewOptions);
        setItems(data.items);
        setSelectedItem(data.parentItem);
        setParentItem(data.parentItem);

        return (
            <React.Fragment>
                {isLoading && <span>Loading.....</span>}
                {!isLoading (
                    <div id="navBar">
                        <button className="navbar" id="tracks" onClick={() => handleNavClick('track')}>Track</button>
                        <button className="navbar" id="artist" onClick={() => handleNavClick('artist')}>Artists</button>
                        <button className="navbar" id="genre" onClick={() => handleNavClick('genre')}>Genres</button>
                        <button className="navbar" id="profile">View Profile</button>
                    </div>
                )}
                
            </React.Fragment>
        )
    }
        

    // React.useEffect(() => {
    //     console.log('Run UseEffect')
    //     console.log(type)
    //     console.log(view)
    //     const queryUrl = `${url}?item_type=${type}&timespan=${view}`
    //     fetch(queryUrl)
    //     .then((response) => response.json())
    //     .then((data) => {
    //         setViewOptions(data.viewOptions);
    //         setItems(data.items);
    //         setSelectedItem(data.parentItem);
    //         setParentItem(data.parentItem);
    //         });
    // }, [type, view]);

    // React.useEffect(() => {
    //     console.log('CALLING TOP ARTISTS');
    //     fetch('/api/topartists')
    //     .then(() => {
    //         console.log('Top Artists Complete')
    //     });
    //     return () => { console.log("Cleanup"); }
    // }, []);
        
    // const itemOptions = createItemNavs(items); 

    if (selectedItem != {}) {
        createChart(selectedItem);
    };

    function displayChart() {
        if (chart) {
            chart.destroy();
        };
        createChart(selectedItem);
    };

    function handleParentSelect(parentItem) {
        console.log("Handle parent select");
        setSelectedItem(parentItem);
        displayChart(selectedItem);
    };

    function handleNonTrackSelect(item) {
        console.log("Handle non track select");
        const parent = item[0];
        const tracklist = item[1];
        setSelectedItem(parent);
        setParentItem(parent);
        setItems(tracklist);
        // CreateItemNavs(tracklist);
        displayChart(selectedItem);
    };

    function handleItemSelect(item) {
        console.log("Handle item select");
        setSelectedItem({'itemId': item.itemId,
                            'displayText': item.displayText,
                            'featureData': item.featureData});
        displayChart(selectedItem);
    };

    function handleNavClick(newType) {
        console.log("Handle nav click");
        setView('short_term');
        setType(newType);
        useGetItems(type, view);
    };

    function handleViewClick(view) {
        setView(view);
        useGetItems(type, view);
    };

    function CreateViewNavs(props) {

        const viewOptionsList = [];   

        for (const option of props.viewOptions) {
            viewOptionsList.push(
              <button className="viewLink" id={option.timespan} onClick={() => handleViewClick(option.timespan)}>{option.displayText}</button>
            );
        };
        return (
            <React.Fragment>
                {viewOptionsList}
            </React.Fragment> 
            );
    };

    function CreateItemNavs(props) {

        const itemOptions = [];
        
        if (props.type != 'track') {
            for (const item of props.items) {
                // const parItem = item[0]
                // const parItem2 = parItem[0]
                // const check = parItem2.itemId
                // console.log(check)
                // console.log(parItem2)
                // const itemId = item[0]['itemId']
                // const displayText = item[0]['displayText']
                itemOptions.push(
                    <li key={item.itemId}><button className="itemLink2" id={item.itemId} onClick={() => handleNonTrackSelect(item)}>{item.displayText}</button></li>
                    // <li key={item.itemId}><button className="itemLink"  id={item.itemId} onClick={() => handleItemSelect(item)}>{item.displayText}</button></li>
                );
                };
        } else {
            for (const item of props.items) {
                itemOptions.push(
                    <li key={item.itemId}><button className="itemLink"  id={item.itemId} onClick={() => handleItemSelect(item)}>{item.displayText}</button></li>
                );
                };
        };
        return (
            <React.Fragment>
                {itemOptions}
            </React.Fragment> 
            );
    };


    return (
        <React.Fragment>
            <div className="container">
                <div className="row">
                    <div className="col">
                        <GetInitialData type={type} view={view} />
                    </div>
                </div>
                <div className="row">
                    <div className="col">
                        <div className="row">
                            <div id="viewNav">
                            <CreateViewNavs viewOptions={viewOptions} />
                            </div>
                        </div>
                        <div className="row">
                            <div id="currentItem">
                            <ol>
                            <button className="currView" id={parentItem.itemId} onClick={() => handleParentSelect(parentItem)}>{parentItem.displayText}</button>
                            </ol>
                            </div>
                            <div id="itemNav">
                            <ol><CreateItemNavs items={items} type={type} /></ol>
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
};




ReactDOM.render(<GetData />, document.querySelector('#root'));
