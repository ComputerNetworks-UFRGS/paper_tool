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
    <link href="{$CSS_LIBS_PATH}jstree-style.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_PATH}users.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_PATH}select2.css" media="screen" rel="stylesheet" type="text/css" />
	
	<!--[if lt IE 9]>
	<script src="../../javascripts/vendor/html5shiv.js" type="text/javascript"></script>
	<script src="../../javascripts/vendor/excanvas.js" type="text/javascript"></script>
	<![endif]-->
	<script src="{$JS_LIBS_PATH}application.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}alertify/alertify.min.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}select2.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}jstree.js" type="text/javascript"></script>
	<script src="{$JS_PATH}papers.js" type="text/javascript"></script>
	<style type="text/css">
	</style>
</head>

<body >

<div class="area-top clearfix">
	<div class="pull-left header">
    	<h3 class="title">
            <i class="icon-user"></i>
            Users
      	</h3>
        <h5>
       		List of Users
		</h5>
  	</div>
</div>

<h4 style="width: 95%; margin: auto; text-align:right">
	Users in the database: <span id="totalUsers" style="color: black">{$total_users}</span>
</h4>

<hr class="divider"></hr>

<div id="buttonNew">
	<input type="button" id="new-user" class="btn btn-default" onclick="location.href='users-add.php'" value="New user"/>
</div>

<hr class="divider"></hr>

<div class="box">
	<div class="box-header">[{$users|@count} users]</h3></div>
    <div class="box-content">
    	<!-- find me in partials/data_tables_custom -->
		<table cellpadding="0" cellspacing="0" border="0" class="responsive dataTable">
			<thead>
				<tr role="row">
					<th role="columnheader" tabindex="0" rowspan="1" colspan="1">
                        <div>ID</div>
                    </th>
					<th role="columnheader" tabindex="0" rowspan="1" colspan="1">
                        <div>Name</div>
                    </th>
					<th name="Rate" tabindex="0" rowspan="1" colspan="1">
                        <div>Username</div>
                    </th>	                            
					<th name="Taxonomies" tabindex="0" rowspan="1" colspan="1">
                        <div>Email</div>
                    </th>
                    <th name="Taxonomies" tabindex="0" rowspan="1" colspan="1">
                        <div>Active</div>
                    </th>
					<th role="columnheader" tabindex="0" rowspan="1" colspan="1">
						<div>Confirmed</div>
					</th>
					<th role="columnheader" tabindex="0" rowspan="1" colspan="1">
						<div>Actions</div>
					</th>
				</tr>
			</thead>

			<tbody role="alert" aria-live="polite" aria-relevant="all">
				{foreach from=$users item=row}
				<tr id="trPaper_{$row.id}">
					<td style="text-align:center;">{$row.id}</td>
					<td style="text-align:center;">{$row.name}</td>
					<td style="text-align:center;">{$row.username}</td>
					<td style="text-align:center;">{$row.email}</td>
					<td style="text-align:center;">{$row.active}</td>
					<td style="text-align:center;">{$row.confirmed}</td>
    				<td >(to do)</td>
				</tr>
				{/foreach}
			</tbody>
			</table>   	
	</div>
</div>

</body>
</html>