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
	<link href="{$CSS_PATH}users.css" media="screen" rel="stylesheet" type="text/css" />
	
	<!--[if lt IE 9]>
	<script src="../../javascripts/vendor/html5shiv.js" type="text/javascript"></script>
	<script src="../../javascripts/vendor/excanvas.js" type="text/javascript"></script>
	<![endif]-->
	<script src="{$JS_LIBS_PATH}application.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}alertify/alertify.min.js" type="text/javascript"></script>
	<script src="{$JS_PATH}users.js" type="text/javascript"></script>
	
</head>

<body >

<div class="area-top clearfix">
	<div class="pull-left header">
    	<h3 class="title">
            <i class="icon-user"></i>
			{$title}
      	</h3>
        <h5>
			{$sub_title}
	</h5>
  	</div>
</div>

  	<div class="modal-body">
    	<form name="form" class="form-horizontal fill-up separate-sections" method="post" enctype="multipart/form-data" action="users-con.php">
			<input type="hidden" value="{$operation}" id="operation" name="operation"/>
			<div class="darkred">
				All fields are required
			</div>

      		<div>
        		<label>Your name</label>
        		<input type="text" name="name" placeholder="e.g John Smith" required/>
      		</div>

			<div>
				<label>Username</label>
				<input type="text" name="username" placeholder="use letters, numbers, - and _" required/>
			</div>

			<div>
				<label>E-mail</label>
				<input type="text" name="email" placeholder="e.g johnsmith91@isp.com" required/>
			</div>

			<div>
				<label>Password</label>
				<input type="password" name="password" required/>
			</div>

			<div>
				<label>Password confirmation</label>
				<input type="password" name="password_confirm" required/>
			</div>

			<div>
				<br>
				<input type="submit" id="add-user" class="btn btn-blue"  onsubmit="validateUserAdd()" value="{$btn_label}"/>

			    {if $invite_code != ''}
					<br><br>
					<a class="btn btn-blue btn-block" id="btn-signup" href="login.php?invite_code={$invite_code}">Login</a>
			        <input type="hidden" name="invite_code" value="{$invite_code}"/>
			    {/if}
			</div>
	</div>
	<div class="modal-footer">
  	</div>
	</form>

</body>
</html>
