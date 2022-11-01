// React Components for Unwrapped

// Custom hook to change style of selected nav item
// function useNav() {
//     const [isClicked, setIsClicked] = useState(null);

//     useEffect(() => {
//         function handleNavClick(navClick) {
//             setIsClicked(navClick.isClicked);
//         }

    
//     })

// }

// function navBarItem(props) {
//     const isClicked = useNav(props.Item.name);

//     return (
//         <li style={{ color: isClicked ? 'green' : 'white' }}>
//             {props.Item.name}
//         </li>
//     );
// }


function ViewItem(props) {
// Takes in list of items to show in item nav (ex top tracks)
// !!! Will have to add link to chart or whatever
    return (
        <li> {props.rank} {props.artist} - {props.name}</li>
    );
}

function ItemNavContainer() {
// Populates ItemNav
    const [items, setItems] = React.useState([]);
    const [itemType, setType] = React.useState('track');
    const [timespan, setTimespan] = React.useState('short_term');

    React.useEffect(() => {
        fetch('/change-view', {
            method: 'POST',
            headers: {
              'content-type': 'application/json',
            },
            body: JSON.stringify({ "item_type": itemType, "timespan": timespan })
          })
        .then((response) => response.json())
        .then((data) => setItems(data.items))
    }, []);

    const topItems = [];

    for (const currentItem of items) {
        topItems.push(
            <ViewItem
                key={currentItem.rank}
                rank={currentItem.rank}
                artist={currentItem.artist}
                name={currentItem.name}
            />
        );
    }

    return (
        <React.Fragment>
            <div id="current">
                <h2>Top Tracks:</h2>
            </div>
            <div id="itemNav">
                <ul>{topItems}</ul>
            </div>
        </React.Fragment>
    );

}

ReactDOM.render(<ItemNavContainer />, document.querySelector('.container'));


function SelectView(props) {
    const [itemType, setType] = React.useState('');
    const [timespan, setTimespan] = React.useState('');
  
    function changeView() {
      fetch('/change-view', {
        method: 'POST',
        headers: {
          'content-type': 'application/json',
        },
        body: JSON.stringify({ "item_type": itemType, "timespan": timespan })
      })
        .then((response) => response.json())
        .then((jsonResponse) => {
          const cardAdded = jsonResponse.cardAdded;
          props.addCard(cardAdded);
        });
    }
    return (
      <React.Fragment>
        <div id="navBar">
            
        </div>



        <div id="viewNav">
            <input type="button"
            value={short_term}
            onClick={(event) => setTimespan(event.target.value)}
            >Month</input>
            <input type="button"
            value={medium_term}
            onClick={(event) => setTimespan(event.target.value)}
            >Six Months</input>
            <input type="button"
            value={long_term}
            onClick={(event) => setTimespan(event.target.value)}
            >All Time</input>
        </div>

        <h2>Add New Trading Card</h2>
        <label htmlFor="nameInput">Name</label>
        <input
          value={name}
          onChange={(event) => setName(event.target.value)}
          id="nameInput"
          style={{ marginLeft: "5px" }}
        ></input>
        <label
          htmlFor="skillInput"
          style={{ marginLeft: "10px", marginRight: "5px" }}
        >
          Skill
        </label>
        <input
          value={skill}
          onChange={(event) => setSkill(event.target.value)}
          id="skillInput"
        ></input>
        <button style={{ marginLeft: "10px" }} onClick={addNewCard}>
          Add
        </button>
      </React.Fragment>
    );
  }
  
  ReactDOM.render(<TradingCardContainer />, document.getElementById('container'));
  