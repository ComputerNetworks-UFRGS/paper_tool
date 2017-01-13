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
		#saveTaxonomyBtn {
			margin-top: 1em;
		}
	</style>
</head>

<body >

<div class="area-top clearfix">
	<div class="pull-left header">
    	<h3 class="title">
            <i class="icon-file"></i>
            Taxonomies
      	</h3>
        <h5>
       		Add/Edit taxonomy
	</h5>
  	</div>
</div>
<form name="taxonomiesForm" method="post" id="taxonomiesForm">
<input type="hidden" value="" name="taxonomyId" id="taxonomyId">

<div style="width: 95%; margin: auto; margin-bottom: 1em;">
	<div id="addTaxonomyBox" style="float: left; width: 50%">
		<label>Add new taxomy</label>
		<input type="text" class="form-control" id="newTaxonomyName" placeholder="Taxonomy name" required>
		<br>
		<button type="button" id="addTaxonomyBtn" class="btn btn-default">Add Taxonomy</button>	
	</div>
	<div id="editTaxonomyBox" style="float: left; width: 50%">
		<label>Edit existing one</label>
	    <select class="form-control" id="editTaxonomyId">
	    	<option value="-1">Selecione aqui ...</option>
	    	{html_options options=$taxonomies}
	    </select>
	    <br>
		<button type="button" id="editTaxonomyBtn" class="btn btn-default">Edit Taxonomy</button>	
	</div>
</div>

<div style="clear: both;height: 30px;"></div>

<div class="container" id="container" style="display: none;">
	<div class="row">
		<button type="button" class="btn btn-success" onclick="createRootNode();">Create Root Node</button>
		<!-- <button type="button" class="btn btn-warning" onclick="demo_rename();">Rename Field</button>
		<button type="button" class="btn btn-danger" onclick="demo_delete();">Delete Field</button> -->
		<h5>Use the right click on a topic to display the menu options</h5>
	</div>
	<div class="row">
		<div class="col-3">
			<div id="jstreeTaxonomy" class="demo" style="margin-top:1em; min-height:200px;"></div>
		</div>
	</div>
	<div class="row">
		<button type="button" id="saveTaxonomyBtn" class="btn btn-blue">Save taxonomy fieds</button>
	</div>
</div>
</form>
</body>
</html>
