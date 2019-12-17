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
	<link href="{$CSS_PATH}projects.css" media="screen" rel="stylesheet" type="text/css" />
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
		#userSelect {
			width: 95%;
			margin: auto;
			margin-bottom: 20px;
		}
		.btn-manage-project {
			line-height: 11px;
		}
	</style>
	<script language="javascript">
		function popup(action, id) {
			var offset = 25;
			var width = Math.min(screen.availWidth - offset * 2, 800);
			var height = Math.min(screen.availHeight - offset * 2, 600);
			var top = (screen.availHeight - height) / 2;
			var left = (screen.availWidth - width) / 2;
			window.open('projects-manage-' + action + '.php?project_id=' + id, 'projects-manage-users', 'width=' + width +  ', height=' + height + ', top=' + top + ', left=' + left + ',menubar=no,resizable=no,status=no,toolbar=no,scrollbars=yes');
		}

		function viewPapers(id) {
		    document.location.href = "papers-list.php?project_id=" + id;
		}
	</script>
</head>

<body >

<div class="area-top clearfix">
	<div class="pull-left header">
    	<h3 class="title">
            <i class="icon-folder-close"></i>
			{if $admin}
			Projects
			{else}
			My Projects
			{/if}
      	</h3>
        <h5>
			{if $admin}
       		List of Projects
			{else}
			List of {$USERNAME}'s projects
			{/if}
		</h5>
  	</div>
</div>

<h4 style="width: 95%; margin: auto; text-align:right">
	{if $admin}
	Projects in the database: <span id="totalProjects" style="color: black">{$total_projects}</span>
	{/if}
</h4>

<hr class="divider"></hr>

<div id="userSelect">
	<form name="form" method="post" action="projects-list.php">
		<div style="width: 50%; float: left;">
			{if $admin}
			<label>Filter by user</label>
			<select class="chzn-select" id="selectUsers" name="owner" onchange="document.form.submit();">
				<option value="-1">Select here ...</option>
				{html_options options=$users}
			</select>
			<input type="hidden" name="admin" value="1">
			{/if}
		</div>
		<div id="buttonNew" {if $admin}class="admin"{/if}>
			<input type="button" id="new-project" class="btn btn-default" onclick="location.href='projects-add.php'" value="New project"/>
		</div>
	</form>
</div>


<hr class="divider"></hr>

<div class="box">
	<div class="box-header"><h4>&nbsp;&nbsp;&nbsp;{$projects|@count} projects</h4></div>
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
					<th style="width: 15%" name="Rate" tabindex="0" rowspan="1" colspan="1">
                        <div>Owner</div>
                    </th>
					{if !$admin}
					<th style="width: 20%" name="Rate" tabindex="0" rowspan="1" colspan="1">
                        <div>My Permission</div>
                    </th>
					{/if}
					<th style="width: 30%" role="columnheader" tabindex="0" rowspan="1" colspan="1">
						<div>Actions</div>
					</th>
				</tr>
			</thead>

			<tbody role="alert" aria-live="polite" aria-relevant="all">
				{foreach from=$projects item=row}
				<tr id="trPaper_{$row.id}">
					<td style="text-align:center;">{$row.id}</td>
					<td style="text-align:center;">{$row.name}</td>
					<td style="text-align:center;">{$row.owner}</td>
					{if !$admin}<td style="text-align:center;">{$row.role}</td>{/if}
    				<td >
						<input type="button" class="btn btn-default btn-manage-project" onclick="viewPapers('{$row.id}')" value="View Papers"/>
						{if $row.admin}
						<input type="button" class="btn btn-default btn-manage-project" onclick="popup('users', '{$row.id}')" value="Manage users"/>
						<input type="button" class="btn btn-default btn-manage-project" onclick="popup('questions', '{$row.id}')" value="Manage questions"/>
						{else}
						-
						{/if}
					</td>
				</tr>
				{/foreach}
			</tbody>
			</table>
	</div>
</div>

</body>
</html>