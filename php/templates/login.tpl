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

<!--
  <link href="{$CSS_LIBS_PATH}box.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}bootstrap/bootstrap.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}bootstrap/responsive.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}base.css" media="screen" rel="stylesheet" type="text/css" />
  <link href="{$CSS_LIBS_PATH}buttons.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}bootstrap-editable.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}bootstrap_include.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}form_elements.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}font-awesome.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}sidebar.css" media="screen" rel="stylesheet" type="text/css" />
-->
	<link href="{$CSS_LIBS_PATH}application.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_PATH}login.css" media="screen" rel="stylesheet" type="text/css" />

	<script src="{$JS_LIBS_PATH}application.js" type="text/javascript"></script>
	<script src="{$JS_PATH}login.js" type="text/javascript"></script>
</head>

<body>

	<div class="container">
  <!--		<div class="span4 offset4"> -->
			<div class="padded">
				<div class="logo">
					<h1>Visualization and Network Management paper</h1>
					<p class="lead">
					Support tool
					</p>
    			</div>
				<div class="login box" style="margin-top: 40px;">
					<div class="box-header">
        				<span class="title">Login</span>
      				</div>
					<div class="box-content padded">
        				<form class="separate-sections" method="post" name="formulario" id="formulario" action="redirect.php">
          					<div class="input-prepend">
          						<span class="add-on" href="#">
            						<i class="icon-user"></i>
          						</span>
            					<input type="text" placeholder="username" name="username" />
          					</div>
							<div class="input-prepend">
          						<span class="add-on" href="#">
            						<i class="icon-key"></i>
          						</span>
            					<input type="password" placeholder="pass" name="pass" id="pass"/>
          					</div>
							{if $erro}
								<div style="text-align: center;">
                                	<p style="color: red;"><strong>Dados de acesso incorretos!</strong></p>
                            	</div>
							{/if}
							<div>
            					<a class="btn btn-blue btn-block" id="btn" href="#">Login <i class="icon-signin"></i></a>
          					</div>
						</form>
      				</div>
				</div>
  			</div>
	<!--	</div> -->
	</div>

</body>
</html>
