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
	<style type="text/css">
		#yearSelect {
		    width: 95%;
		    margin: auto;
		    margin-bottom: 20px;
		}
	</style>
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

<h4 style="width: 95%; margin: auto; text-align:right">
	Papers in the database: <span id="totalPapers" style="color: black">{$total_papers}</span>
</h4>

<hr class="divider"></hr>

<div id="yearSelect">
	<form name="form" method="post" action="papers-list.php">
	<div style="width: 50%; float: left;">
		<label>Select year</label>
	   	<select class="chzn-select" id="selectYear" name="year" onchange="document.form.submit();">
	   		<option value="0">ALL</option>
			{html_options values=$years output=$years_output selected=$year}	
	    </select>
	</div>
	<div style="text-align: right">
		<label>Select an user to assign papers</label>
	   	<select class="chzn-select" id="selectUsers" name="users">	   		
	   		<option value="-1">Select here ...</option>
	   		<option value="0">NOBODY</option>
			{html_options options=$users}	
	    </select>
	</div>
	</form>
</div>

<hr class="divider"></hr>

<div class="box">
	{if $year != 0}
    	<div class="box-header"><h3>&nbsp;&nbsp;&nbsp;{$year} - [{$papers|@count} papers]</h3></div>
    {else}
    	<div class="box-header"><h3>&nbsp;&nbsp;&nbsp;ALL - [{$papers|@count} papers]</h3></div>
    {/if}
    <div class="box-content">
    	<!-- find me in partials/data_tables_custom -->
		<table cellpadding="0" cellspacing="0" border="0" class="responsive dataTable">
			<thead>
				<tr role="row">
					<th role="columnheader" tabindex="0" rowspan="1" colspan="1">
                        <div>ID</div>
                    </th>
					<th role="columnheader" tabindex="0" rowspan="1" colspan="1">
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
					<th role="columnheader" tabindex="0" rowspan="1" colspan="1">
						<div>Citations</div>
					</th>
					<th role="columnheader" tabindex="0" rowspan="1" colspan="1">
						<div>Venue</div>
					</th>
					<th name="preview" tabindex="0" rowspan="1" colspan="1">
                        <div>PDF Link</div>
                    </th>
                    <th name="assignedToUser" tabindex="0" rowspan="1" colspan="1">
						<div>Assigned To</div>
                    </th>
                    <th name="assignedToUserCheck" tabindex="0" rowspan="1" colspan="1">
                    	ALL
                    	<input type="checkbox" name="selectAll" id="selectAll">
                    </th>
				</tr>
			</thead>

			<tbody role="alert" aria-live="polite" aria-relevant="all">
				{foreach from=$papers item=row}
				<tr id="trPaper_{$row.id}">
					<td style="text-align:center;">
						<button class="btn btn-danger tip viewComments btnRemove" data-paperid="{$row.id}" data-original-title="Remove paper" title="Remove paper" >X</button>
						<div>{$row.id}</div>
					</td>
    				<td >{$row.title}</td>
    				<td id="colSelectsRatingID_{$row.id}" style="text-align: center;">
						<select class="selectsRating {$row.ratingClass}" id="selectRating_ID_{$row.id}" name="rate" data-paperid="{$row.id}">
							{html_options options=$ratingValues selected=$row.rating}
						</select>
    				</td>
					<td class="colSelectsTaxonomies" id="colSelectsTaxonomiesID_{$row.id}" style="text-align: center;">
						<select class="selectsTaxonomies {$row.taxonomyClass}" name="taxonomies" data-paperid="{$row.id}">
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
    				<td >{$row.venue}</td>
    				<td class="center">
    					<a href="{$row.pdf_link}" target="_blank"><i class="icon-external-link"></i></a>
    				</td>
    				<td class="center">
    					{$row.assignedToUser}
    				</td>
    				<td class="center">
    					<input type="checkbox" class="checkbox" name="assignedPapers[]" value="{$row.id}">
    				</td>
				</tr>
				{/foreach}
			</tbody>
			</table>   	
	</div>
</div>

{include file="paper_add_comment.tpl"}
{include file="paper_previous_comment.tpl"}
{include file="paper_taxonomy.tpl"}

</body>
</html>
