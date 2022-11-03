// Track level chart

const url = '/track-data';
const queryUrl = `${url}?item_id=${selectedItem}` // selectedItem should be state set itemNav
    

fetch(queryUrl)
.then((response) => response.json())
.then((data) => {
  featuresData = data.featuresData;
  featuresLabels = data.featuresLabels
})


const testChart = {
  type: 'radar',
  data: data,
  options: {
    elements: {
      line: {
        borderWidth: 3
      }
    }
  },
};

const data = {
  labels: featuresLabels,
  datasets: [{
    label: '',
    data: featuresData,
    fill: true,
    backgroundColor: 'rgba(255, 99, 132, 0.2)',
    borderColor: 'rgb(255, 99, 132)',
    pointBackgroundColor: 'rgb(255, 99, 132)',
    pointBorderColor: '#fff',
    pointHoverBackgroundColor: '#fff',
    pointHoverBorderColor: 'rgb(255, 99, 132)'
  }, ]
};

