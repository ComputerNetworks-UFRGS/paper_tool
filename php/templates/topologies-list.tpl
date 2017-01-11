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
	<link href="{$CSS_PATH}topologies-list.css" media="screen" rel="stylesheet" type="text/css" />
	
	<!--[if lt IE 9]>
	<script src="../../javascripts/vendor/html5shiv.js" type="text/javascript"></script>
	<script src="../../javascripts/vendor/excanvas.js" type="text/javascript"></script>
	<![endif]-->
	<script src="{$JS_LIBS_PATH}application.js" type="text/javascript"></script>
	<script src="{$JS_PATH}topologies-list.js" type="text/javascript"></script>
	
</head>

<body >

<div class="area-top clearfix">
	<div class="pull-left header">
    	<h3 class="title">
            <i class="icon-sitemap"></i>
            My topologies
      	</h3>
        <h5>
        	Select topologies bellow
       	</h5>
  	</div>
	<div class="action-nav-normal">
		<div class="row-fluid">
    		<div class="span2 action-nav-button">
      			<a data-toggle="modal" href="#modal-form" title="New Topology">
					<i class="icon-file-alt"></i>
        			<span>New Topology</span>
      			</a>
      			<span class="triangle-button green"><i class="icon-plus"></i></span>
    		</div>
  		</div>
	</div>
</div>

<form name="form-topo" method="post" action="topology.php" id="form-topo">
	<input type="hidden" name="id-topology" id="id-topology" value="" />
</form>

{assign var=cont value=0}
{section name=topologies loop=$topologies_count step=2}
	<div class="row-fluid">
  		<div class="span6">
    		<div class="box">
      			<div class="box-header">
        			<span class="title"><i class="icon-sitemap"></i> {$topologies[topologies].alias}</span>
					<span class="show-topo"><a href="#" class="show-link" data-id="{$topologies[topologies].id}">show</a>&nbsp;&nbsp;
					<i class="icon-eye-open"></i></span>
      			</div>
      			<div class="box-content padded">
					<button class="btn btn-red">code #{$topologies[topologies].id}</button>
					<h4>Description</h4>
					<p>{$topologies[topologies].description}</p>
					<h6 class="footnote-date">Performed in {$topologies[topologies].date} {$topologies[topologies].hour}</h6>
      			</div>
    		</div>
  		</div>
		{assign var=cont value=$cont+1}
		{if $cont < $topologies_count}
		<div class="span6">
    		<div class="box">
    			<div class="box-header">
                    <span class="title"><i class="icon-sitemap"></i> {$topologies[$cont].alias}</span>
                    <span class="show-topo"><a href="#" class="show-link" data-id="{$topologies[$cont].id}">show</a>&nbsp;&nbsp;
					<i class="icon-eye-open"></i></span>
                </div>
                <div class="box-content padded">
                    <button class="btn btn-red">code #{$topologies[$cont].id}</button>
                    <h4>Description</h4>
                    <p>{$topologies[$cont].description}</p>
                    <h6 class="footnote-date">Performed in {$topologies[topologies + 1].date} {$topologies[topologies + 1].hour}</h6>
                </div>
			</div>
  		</div>
		{assign var=cont value=$cont+1}
		{/if}
	</div>
{/section}

{include file="topology-new-modal.tpl"}

</body>
</html>
