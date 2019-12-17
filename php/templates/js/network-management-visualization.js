
$(window).ready(function(){


/*

  TREEMAP

*/
/*
var tooltip = d3.select("body")
  .append("div")
  .style("position", "absolute")
  .style("z-index", "10")
  .style("visibility", "hidden")
  .attr('class','d3-tip');


var margin = {top: 40, right: 10, bottom: 10, left: 10},
    width = parseInt($( window ).width()) - margin.left - margin.right,
    height = parseInt($( window ).height()) - margin.top - margin.bottom;

var color = d3.scale.category10();

var treemap = d3.layout.treemap()
    .size([ width , height ])
  //  .sticky(true)
    .value(function(d) { return d.size; });

var div = d3.select("#treemap").append("div")
    .style("position", "absolute")
    .style("width", (width + margin.left + margin.right) + "px")
    .style("height", (height + margin.top + margin.bottom) + "px")
    .style("left", margin.left + "px")
    .style("top", margin.top + "px"); 

d3.json($("#fileJSONTree").val(), function(data) {
  var node = div.datum(data).selectAll(".node")
      .data(treemap.nodes)
      .enter().append("div")
      .attr("class", "node")
      .call(position)
      .style("background", function(d) {  if(d.children) return d.color; else return null; })
      .html(function(d) { return d.children ? null : "<p class='nodeText " + d.fontColor + "'>" + d.size + "</p>"; } )
      .on("mouseover", function(d){ 
        tooltip.style("visibility", "visible");
        tooltip.text(d.name + " [" + d.size + "]");
        })
      .on("mousemove", function(d){return tooltip.style("top", (event.pageY-10)+"px").style("left",(event.pageX+10)+"px");})
      .on("mouseout", function(d){return tooltip.style("visibility", "hidden");});

  d3.selectAll("input").on("change", function change() {
    var value = this.value === "count"
        ? function() { return 1; }
        : function(d) { return d.size; };

    node
        .data(treemap.value(value).nodes)
        .transition()
        .duration(1500)
        .call(position);
  });

});
/*
TREEMAP
*/



/*

  TREEMAP

*/

var tooltip = d3.select("body")
  .append("div")
  .style("position", "absolute")
  .style("z-index", "10")
  .style("visibility", "hidden")
  .attr('class','d3-tip');


var margin = {top: 40, right: 10, bottom: 10, left: 10},
    width = parseInt($( window ).width()) - margin.left - margin.right,
    height = parseInt($( window ).height()) - margin.top - margin.bottom;

var color = d3.scale.category10();

var treemap = d3.layout.treemap()
    .size([ width , height ])
  //  .sticky(true)
    .value(function(d) { return d.size; });

var div = d3.select("#treemapViz").append("div")
    .style("position", "absolute")
    .style("width", (width + margin.left + margin.right) + "px")
    .style("height", (height + margin.top + margin.bottom) + "px")
    .style("left", margin.left + "px")
    .style("top", margin.top + "px"); 

d3.json($("#fileJSONTreeViz").val(), function(data) {
  var node = div.datum(data).selectAll(".node")
      .data(treemap.nodes)
      .enter().append("div")
      .attr("class", "node")
      .call(position)
      .style("background", function(d) {  if(d.children) return d.color; else return null; })
      .html(function(d) { return d.children ? null : "<p class='nodeText " + d.fontColor + "'>" + d.size + "</p>"; } )
      .on("mouseover", function(d){ 
        tooltip.style("visibility", "visible");
        tooltip.text(d.name + " [" + d.size + "]");
        })
      .on("mousemove", function(d){return tooltip.style("top", (event.pageY-10)+"px").style("left",(event.pageX+10)+"px");})
      .on("mouseout", function(d){return tooltip.style("visibility", "hidden");});

  d3.selectAll("input").on("change", function change() {
    var value = this.value === "count"
        ? function() { return 1; }
        : function(d) { return d.size; };

    node
        .data(treemap.value(value).nodes)
        .transition()
        .duration(1500)
        .call(position);
  });

});
/*
TREEMAP
*/









/*

SUNBURST

*/

/*

var width = 800,
    height = 640,
    radius = Math.min(width, height) / 2,
    color = d3.scale.category20c();

var svg = d3.select("#sunburst").append("svg")
    .attr("width", width)
    .attr("height", height)
    .attr("background", "white")
    .append("g")
    .attr("transform", "translate(" + width / 2 + "," + height * .52 + ")");

var partition = d3.layout.partition()
    .sort(null)
    .size([2 * Math.PI, radius * radius])
    .value(function(d) { return 1; });

var arc = d3.svg.arc()
    .startAngle(function(d) { return d.x; })
    .endAngle(function(d) { return d.x + d.dx; })
    .innerRadius(function(d) { return Math.sqrt(d.y); })
    .outerRadius(function(d) { return Math.sqrt(d.y + d.dy); });

d3.json($("#fileJSONSunburst").val(), function(error, root) {
  var path = svg.datum(root).selectAll("path")
      .data(partition.nodes)
      .enter().append("path")
      .attr("display", function(d) { return d.name; })//console.log(d.name); return d.depth ? null : "none"; }) // hide inner ring
      .attr("d", arc)
      .style("stroke", "#fff")
      .style("fill", function(d) { return color((d.children ? d : d.parent).name); })
      .style("fill-rule", "evenodd")
      .each(stash);

  d3.selectAll("input").on("change", function change() {
    var value = this.value === "count"
        ? function() { return 1; }
        : function(d) { return d.size; };

    path
        .data(partition.value(value).nodes)
        .transition()
        .duration(1500)
        .attrTween("d", arcTween);
  });
});

// Stash the old values for transition.
function stash(d) {
  d.x0 = d.x;
  d.dx0 = d.dx;
}

// Interpolate the arcs in data space.
function arcTween(a) {
  var i = d3.interpolate({x: a.x0, dx: a.dx0}, a);
  return function(t) {
    var b = i(t);
    a.x0 = b.x;
    a.dx0 = b.dx;
    return arc(b);
  };
}

d3.select("#sunburst > svg").style("height", (height + 20) + "px");

/*
SUNBURST
*/


});

function position() {
  this.style("left", function(d) { return d.x + "px"; })
      .style("top", function(d) { return d.y + "px"; })
      .style("width", function(d) { return Math.max(0, d.dx - 1) + "px"; })
      .style("height", function(d) { return Math.max(0, d.dy - 1) + "px"; });
}
