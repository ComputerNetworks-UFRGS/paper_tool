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
	{if $operation == 1}
		{if $error}
			<h1 class="feedback" style="color:red;">{$msg}</h1>
		{else}
			<h1 class="feedback">{$msg}</h1>
		{/if}
	{/if}
	
	{if $operation == 2}
		{if $error}
			<h2 class="feedback" style="color:red; text-align: center;">{$msg}</h2>
		{else}
			<h2 style="color:blue; text-align: center;">{$msg}</h2>
			<hr>
			<h4 style="text-align: center;">See the inserted papers below</h4>
			<table>
				<thead>
					<tr>
						<th></th>
						<th>Title</th>
						<th>Year</th>
						<th>Citations</th>
						<th>Venue</th>
						<th>Venue site</th>
						<th>Search query</th>
						<th>File name</th>
					</tr>
				</thead>
				<tbody>
				{assign var="cont" value="1"}
				{foreach from=$papers item=row}				
					<tr>
						<td>{$cont}</td>
						<td>{$row[0]}</td>
						<td>{$row[1]}</td>
						<td>{$row[2]}</td>
						<td>{$row[3]}</td>
						<td>{$row[4]}</td>
						<td>{$row[5]}</td>
						<td>{$row[6]}</td>
					</tr>	
					{assign var=cont value=$cont+1}			
				{/foreach}
				</tbody>
		</table>
		{/if}
	{/if}

</body>
</html>
