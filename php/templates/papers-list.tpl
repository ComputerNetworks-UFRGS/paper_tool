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

<hr class="divider"></hr>

{assign var="open_box" value="1"}
{assign var="cont" value="0"}

<div id="yearSelect">
	<form name="form" method="post" action="papers-list.php">
	<div>
		<label>Select the year</label>
	   	<select class="chzn-select" name="year" onchange="document.form.submit();">
			{html_options options=$years selected=$year}	
	    </select>
	</div>
	</form>
</div>

<div class="box">
    <div class="box-header"><h3>&nbsp;&nbsp;&nbsp;{$year} - [{$papers|@count} papers]</h3></div>
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
				</tr>
			</thead>

			<tbody role="alert" aria-live="polite" aria-relevant="all">
				{foreach from=$papers item=row}
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
					<td class="colSelectsTaxonomies" id="colSelectsTaxonomiesID_{$row.id}" data-selectBorderColor="{$row.taxonomyColorCode}" style="text-align: center;">
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
    				<td >{$row.venue}</td>
    				<td class="center "><a href="{$row.pdf_link}" target="_blank"><i class="icon-external-link"></a></a></i></a></td>
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
