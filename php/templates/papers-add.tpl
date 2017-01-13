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
       		Adding a new paper
	</h5>
  	</div>
</div>

  	<div class="modal-body">
    	<form name="form" class="form-horizontal fill-up separate-sections" method="post" enctype="multipart/form-data" action="papers-con.php">
			<input type="hidden" value="1" id="operation" name="operation"/>
      		<div>
        		<label>Paper title</label>
        		<input type="text" name="title" placeholder="title" required/>
      		</div>

			<div>
            	<label>Paper year</label>
               	<select class="chzn-select" name="year" style="width:40%">
					{html_options options=$years}	
                </select>
			</div>
			
			<div>
                <label>Citations</label>
                <input type="text" pattern="\d*" name="citations" placeholder="citations (just numbers)" maxlength="5"/>
            </div>

			<div>
                <label>Venue</label>
                <input type="text" name="venue" placeholder="venue" required/>
            </div>

			<div>
                <label>Venue site</label>
                <input type="url" name="site" placeholder="site" required/>
            </div>
		
			<div>
				<label>Search Query</label>
        		<textarea rows="4" placeholder="Type the query that was used to search this paper" name="comments"></textarea>
      		</div>
			
            <div>
                <label>Paper upload</label>
				<div class="uploader">
            	<input name="paper" type="file" required><span style="-moz-user-select: none;" class="filename">No file selected</span><span style="-moz-user-select: none;" class="action">+</span>
				</div>
			</div>
	</div>
	<div class="modal-footer">
    	<input type="submit" id="add-paper" class="btn btn-blue" value="Add paper"/>
  	</div>
	</form>

</body>
</html>
