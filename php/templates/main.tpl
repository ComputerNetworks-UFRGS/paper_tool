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

	<link href="{$CSS_LIBS_PATH}bootstrap/bootstrap.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}bootstrap/responsive.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}bootstrap_include.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}dropdowns.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}font-awesome.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}navigation.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}responsive480.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}responsive979.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}buttons.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}fullcalendar.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}sidebar.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}chat-box.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}message_box.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}news.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}responsive768.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}gritter.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}action_nav.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}badges.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}breadcrumbs.css" media="screen" rel="stylesheet" type="text/css" />
<!-- 	<link href="{$CSS_LIBS_PATH}" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_LIBS_PATH}" media="screen" rel="stylesheet" type="text/css" />	
-->

<!--  	<link href="{$CSS_LIBS_PATH}application.css" media="screen" rel="stylesheet" type="text/css" /> -->
	<link href="{$CSS_PATH}main.css" media="screen" rel="stylesheet" type="text/css" />
	<!--[if lt IE 9]>
	<script src="../../javascripts/vendor/html5shiv.js" type="text/javascript"></script>
	<script src="../../javascripts/vendor/excanvas.js" type="text/javascript"></script>
	<![endif]-->

	<script src="{$JS_LIBS_PATH}application.js" type="text/javascript"></script>
</head>

<body>

<div id="main">

<div class="navbar navbar-top navbar-inverse">
	<div class="navbar-inner-menu-sup">
		<div class="container-fluid">
			<ul class="nav pull-right">
				<li class="toggle-primary-sidebar hidden-desktop" data-toggle="collapse" data-target=".nav-collapse-primary">
					<button type="button" class="btn btn-navbar">
						<i class="icon-th-list"></i>
					</button>
				</li>
				<li class="hidden-desktop" data-toggle="collapse" data-target=".nav-collapse-top">
					<button type="button" class="btn btn-navbar">
						<i class="icon-align-justify"></i>
					</button>
				</li>
			</ul>
			<div class="nav-collapse nav-collapse-top collapse">
				<ul class="nav pull-right">
					<li>
						<a href="taxonomy-add.php" target="iframe-body">
							<i class="icon-sitemap"></i>Taxonomies
						</a>
					</li>
					<li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-file"></i> Papers <b class="caret"></b></a>
                        <ul class="dropdown-menu">
							<li><a href="papers-list.php" target="iframe-body">List</a></li>
                            <li><a href="papers-add.php" target="iframe-body">Add</a></li>
                            <li><a href="papers-csv.php" target="iframe-body">Upload CSV</a></li>
                        </ul>
                    </li>
					<!--
					<li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"> Classify on taxonomies <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="network-taxonomy.php" target="iframe-body">Network Management</a></li>
                            <li><a href="visualization-taxonomy.php" target="iframe-body">Visualization</a></li>
                        </ul>
                    </li>
					-->
					<li><a href="logout.php" title="logout"><i class="icon-signout"></i> Logout</a></li>
				</ul>
			</div>
      	</div>
  	</div>
</div>
<!--
<div id="menu-right">
	menu-right
</div>
-->
<div id="content-iframe">
	<iframe id="iframe-style" src="papers-list.php" name="iframe-body"></iframe>
</div>

</div>
</body>
</html>
