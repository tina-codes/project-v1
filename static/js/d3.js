'use strict';

// (() => {
//   console.log('hi!');
// })();

// (() => {
//     const svg = d3.select('#vis-decades svg');
  
//     svg
//       .selectAll('rect')
//       .data([6, 6, 11, 9, 7, 75, 12])
//       .enter()
//       .append('rect')
//       .attr('y', (num, idx) => idx * 40)
//       .attr('x', 0)
//       .attr('width', (num) => num)
//       .attr('height', 30)
//       .attr('fill', (num, idx) => d3.hsl(idx * 30, 1.0, 0.8));
//   })();

(() => {
const svg = d3.select('#datavis svg');

svg
    .selectAll('rect')
    .data([6, 6, 11, 9, 7, 75, 12])
    .enter()
    .append('rect')
    .attr('y', (num, idx) => idx * 40)
    .attr('x', 0)
    .attr('width', (num) => num)
    .attr('height', 30)
    .attr('fill', (num, idx) => d3.hsl(idx * 30, 1.0, 0.8));
})();