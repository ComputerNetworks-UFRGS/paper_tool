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
	<link href="{$CSS_LIBS_PATH}jquery.rating.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="{$CSS_PATH}papers.css" media="screen" rel="stylesheet" type="text/css" />
	
	<!--[if lt IE 9]>
	<script src="../../javascripts/vendor/html5shiv.js" type="text/javascript"></script>
	<script src="../../javascripts/vendor/excanvas.js" type="text/javascript"></script>
	<![endif]-->
	<script src="{$JS_LIBS_PATH}application.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}alertify/alertify.min.js" type="text/javascript"></script>
	<script src="{$JS_LIBS_PATH}jquery.rating.pack.js" type="text/javascript"></script>
	<script src="{$JS_PATH}papers.js" type="text/javascript"></script>
	
</head>

<body >

<div class="area-top clearfix">
	<div class="pull-left header">
    	<h3 class="title">
         	Network Management Taxonomy
      	</h3>
        <h5>
       		Paper classification
		</h5>
  	</div>
</div>
<form name="taxonomy-id" method="post" id="taxonomy-id">
<div class="paper_info">
	<h4 class="paper_field">ID:</h4><h4 class="paper_content">{$paper[0].id}</h4>
	<h4 class="paper_field">Paper title:</h4><h4 class="paper_content">{$paper[0].title}</h4>
	<h4 class="paper_field">Year:</h4><h4 class="paper_content">{$paper[0].year}</h4>
	<h4 class="paper_field">Citations:</h4><h4 class="paper_content">{$paper[0].citations}</h4>
	<h4 class="paper_field">Vehicle:</h4><h4 class="paper_content">{$paper[0].vehicle}</h4>
	<h4 class="paper_field">Rating:</h4>
	<h4 class="paper_content">
		{if $paper[0].network_rating == 1}
			<input name="star1" type="radio" class="star" value="1" checked/> 
		{else}
			<input name="star1" type="radio" class="star" value="1"/>
		{/if}

		{if $paper[0].network_rating == 2}
            <input name="star1" type="radio" class="star" value="2" checked/> 
        {else}
            <input name="star1" type="radio" class="star" value="2"/>
		{/if}

		{if $paper[0].network_rating == 3}
            <input name="star1" type="radio" class="star" value="3" checked/> 
        {else}
            <input name="star1" type="radio" class="star" value="3"/>
		{/if}

		{if $paper[0].network_rating == 4}
            <input name="star1" type="radio" class="star" value="4" checked/> 
        {else}
            <input name="star1" type="radio" class="star" value="4"/>
		{/if}

		{if $paper[0].network_rating == 5}
            <input name="star1" type="radio" class="star" value="5" checked/> 
        {else}
            <input name="star1" type="radio" class="star" value="5"/>		
		{/if}
	</h4>
</div>

<hr class="divider"></hr>

<div style="height: 100px;">
<ul class="action-nav-normal rounded">

  <li class="action-nav-button">
    <a href="../papers/{$paper[0].file}" target="_blank" class="tip" title="" data-original-title="Open paper file">
      <i class="icon-file"></i>
    </a>
  </li>

  <li class="action-nav-button">
    <a class="a-menu tip" title="" data-toggle="modal" href="#modal-form-add-comment" data-original-title="New comment">
      <i class="icon-comment"></i>
    </a>
  </li>

  <li class="action-nav-button">
    <a class="a-menu tip" title="" data-toggle="modal" href="#modal-form-add-previous-comment" data-original-title="Previous comments">
      <i class="icon-comments-alt"></i>
    </a>
    <span class="label label-black" id="previous-comment">{$comments}</span>
  </li>

  <li class="action-nav-button">
    <a href="#" class="tip" title="" id="withdraw-paper" data-original-title="Withdraw">
      <i class="icon-thumbs-down"></i>
    </a>
  </li>

  <li class="action-nav-button">
    <a href="#" class="tip" title="" id="save-paper" data-original-title="Save the paper score and taxonomy fields">
      <i class="icon-save"></i>
    </a>
  </li>

</ul>
</div>

<input type="hidden" name="operation" id="operation" value="2"/>
<input type="hidden" name="paper_id" id="paper_id" value="{$paper[0].id}"/>

<div class="box">
  <div class="box-header">
    <h3 style="text-align: center;">Taxonomy</h3>
  </div>

{assign var="cont" value="0"}
{assign var="open" value="1"}
{assign var="close" value="0"}
{assign var="line" value="0"}
{while $cont < $taxonomy|@count}

  		{if $close}	
			</tbody>
      </table>
      </div>
      {assign var="open" value="1"}
			{assign var="close" value="0"}	
	 		{/if}

			{if $open}
		  <div class="box-content">
    	<table class="table table-normal">
      <thead>
      <tr>
        <td colspan=4 style="text-align: left">{$taxonomy[{$cont}].topic}</td>
      </tr>
      </thead>
      <tbody>
								<tr>                  
        					<td width="25%">
														{if $taxonomy[{$cont}].flag}
														<input type="checkbox" name="subtopic[]" value="{$taxonomy[{$cont}].id}" checked/> {$taxonomy[{$cont}].subtopic}
														{else}
														<input type="checkbox" name="subtopic[]" value="{$taxonomy[{$cont}].id}"/> {$taxonomy[{$cont}].subtopic}
														{/if}
									</td>
				 	{assign var="open" value="0"}
					{assign var=cont value=$cont+1}     
  		{/if}
 
			{if $line}
		    <tr>
         <td width="25%">
              {if $taxonomy[{$cont}].flag}
              <input type="checkbox" name="subtopic[]" value="{$taxonomy[{$cont}].id}" checked/> {$taxonomy[{$cont}].subtopic}
              {else}
              <input type="checkbox" name="subtopic[]" value="{$taxonomy[{$cont}].id}"/> {$taxonomy[{$cont}].subtopic}
              {/if}
         </td>
         {assign var="line" value="0"}
         {assign var=cont value=$cont+1}
			{/if}

			{if $taxonomy[{$cont}].topic == $taxonomy[{$cont - 1}].topic}
					<td width="25%">
              {if $taxonomy[{$cont}].flag}
              <input type="checkbox" name="subtopic[]" value="{$taxonomy[{$cont}].id}" checked/> {$taxonomy[{$cont}].subtopic}
              {else}
              <input type="checkbox" name="subtopic[]" value="{$taxonomy[{$cont}].id}"/> {$taxonomy[{$cont}].subtopic}
              {/if}
     			</td>
				{assign var=cont value=$cont+1}
			{else}
					<td width="25%"></td>
					<td width="25%"></td>
					<td width="25%"></td>
					</tr>
     			{assign var="close" value="1"}
					{continue}
			{/if}

		{if $taxonomy[{$cont}].topic == $taxonomy[{$cont - 1}].topic}
     <td width="25%">
              {if $taxonomy[{$cont}].flag}
              <input type="checkbox" name="subtopic[]" value="{$taxonomy[{$cont}].id}" checked/> {$taxonomy[{$cont}].subtopic}
              {else}
              <input type="checkbox" name="subtopic[]" value="{$taxonomy[{$cont}].id}"/> {$taxonomy[{$cont}].subtopic}
              {/if}
     </td>
				 {assign var=cont value=$cont+1}
  	{else}  
  			<td width="25%"></td>
     		<td width="25%"></td>
					</tr>
					{assign var="close" value="1"}
     {continue}
		{/if}

		{if $taxonomy[{$cont}].topic == $taxonomy[{$cont - 1}].topic}
     <td width="25%">
              {if $taxonomy[{$cont}].flag}
              <input type="checkbox" name="subtopic[]" value="{$taxonomy[{$cont}].id}" checked/> {$taxonomy[{$cont}].subtopic}
              {else}
              <input type="checkbox" name="subtopic[]" value="{$taxonomy[{$cont}].id}" /> {$taxonomy[{$cont}].subtopic}
              {/if}
     </td>
					</tr>
					{assign var=cont value=$cont+1}
  {else}  
     <td width="25%"></td>
					</tr>
					{assign var="close" value="1"}
     {continue}
  {/if}

		{if $taxonomy[{$cont}].topic != $taxonomy[{$cont - 1}].topic}
					{assign var="close" value="1"}
		{else}
					{assign var="line" value="1"}
		{/if}
	
{/while}
</div>
</form>

<form name="withdraw" method="post" id="withdraw" action="papers-con.php">
<input type="hidden" name="operation" id="operation" value="3"/>
<input type="hidden" name="paper_id" id="paper_id" value="{$paper[0].id}"/>
</form>

{include file="paper_add_nm_comment.tpl"}
{include file="paper_add_nm_previous_comment.tpl"}

</body>
</html>
