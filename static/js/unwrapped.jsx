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
                label: selectedItem.displayText,
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
        });
    };

// Main function that contains everything else
function GetData() {
    const [type, setType] = React.useState('track'); // Set by navbar onClick
    const [viewOptions, setViewOptions] = React.useState([]); // Set by fetch req
    const [view, setView] = React.useState('short_term'); // Set by viewNav onClick
    const [items, setItems] = React.useState([]); // Set by fetch req
    const [selectedItem, setSelectedItem] = React.useState({}); // set by itemNav onClick
    
    
    const url = '/get-items';
    const queryUrl = `${url}?item_type=${type}&timespan=${view}` // Tell crud function what to send back
    
    React.useEffect(() => {
        fetch(queryUrl)
        .then((response) => response.json())
        .then((data) => {
          setViewOptions(data.viewOptions);
          setItems(data.items);
          setSelectedItem({'itemId': data.ttItem.itemId,
                        'displayText': data.ttItem.displayText,
                        'featureData': data.ttItem.featureData});
            console.log(data)
            console.log(type)
            console.log(view)
            console.log(`XXX ${data.ttItem.itemId}`);
            console.log(`YYY${selectedItem}`);   
        });
      }, [type, view]);


    if (selectedItem != {}) {
        console.log(selectedItem)
    createChart(selectedItem);
    }

    
    
    const viewOptionsList = [];
    const itemOptions = [];
    
    for (const option of viewOptions) {
        viewOptionsList.push(
          <button className="viewLink" id={option.timespan} onClick={() => setView(option.timespan)}>{option.displayText}</button>
        );
    };
    
    for (const item of items) {
      itemOptions.push(
          <li><button className="itemLink" id={item.itemId} onClick={() => handleItemSelect(item)}>{item.displayText}</button></li>
      );
      };

    function handleItemSelect(item) {
        setSelectedItem({'itemId': item.itemId,
                        'displayText': item.displayText,
                        'featureData': item.featureData});

        if (chart) {
            chart.destroy();
        };
        
        createChart(selectedItem);
    };



    return (
        <React.Fragment>
            <div className="container">
                <div className="row">
                    <div className="col">
                        <div id="navBar">
                        <button className="navbar" id="tracks" onClick={() => setType('track')}>Tracks</button>
                        <button className="navbar" id="profile">View Profile</button>
                        </div>
                    </div>
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
                        {/* {displayNavWindow} */}
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

ReactDOM.render(<GetData />, document.querySelector('#root'));


// const displayNavWindow = [];
        
    // if (selectedItem === 'top_tracks') {
    //     const displayNav = [
    //         'acousticness',
    //         'danceability',
    //         'energy',
    //         'instrumentalness',
    //         'liveness',
    //         'speechiness',
    //         'valence'];

    //     for (const option of displayNav) {
    //         displayNavWindow.push(
    //             <button className="displayNav" key={option} id={option}>{option}</button>
    //         );
    //     };
    // } else {
    //     for (const item in items) {
    //         if (item.itemID === selectedItem) {
    //             console.log('later');
    //             console.log(items);
    //             console.log(selectedItem);
    //             displayNavWindow.push(
    //                 <div>{item.artist} - {item.name}</div>
    //             );
    //         };
    //     };
    // };