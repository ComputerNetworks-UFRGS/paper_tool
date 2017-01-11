
ARRAY_CONTROL = new Array();

$(window).load(function() {

var blue_to_brown = d3.scale.linear()
  .domain([9, 50])
  .range(["steelblue", "brown"])
  .interpolate(d3.interpolateLab);


var parcoords = d3.parcoords()("#example")
    .alpha(0.4)
	.color(function(d) { return '#'+Math.floor(Math.random()*16777215).toString(16); })
    .mode("queue") // progressive rendering
    .height(d3.max([document.body.clientHeight-326, 220]))
    .margin({
      top: 36,
      left: 0,
      right: 0,
      bottom: 16
    });

// load csv file and create the chart
d3.csv('templates/js/parallel_coordinates.csv', function(data) {
  // slickgrid needs each data element to have an id
  data.forEach(function(d,i) { d.id = d.id || i; });

  parcoords
    .data(data)
    .render()
    .reorderable()
    .brushable();

  // setting up grid
  var column_keys = d3.keys(data[0]);
  var columns = column_keys.map(function(key,i) {
    return {
      id: key,
      name: key,
      field: key,
      sortable: true
    }
  });

  var options = {
    enableCellNavigation: true,
    enableColumnReorder: false,
    multiColumnSort: false
  };

  var dataView = new Slick.Data.DataView();
  var grid = new Slick.Grid("#grid", dataView, columns, options);
  var pager = new Slick.Controls.Pager(dataView, grid, $("#pager"));

  // wire up model events to drive the grid
  dataView.onRowCountChanged.subscribe(function (e, args) {
    grid.updateRowCount();
    grid.render();
  });

  dataView.onRowsChanged.subscribe(function (e, args) {
    grid.invalidateRows(args.rows);
    grid.render();
  });

  // column sorting
  var sortcol = column_keys[0];
  var sortdir = 1;

  function comparer(a, b) {
    var x = a[sortcol], y = b[sortcol];
    return (x == y ? 0 : (x > y ? 1 : -1));
  }
  
  // click header to sort grid column
  grid.onSort.subscribe(function (e, args) {
    sortdir = args.sortAsc ? 1 : -1;
    sortcol = args.sortCol.field;
	dataView.sort(comparer, args.sortAsc);
  });

	grid.onClick.subscribe(function(e,args){
/*
		var i = grid.getCellFromEvent(e).row;
    	var d = parcoords.brushed() || data;
		

		exist = arrayExist(i);

		if(exist >= 0){
			//parcoords.unhighlight([d[i]]);
			console.log(ARRAY_CONTROL.splice(exist, 1));
		}		
		else{
			console.log("SEGURA!");
			ARRAY_CONTROL.push(d[i]);
			parcoords.highlight(ARRAY_CONTROL);
		}	
*/
	});


  // highlight row in chart
  grid.onMouseEnter.subscribe(function(e,args) {
	var i = grid.getCellFromEvent(e).row;
	var d = parcoords.brushed() || data;
    parcoords.highlight([d[i]]);
  });
  grid.onMouseLeave.subscribe(function(e,args) {
	parcoords.unhighlight();
	/*var i = grid.getCellFromEvent(e).row;
	console.log("leave ----> "+i);
	console.log(ARRAY_CONTROL);
	console.log($.inArray(i, ARRAY_CONTROL));
    if($.inArray(i, ARRAY_CONTROL) == -1){
		parcoords.unhighlight();
	}*/
  });

  // fill grid with data
  gridUpdate(data);

  // update grid on brush
  parcoords.on("brush", function(d) {
	gridUpdate(d);
  });

  function gridUpdate(data) {
    dataView.beginUpdate();
    dataView.setItems(data);
    dataView.endUpdate();
  };

  	function arrayExist(val){
		c = ARRAY_CONTROL.length;
		for(i = 0; i < c; i++){
			if(val == ARRAY_CONTROL[i].id){		
				return i;
			}
		}
		return -1;
	}

});

});

