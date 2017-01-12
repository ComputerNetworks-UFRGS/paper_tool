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
	<link href="{$CSS_LIBS_PATH}jstree-style.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}alertify.core.css" media="screen" rel="stylesheet" type="text/css" />       
    <link href="{$CSS_LIBS_PATH}alertify.default.css" media="screen" rel="stylesheet" type="text/css" />

	<!--[if lt IE 9]>
	<script src="../../javascripts/vendor/html5shiv.js" type="text/javascript"></script>
	<script src="../../javascripts/vendor/excanvas.js" type="text/javascript"></script>
	<![endif]-->
	<script src="{$JS_LIBS_PATH}application.js" type="text/javascript"></script> 
	<script src="{$JS_LIBS_PATH}jstree.js" type="text/javascript"></script> 
	<script src="{$JS_LIBS_PATH}alertify/alertify.min.js" type="text/javascript"></script>
	<script src="{$JS_PATH}taxonomies.js" type="text/javascript"></script>
	<style type="text/css">
		body {
			background: #F5F5F5;
		}
	</style>
</head>

<body >

<div class="area-top clearfix">
	<div class="pull-left header">
    	<h3 class="title">
            <i class="icon-file"></i>
            Taxonomy
      	</h3>
        <h5>
       		Adding a new taxonomy
	</h5>
  	</div>
</div>

<div class="container">
	<div class="row">
		<button type="button" class="btn btn-success" onclick="demo_create();">Create</button>
		<button type="button" class="btn btn-warning" onclick="demo_rename();">Rename</button>
		<button type="button" class="btn btn-danger" onclick="demo_delete();">Delete</button>
	</div>
	<div class="row">
		<div class="col-3">
			<div id="jstree_demo" class="demo" style="margin-top:1em; min-height:200px;"></div>
		</div>
	</div>
</div>

<!-- <div class="modal-footer">
	<input type="submit" id="add-paper" class="btn btn-blue" value="Add paper"/>
</div> -->
	
</body>
</html>
