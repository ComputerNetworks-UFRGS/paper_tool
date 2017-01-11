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
	<link href="{$CSS_PATH}topology.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_PATH}topology-menu.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_PATH}topology-panel.css" media="screen" rel="stylesheet" type="text/css" />	
	<link href="{$CSS_PATH}svg.css" media="screen" rel="stylesheet" type="text/css" />	
	

	<!--[if lt IE 9]>
	<script src="../../javascripts/vendor/html5shiv.js" type="text/javascript"></script>
	<script src="../../javascripts/vendor/excanvas.js" type="text/javascript"></script>
	<![endif]-->
<!--
	<script src="{$JS_LIBS_PATH}/jsPlumb/jquery.min.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}/jsPlumb/jquery-ui.min.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}/jsPlumb/jquery.jsPlumb.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}/jsPlumb/jsPlumb.js" type="text/javascript"></script> -->

	<script src="{$JS_LIBS_PATH}application.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}jquery-1.9.1.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}jquery-ui/js/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}jquery-ui-touch-punch/jquery.ui.touch-punch.min.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}json/json2.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}jsPlumb/build/js/jquery.jsPlumb-1.4.1-all-min.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}alertify/alertify.min.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}jquery.mousewheel.js" type="text/javascript"></script>
	<script src="{$JS_PATH}topology.js" type="text/javascript"></script>
	<script src="{$JS_PATH}topology-menu.js" type="text/javascript"></script>
	<script src="{$JS_PATH}topology-panel.js" type="text/javascript"></script>
	<script src="{$JS_PATH}topology-zoom.js" type="text/javascript"></script>
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
	<script src="{$JS_PATH}charts.js" type="text/javascript"></script>
</head>

<body >
<form name="formulario" method="post">
	<input type="hidden" name="SVG_PATH" id="SVG_PATH" value="{$SVG_PATH}"/>
	<input type="hidden" name="ID_TOPOLOGY" id="ID_TOPOLOGY" value="{$ID_TOPOLOGY}"/>
</form>

{include file="topology-menu.tpl"}
{include file="topology-panel.tpl"}

<div id="topology-main">
	<div id="topology-container">
		<!--
		<div class="device-box" id="device_1" style="left:50px;top:50px;">
			<div class="device-shape" id="device_sh1">
			</div>
			<p class="device-alias">192.168.190.234</p>
		</div>

		<div class="device-box" id="device_2" style="left:200px;top:200px;">
        	<div class="device-shape" id="device_sh2">
        	</div>
       		 <p class="device-alias">200.132.123.34</p>
    	</div>

		<div class="device-box" id="device_3" style="left:500px;top:100px;">
        	<div class="device-shape">
        	</div>
        	<p class="device-alias">189.132.43.34</p>
    	</div>
		-->
	</div>
</div>

{include file="topology-new-device-modal.tpl"}
{include file="topology-create-from-file-modal.tpl"}

</body>
</html>
