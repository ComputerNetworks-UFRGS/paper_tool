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
	<link href="{$CSS_LIBS_PATH}d3.parcoords.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}slick.grid.css" media="screen" rel="stylesheet" type="text/css" />	
	<link href="{$CSS_LIBS_PATH}slick.pager.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}jquery-ui-1.8.16.custom.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_PATH}parallel-coordinates.css" media="screen" rel="stylesheet" type="text/css" />

	<!--[if lt IE 9]>
	<script src="../../javascripts/vendor/html5shiv.js" type="text/javascript"></script>
	<script src="../../javascripts/vendor/excanvas.js" type="text/javascript"></script>
	<![endif]-->
<!--
	<script src="{$JS_LIBS_PATH}/jsPlumb/jquery.min.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}/jsPlumb/jquery-ui.min.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}/jsPlumb/jquery.jsPlumb.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}/jsPlumb/jsPlumb.js" type="text/javascript"></script> -->

<!--	<script src="{$JS_LIBS_PATH}application.js" type="text/javascript"></script> -->
	<script src="{$JS_LIBS_PATH}vendor/d3.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}parcoords/d3.parcoords.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}jquery-1.9.1.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}jquery-ui/js/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}slickgrid/jquery.event.drag-2.2.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}slickgrid/jquery.event.drop-2.2.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}slickgrid/slick.core.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}slickgrid/slick.grid.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}slickgrid/slick.pager.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}slickgrid/slick.dataview.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}jquery-ui-touch-punch/jquery.ui.touch-punch.min.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}json/json2.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}alertify/alertify.min.js" type="text/javascript"></script>
	<script src="{$JS_PATH}divgrid.js" type="text/javascript"></script>
	<script src="{$JS_PATH}parallel-coordinates.js" type="text/javascript"></script>		
</head>

<body >
<form name="formulario" method="post">
</form>

<div id="example" class="parcoords" style="height:240px;"></div>
<div id="grid"></div>
<div id="pager"></div>

</body>
</html>
