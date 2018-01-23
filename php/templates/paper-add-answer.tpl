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
	
</head>

<body >

<div class="area-top clearfix">
	<div class="pull-left header">
    	<h3 class="title">
            <i class="icon-file"></i>
            Answer
      	</h3>
        <h5>
       		Answer important questions about the paper
	</h5>
  	</div>
</div>
	<div style="width: 80%; margin: auto;">
		<div>
			<h4>Paper: {$paper[0].title}</h4>
			<h4>Venue: {$paper[0].venue}</h4>
			<h4>Year: {$paper[0].year}</h4>
		</div>
		<div style="text-align: right;">
			Click <a href="papers-list.php" style="color: darkred;text-decoration: underline;">here</a> to return to the papers list.
		</div>
		<hr>
    	<form name="form" class="form-horizontal fill-up separate-sections" method="post" action="papers-con.php">
			<input type="hidden" value="30" name="operation"/>
			<input type="hidden" value="{$paper[0].id}" name="paperId"/>
			{foreach from=$questions item=row}
				<div>
					<label style="font-size: 12pt; color: black;">{$row.question}</label>
					<input type="hidden" name="questionId[]" value="{$row.question_id}">
        			<textarea rows="4" name="answer[]">{$row.answer}</textarea>
      			</div>
			{/foreach}
			<div class="modal-footer">
    			<input type="submit" id="add-answer" class="btn btn-blue" value="Add Answers"/>
  			</div>
  		</form>
	</div>
</body>
</html>
