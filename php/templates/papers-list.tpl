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
       		List of Papers
		</h5>
  	</div>
</div>

<div class="paper_info">
	<h4 style=" width: 100%; text-align: right; color: #08C;"><a sytle="float: right; color: #08C;" href="network-taxonomy-visualization.php">View taxonomy treemap</a></h4>
    <h3>Some instructions:</h3>
	<h5>"VS" and "NS" columns show, respectively, the score of the paper in the visualization and network management fields.</h5>
	<h5>The column "V" refers to the paper's classification in the Visualization taxonomy.</h5>
	<h5>The column "N" refers to the paper's classification in the Network Management taxonomy.</h5>
	<h5>The red circle (<div class="circler" style="display: inline-table;"></div>) means that the paper either has not been evaluated or may be withdrawn (a first analysis was already done). Otherwise, is used a green circle (<div class="circleg" style="display: inline-table;"></div>).</h5>
	<h5>To evaluate a paper in a taxonomy, just click on the corresponding circle.</h5>
	<h5>PS: circles in the column "V" are disabled, because the Visualization taxonomy was not defined yet.</h5>
</div>

<hr class="divider"></hr>

{assign var="open_box" value="1"}
{assign var="cont" value="0"}

{foreach from=$papers item=row}
	
	{if $open_box == 1}
<div class="box">
    <div class="box-header"><h3>&nbsp;&nbsp;&nbsp;{$row.year}</h3></div>
    <div class="box-content">
    	<!-- find me in partials/data_tables_custom -->
		<div id="dataTables">
			<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper form-inline" role="grid">
				<table cellpadding="0" cellspacing="0" border="0" class="dTable responsive dataTable" id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info">
					<thead>
						<tr role="row">
							<th class="sorting" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1">
                                <div>ID</div>
                            </th>
							<th class="sorting" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1">
                                <div>Title</div>
                            </th>
							<th name="Viz" tabindex="0" rowspan="1" colspan="1">
                                <div>VS</div>
                            </th>
                            <th name="Man" tabindex="0" rowspan="1" colspan="1">
                                <div>NS</div>
                            </th>
							<th name="Viz" tabindex="0" rowspan="1" colspan="1">
                                <div>V</div>
                            </th>
							<th name="Man" tabindex="0" rowspan="1" colspan="1">
                                <div>N</div>
                            </th>
							<th class="sorting" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1">
								<div>Citations</div>
							</th>
							<th class="sorting" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1">
								<div>Vehicle</div>
							</th>
							<th name="preview" tabindex="0" rowspan="1" colspan="1">
                                <div>Preview</div>
                            </th>
						</tr>
					</thead>

					<tbody role="alert" aria-live="polite" aria-relevant="all">
						<tr>
							<td >{$row.id}</td>
            				<td >{$row.title}</td>
							<td >{$row.visualization_rating}</td>
            				<td >{$row.network_rating}</td>
							<td>
								{if $row.viz}
									<a href="visualization-taxonomy.php?id={$row.id}"><div class="circleg"></div></a>
								{else}
									<a href="visualization-taxonomy.php?id={$row.id}"><div class="circler"></div></a>
								{/if}
							</td>
                            <td>
								{if $row.man}
									<a href="network-taxonomy.php?id={$row.id}"><div class="circleg"></div></a>
								{else}
									<a href="network-taxonomy.php?id={$row.id}"><div class="circler"></div></a>
								{/if}
							</td>
            				<td class="center ">{$row.citations}</td>
            				<td >{$row.vehicle}<a href="{$row.site}" target="_blank">&nbsp;<i class="icon-external-link"></a></td>
            				<td class="center "><a href="../papers/{$row.file}" target="_blank"><i class="icon-file"></i></a></i></a></td>
        				</tr>
		{assign var="open_box" value="0"}	
	{else}
		<tr>
			<td >{$row.id}</td>
            <td >{$row.title}</td>
			<td >{$row.visualization_rating}</td>
			<td >{$row.network_rating}</td>
            <td>
            	{if $row.viz}
              		<a href="visualization-taxonomy.php?id={$row.id}"><div class="circleg"></div></a>
               	{else}
                	<a href="visualization-taxonomy.php?id={$row.id}"><div class="circler"></div></a>
              	{/if}
            </td>
            <td>
				{if $row.man}
              		<a href="network-taxonomy.php?id={$row.id}"><div class="circleg"></div></a>
               	{else}
                	<a href="network-taxonomy.php?id={$row.id}"><div class="circler"></div></a>
              	{/if}	
			</td>
			<td class="center ">{$row.citations}</td>
            <td >{$row.vehicle}<a href="{$row.site}" target="_blank">&nbsp;<i class="icon-external-link"></a></td>
			<td class="center "><a href="../papers/{$row.file}" target="_blank"><i class="icon-file"></i></a></i></a></td>
		</tr>
	{/if}

	{if $papers[{$cont + 1}].year != $row.year}
					</tbody>
          		</table>
            </div>
        </div>
    </div>
</div>
<br/>
	{assign var="open_box" value="1"}
	{/if}
	
	{assign var=cont value=$cont+1}
{/foreach}

</body>
</html>
