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
	<link href="{$CSS_PATH}papers.css" media="screen" rel="stylesheet" type="text/css" />
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

<!--
<div class="paper_info">
    <h3>Some instructions:</h3>
	<h5>"VS" and "NS" columns show, respectively, the score of the paper in the visualization and network management fields.</h5>
	<h5>The column "V" refers to the paper's classification in the Visualization taxonomy.</h5>
	<h5>The column "N" refers to the paper's classification in the Network Management taxonomy.</h5>
	<h5>The red circle (<div class="circleorange" style="display: inline-table;"></div>) means that the paper either has not been evaluated or may be withdrawn (a first analysis was already done). Otherwise, is used a green circle (<div class="circleg" style="display: inline-table;"></div>).</h5>
	<h5>To evaluate a paper in a taxonomy, just click on the corresponding circle.</h5>
	<h5>PS: circles in the column "V" are disabled, because the Visualization taxonomy was not defined yet.</h5>
</div> 
-->

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
								<th name="Rate" tabindex="0" rowspan="1" colspan="1">
	                                <div>Rate</div>
	                            </th>	                            
								<th name="Taxonomies" tabindex="0" rowspan="1" colspan="1">
	                                <div>Taxonomies</div>
	                            </th>
	                            <th name="Taxonomies" tabindex="0" rowspan="1" colspan="1">
	                                <div>Comments</div>
	                            </th>
								<th class="sorting" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1">
									<div>Citations</div>
								</th>
								<th class="sorting" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1">
									<div>Venue</div>
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
	            				<td class="colSelectsRating" id="colSelectsRatingID_{$row.id}" style="text-align: center;" data-selectBorderColor="{$row.ratingColorCode}">
									<select class="selectsRating" name="rate" data-paperid="{$row.id}">
										{if $row.rating == 0}
											<option value="0" data-status="circlegray" selected>No rated</option>
										{else}
											<option value="0" data-status="circlegray">No rated</option>
										{/if}
										{if $row.rating == 1}
											<option value="1" data-status="circlegreen" selected>Excelent</option>
										{else}
											<option value="1" data-status="circlegreen">Excelent</option>
										{/if}
										{if $row.rating == 2}
											<option value="2" data-status="circleyellow" selected>Good</option>
										{else}
											<option value="2" data-status="circleyellow">Good</option>
										{/if}
										{if $row.rating == 3}
											<option value="3" data-status="circleorange" selected>Average</option>
										{else}
											<option value="3" data-status="circleorange">Average</option>
										{/if}
										{if $row.rating == 4}
											<option value="4" data-status="circlered" selected>Poor</option>
										{else}
											<option value="4" data-status="circlered">Poor</option>
										{/if}
									</select>
	            				</td>
								<td style="text-align: center;">
									<select class="selectsTaxonomies" name="taxonomies" data-paperid="{$row.id}">
										{$row.taxonomyOptions}
									</select>
								</td>
	                            <td style="text-align: center;">
									<a class="a-menu tip addComment" data-paperid="{$row.id}" title="New comment" data-toggle="modal" href="#modal-form-add-comment" data-original-title="New comment">
      									<i class="icon-comment"></i>
    								</a>
    								<a class="a-menu tip viewComments" data-paperid="{$row.id}" title="Previous comments" data-toggle="modal" href="#modal-form-previous-comment" data-original-title="Previous comments">
      									<i class="icon-comments-alt"></i>
    								</a>	
								</td>
	            				<td class="center ">{$row.citations}</td>
	            				<td >{$row.venue}<a href="{$row.site}" target="_blank">&nbsp;<i class="icon-external-link"></a></td>
	            				<td class="center "><a href="../papers/{$row.file}" target="_blank"><i class="icon-file"></i></a></i></a></td>
	        				</tr>
		{assign var="open_box" value="0"}	
	{else}
							<tr>
								<td >{$row.id}</td>
	            				<td >{$row.title}</td>
	            				<td style="text-align: center;">

	            				</td>
								<td style="text-align: center;">
									<select class="allSelects" name="year">
										<option value="1" data-status="circlegreen">teste 1</option>
										<option value="2" data-status="circlered">teste 2</option>
										<option value="3" data-status="circlegreen">teste 3</option>
									</select>
								</td>
	                            <td style="text-align: center;">
									comments
								</td>
	            				<td class="center ">{$row.citations}</td>
	            				<td >{$row.venue}<a href="{$row.site}" target="_blank">&nbsp;<i class="icon-external-link"></a></td>
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

{include file="paper_add_comment.tpl"}
{include file="paper_previous_comment.tpl"}
{include file="paper_taxonomy.tpl"}

</body>
</html>
