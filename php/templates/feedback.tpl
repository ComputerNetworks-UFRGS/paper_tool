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
	<style type="text/css">
		table {
			border-collapse: collapse;
			width: 90%;
			margin: auto;
		}
		table thead tr th {
			border: 1px solid black;
			padding: 5px;
			background-color: black;
			color: white;
		}
		table tbody tr td {
			border: 1px solid black;
			padding: 5px;
		}
	</style>
</head>
<body >
	{if $operation == 'user_add'}
		{if $error}
			<h1 class="feedback" style="color:red;">{$msg}</h1>
		{else}
			<h1 class="feedback">{$msg}</h1>
		{/if}
	    <h2 class="feedback" style="padding-top: 0"><a style="color: #666666; text-decoration: underline" href="login.php">Go back</a></h2>
	{/if}

	{if $operation == 'project_add'}
		{if $error}
			<h1 class="feedback" style="color:red;">{$msg}</h1>
		{else}
			<h1 class="feedback">{$msg}</h1>
		{/if}
	    <h2 class="feedback" style="padding-top: 0"><a style="color: #666666; text-decoration: underline" href="main.php?reload" target="_parent">Go back</a></h2>
	{/if}

	{if $operation == 'project_edit_users'}
		{if $error}
			<h1 class="feedback" style="color:red;">{$msg}</h1>
		{else}
			<h1 class="feedback">{$msg}</h1>
		{/if}
		<h2 class="feedback" style="padding-top: 0"><a style="color: #666666; text-decoration: underline" href="projects-manage-users.php?project_id={$project_id}" target="_parent">Go back</a></h2>
	{/if}

	{if $operation == 'project_edit_questions'}
		{if $error}
			<h1 class="feedback" style="color:red;">{$msg}</h1>
		{else}
			<h1 class="feedback">{$msg}</h1>
		{/if}
		<h2 class="feedback" style="padding-top: 0"><a style="color: #666666; text-decoration: underline" href="projects-manage-questions.php?project_id={$project_id}" target="_parent">Go back</a></h2>
	{/if}

	{if $operation == 'paper_add'}
		{if $error}
			<h1 class="feedback" style="color:red;">{$msg}</h1>
		{else}
			<h1 class="feedback">{$msg}</h1>
		{/if}
	{/if}

	{if $operation == 'paper_import_csv'}
		{if $error}
			<h2 class="feedback" style="color:red; text-align: center;">{$msg}</h2>
		{else}
			<h2 style="color:blue; text-align: center;">{$msg}</h2>
			<hr>
			<h4 style="text-align: center;">See the log below</h4>
			<table>
				<thead>
					<tr>
						<th></th>
						<th>Title</th>
						<th>Status</th>
						<th>Message</th>
						<th>Line</th>
					</tr>
				</thead>
				<tbody>
				{assign var="cont" value="1"}
				{foreach from=$papers item=row}
					<tr>
						<td>{$cont}</td>
						<td>{$row.title}</td>
						{if $row.status == "ERROR"}
							<td style="background-color: red; color: white;">{$row.status}</td>
						{else}
							<td style="background-color: green; color: white;">{$row.status}</td>
						{/if}
						<td>{$row.message}</td>
						<td>{$row.line}</td>
					</tr>
					{assign var=cont value=$cont+1}
				{/foreach}
				</tbody>
		</table>
		{/if}
	{/if}

	{if $operation == 'paper_answer'}
		{if $error}
			<h1 class="feedback" style="color:red;">{$msg}</h1>
		{else}
			<h1 class="feedback">{$msg}</h1>
			<div style="text-align: center; font-size: 16px; margin-top: 20px;">
				Click <a href="papers-list.php?project_id={$project_id}" style="color: darkred;text-decoration: underline;">here</a> to return to the papers list.
			</div>
		{/if}
	{/if}

</body>
</html>
