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
	<link href="{$CSS_LIBS_PATH}jquery.rating.css" media="screen" rel="stylesheet" type="text/css" />
  <link href="{$CSS_LIBS_PATH}d3-tip.css" media="screen" rel="stylesheet" type="text/css" />
	<!-- <link href="{$CSS_PATH}papers.css" media="screen" rel="stylesheet" type="text/css" /> -->
	
	<!--[if lt IE 9]>
	<script src="../../javascripts/vendor/html5shiv.js" type="text/javascript"></script>
	<script src="../../javascripts/vendor/excanvas.js" type="text/javascript"></script>
	<![endif]-->
	<script src="{$JS_LIBS_PATH}application.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}alertify/alertify.min.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}jquery.rating.pack.js" type="text/javascript"></script>
  <!-- <script src="{$JS_LIBS_PATH}vendor/d3.js" type="text/javascript"></script> -->
  <script src="{$JS_LIBS_PATH}d3.v3.min.js" type="text/javascript"></script>
  <script src="{$JS_LIBS_PATH}vendor/d3-tip.js" type="text/javascript"></script>
	<script src="{$JS_PATH}network-management-visualization.js" type="text/javascript"></script>
	<style>
    body {
      font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
      margin: auto;
      position: relative;
      background-color: white;
    }

    form {
      position: absolute;
      right: 10px;
      top: 10px;
    }

    .node {
      border: solid 1px #535353;
      font: 10px sans-serif;
      line-height: 12px;
      overflow: hidden;
      position: absolute;
      text-indent: 2px;
      color: white;
      font-family: times;
    }

    .nodeText{
      margin-top: 2px;
      font-size: 16px;
    }

    p.white {
		color: white;
	}

	p.black {
        color: black;
    }

    #labelBox{
      width: 98%;
      margin: auto;
    }
    .labelTree{
      width: 1.5em;
      height: 1.5em;
      /* background-color: #F00; */
      float: left;
      margin-left: 0.4em;
      margin-top: 1em;
      border: 1px solid #ccc;
      text-align: center;
      font-family: times;
    }
    .labelText{
      float: left;
      margin-left: 0.1em;
      padding-top: 0.1em;
      margin-top: 1em;
      font-size: 1.2em;
      font-family: times;
      color: black;
    }

    #sunburst {
      position: absolute;
      top: 800px;
      background: white;
    }
  </style>
</head>

<body>

<!-- <div class="area-top clearfix">
	<div class="pull-left header">
    	<h3 class="title">
         	Network Management - Treemap Visualization
      	</h3>
  	</div>
</div> -->

<form>
  <input type="hidden" name="fileJSONTree" id="fileJSONTree" value="{$fileJSONTree}"/>
  <input type="hidden" name="fileJSONSunburst" id="fileJSONSunburst" value="{$fileJSONSunburst}"/>
  <input type="hidden" name="fileJSONTreeViz" id="fileJSONTreeViz" value="{$fileJSONTreeViz}"/>
</form>

<div id="labelBox">
  {foreach from=$topic item=curr_id}
    <div class="labelTree" style="background-color: {$curr_id.color}; color: {$curr_id.font_color}"></div><span class="labelText">{$curr_id[1]} ({$curr_id.table_name})</span>
  {/foreach}
<div>

<!-- <div id="treemap">
</div> -->

<div id="treemapViz"> 
</div>

<!--<div id="sunburst">
</div>-->

</body>
</html>
