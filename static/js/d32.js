
// set the dimensions and margins of the graph
var margin = {top: 30, right: 30, bottom: 70, left: 60},
    width = 460 - margin.left - margin.right,
    height = 400 - margin.top - margin.bottom;

// append the svg object to the body of the page
var svg = d3.select("#datavis")
  .append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform",
          "translate(" + margin.left + "," + margin.top + ")");

// Parse the Data
d3.csv("https://raw.githubusercontent.com/holtzy/data_to_viz/master/Example_dataset/7_OneCatOneNum_header.csv", function(data) {

// X axis
var x = d3.scaleBand()
  .range([ 0, width ])
  .domain(data.map(function(d) { return d.Country; }))
  .padding(0.2);
svg.append("g")
  .attr("transform", "translate(0," + height + ")")
  .call(d3.axisBottom(x))
  .selectAll("text")
    .attr("transform", "translate(-10,0)rotate(-45)")
    .style("text-anchor", "end");

// Add Y axis
var y = d3.scaleLinear()
  .domain([0, 13000])
  .range([ height, 0]);
svg.append("g")
  .call(d3.axisLeft(y));

// Bars
svg.selectAll("mybar")
  .data(data)
  .enter()
  .append("rect")
    .attr("x", function(d) { return x(d.Country); })
    .attr("y", function(d) { return y(d.Value); })
    .attr("width", x.bandwidth())
    .attr("height", function(d) { return height - y(d.Value); })
    .attr("fill", "#69b3a2")

})




// (() => {
// const tracksPerDecade = [
//     { decade: '1960s', tracks: 3 },
//     { decade: '1970s', tracks: 12 },
//     { decade: '1980s', tracks: 2 },
//     { decade: '1990s', tracks: 8 },
//     { decade: '2000s', tracks: 10 },
//     { decade: '2010s', tracks: 68 },
//     { decade: '2020s', tracks: 29},
// ];

// // Dimensions we'll use to calculate the positions, widths, and heights of
// // our shapes.
// //
// // Each group will have a 150x150 rectangle in it. We also have a margin so
// // they're not all crammed together
// const groupWidth = 150;
// const groupHeight = 150;
// const margin = 10;

// const svg = d3
//     .select('#vis-decades')
//     .append('svg')
//     .attr('width', '100%')
//     .attr('height', '100%');

// const groups = svg
//     .selectAll('g') // 'g' is the SVG group element
//     .data(tracksPerDecade)
//     .enter()
//     .append('g')
//     // Set the position of each group based on index number
//     .attr('transform', (data, idx) => `translate(${idx * (groupWidth + margin)}, 0)`);

// groups
//     .append('rect')
//     .attr('width', groupWidth)
//     .attr('height', groupHeight)
//     .attr('fill', 'transparent')
//     .attr('stroke', 'rgb(111, 111, 111)');

// groups
//     .append('circle')
//     .attr('cx', groupWidth / 2)
//     .attr('cy', groupHeight / 2)
//     .attr('fill', 'rgba(111, 111, 111, 0.2)')
//     .attr('r', (data) => {
//     // Use # of repos to calculate radius of circle.

//     // Before we can do that, we need to generate a d3 function that will
//     // scale our # of repos so that the circle will fit inside its group
//     const getScaledNum = d3
//         .scaleLinear()
//         .domain([
//         reposPerLang[reposPerLang.length - 1].repos, // Smallest # of repos
//         reposPerLang[0].repos, // Largest # of repos
//         ])
//         .range([10, groupWidth / 2 - 5]);

//     return getScaledNum(data.repos);
//     });

// groups
//     .append('svg')
//     .attr('width', groupWidth)
//     .attr('height', groupHeight)
//     .append('text')
//     .attr('x', '50%')
//     .attr('y', '50%')
//     .attr('dominant-baseline', 'middle')
//     .attr('text-anchor', 'middle')
//     .text((data) => data.language);
// })();