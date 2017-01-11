google.load("visualization", "1", {packages:["corechart"]});
google.setOnLoadCallback(drawPieChart);
google.setOnLoadCallback(drawBarChart);
	
function drawBarChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Number of messages'],
          ['get-request', 5879],
          ['get-next-request', 1782],
		  ['get-bulk-request', 0],
		  ['set-request', 0],
          ['trap',  4943],
          ['trap2', 8961],
		  ['inform', 0],
		  ['response', 26664],
		  ['report', 0],
        ]);

        var options = {
          title: '',
          vAxis: {title: 'SNMP Operations',  titleTextStyle: {color: 'black'}},
		  colors: ['green'],
        };

        var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
        chart.draw(data, options);
    	}


function drawPieChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['SNMPv1', 2345],
          ['SNMPv2c', 5670],
          ['SNMPv3', 448],
        ]);

        var options = {
          title: 'SNMP messages by versions',
          is3D: true,
		  legend: {position: 'bottom'}
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
