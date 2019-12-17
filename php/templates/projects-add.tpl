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
	<link href="{$CSS_PATH}projects.css" media="screen" rel="stylesheet" type="text/css" />
	
	<!--[if lt IE 9]>
	<script src="../../javascripts/vendor/html5shiv.js" type="text/javascript"></script>
	<script src="../../javascripts/vendor/excanvas.js" type="text/javascript"></script>
	<![endif]-->
	<script src="{$JS_LIBS_PATH}application.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}alertify/alertify.min.js" type="text/javascript"></script>
	<script src="{$JS_PATH}projects.js" type="text/javascript"></script>
	
</head>

<body >

<div class="area-top clearfix">
	<div class="pull-left header">
    	<h3 class="title">
            <i class="icon-folder-close"></i>
			Projects
		</h3>
		<h5>
			Adding a new project
	</h5>
  	</div>
</div>

  	<div class="modal-body">
    	<form name="form" class="form-horizontal fill-up separate-sections" method="post" enctype="multipart/form-data" action="projects-con.php">
			<input type="hidden" value="1" id="operation" name="operation"/>
			<div class="darkred">
				All fields are required
			</div>

      		<div>
        		<label>Project name</label>
        		<input type="text" name="name" placeholder="tip: give your project a short but meaningful name" required/>
      		</div>

			{if $admin}
			<div>
				<label>Owner</label>
				<select class="chzn-select" id="selectOwner" name="owner">
					<option value="-1">Select here ...</option>
					{html_options options=$users}
				</select>
			</div>
			{/if}

			<div>
				<br>
				<input type="submit" id="add-project" class="btn btn-blue"  onsubmit="validateProjectAdd()" value="Add Project"/>
			</div>
	</div>
	<div class="modal-footer">
  	</div>
	</form>

</body>
</html>
