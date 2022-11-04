// top_track level chart

const url = '/top-tracks-data';
const queryUrl = `${url}?timespan=${selectedItem}` // selectedItem should be state set itemNav
    

fetch(queryUrl)
.then((response) => response.json())
.then((data) => {
  featuresData = data.featuresData;
  featuresLabels = data.featuresLabels
})


const config = {
  type: 'scatter',
  data: data,
  options: {
    scales: {
      x: {
        type: 'linear',
        position: 'bottom'
      }
    }
  }
};

const data = {
  datasets: [{
    label: 'Scatter Dataset',
    data: [{
      x: -10,
      y: 0
    }, {
      x: 0,
      y: 10
    }, {
      x: 10,
      y: 5
    }, {
      x: 0.5,
      y: 5.5
    }],
    backgroundColor: 'rgb(255, 99, 132)'
  }],
};