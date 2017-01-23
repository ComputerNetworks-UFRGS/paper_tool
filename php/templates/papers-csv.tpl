<!doctype html>
<html>
<head>

	<meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800">
	
	<meta charset="utf-8">
	<!-- Always force latest IE rendering engine or request Chrome Frame -->
	<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">

	<!-- Use title if it's in the page YAML frontmatter -->
	<title>{$SYS_TITLE}</title>
	
	<link href="{$CSS_LIBS_PATH}application.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}alertify.core.css" media="screen" rel="stylesheet" type="text/css" />       
        <link href="{$CSS_LIBS_PATH}alertify.default.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_PATH}papers.css" media="screen" rel="stylesheet" type="text/css" />
	
	<!--[if lt IE 9]>
	<script src="../../javascripts/vendor/html5shiv.js" type="text/javascript"></script>
	<script src="../../javascripts/vendor/excanvas.js" type="text/javascript"></script>
	<![endif]-->
	<script src="{$JS_LIBS_PATH}application.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}alertify/alertify.min.js" type="text/javascript"></script>
	<script src="{$JS_PATH}papers.js" type="text/javascript"></script>
	
</head>

<body >

<div class="area-top clearfix">
	<div class="pull-left header">
    	<h3 class="title">
            <i class="icon-file"></i>
            Papers
      	</h3>
        <h5>
       		Upload CSV file
	</h5>
  	</div>
</div>

  	<div class="modal-body">
  		<div>
  			<p>You can find below an example of the .XLSX file and the .CSV. The CSV fields must be separated by semicolon (;) and the head columns in red are required (i.e., title, year, and file name).</p>
  			<a href="misc/spreadsheet-example.xlsx"><img src="{$IMAGES_PATH}/xlsx-icon.png" style="width: 5em;"></a>
  			<span>=></span>
  			<a href="misc/spreadsheet-example.csv"><img src="{$IMAGES_PATH}/csv-icon.png" style="width: 5em;"></a>
  		</div>
  		<hr>
    	<form name="form" class="form-horizontal fill-up separate-sections" method="post" enctype="multipart/form-data" action="papers-con.php">
		<input type="hidden" value="2" id="operation" name="operation"/>			
        <div>
            <label>CSV upload</label>
			<div class="uploader">
        	<input name="csvfile" type="file" required><span style="-moz-user-select: none;" class="filename">No file selected</span><span style="-moz-user-select: none;" class="action">+</span>
			</div>
		</div>
	</div>
	<div class="modal-footer">
    	<input type="submit" id="upload-csv" class="btn btn-blue" value="Upload CSV"/>
  	</div>
	</form>

</body>
</html>
