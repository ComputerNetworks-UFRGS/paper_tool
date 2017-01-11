<?php /* Smarty version Smarty-3.1.13, created on 2014-12-05 15:45:26
         compiled from "./templates/network-taxonomy-visualization.tpl" */ ?>
<?php /*%%SmartyHeaderCode:88707907753d69a01df1079-93966559%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '561f24d409aa18487559ad1a4f5503027b9464d2' => 
    array (
      0 => './templates/network-taxonomy-visualization.tpl',
      1 => 1417801513,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '88707907753d69a01df1079-93966559',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_53d69a0210ba88_62097525',
  'variables' => 
  array (
    'SYS_TITLE' => 0,
    'CSS_LIBS_PATH' => 0,
    'CSS_PATH' => 0,
    'JS_LIBS_PATH' => 0,
    'JS_PATH' => 0,
    'fileJSONTree' => 0,
    'fileJSONSunburst' => 0,
    'fileJSONTreeViz' => 0,
    'topic' => 0,
    'curr_id' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_53d69a0210ba88_62097525')) {function content_53d69a0210ba88_62097525($_smarty_tpl) {?><!doctype html>
<html>
<head>

	<meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800">
	
	<meta charset="utf-8">
	<!-- Always force latest IE rendering engine or request Chrome Frame -->
	<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">

	<!-- Use title if it's in the page YAML frontmatter -->
	<title><?php echo $_smarty_tpl->tpl_vars['SYS_TITLE']->value;?>
</title>
	
	<link href="<?php echo $_smarty_tpl->tpl_vars['CSS_LIBS_PATH']->value;?>
application.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="<?php echo $_smarty_tpl->tpl_vars['CSS_LIBS_PATH']->value;?>
alertify.core.css" media="screen" rel="stylesheet" type="text/css" />       
  <link href="<?php echo $_smarty_tpl->tpl_vars['CSS_LIBS_PATH']->value;?>
alertify.default.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="<?php echo $_smarty_tpl->tpl_vars['CSS_LIBS_PATH']->value;?>
jquery.rating.css" media="screen" rel="stylesheet" type="text/css" />
  <link href="<?php echo $_smarty_tpl->tpl_vars['CSS_LIBS_PATH']->value;?>
d3-tip.css" media="screen" rel="stylesheet" type="text/css" />
	<!-- <link href="<?php echo $_smarty_tpl->tpl_vars['CSS_PATH']->value;?>
papers.css" media="screen" rel="stylesheet" type="text/css" /> -->
	
	<!--[if lt IE 9]>
	<script src="../../javascripts/vendor/html5shiv.js" type="text/javascript"></script>
	<script src="../../javascripts/vendor/excanvas.js" type="text/javascript"></script>
	<![endif]-->
	<script src="<?php echo $_smarty_tpl->tpl_vars['JS_LIBS_PATH']->value;?>
application.js" type="text/javascript"></script>
	<script src="<?php echo $_smarty_tpl->tpl_vars['JS_LIBS_PATH']->value;?>
alertify/alertify.min.js" type="text/javascript"></script>
	<script src="<?php echo $_smarty_tpl->tpl_vars['JS_LIBS_PATH']->value;?>
jquery.rating.pack.js" type="text/javascript"></script>
  <!-- <script src="<?php echo $_smarty_tpl->tpl_vars['JS_LIBS_PATH']->value;?>
vendor/d3.js" type="text/javascript"></script> -->
  <script src="<?php echo $_smarty_tpl->tpl_vars['JS_LIBS_PATH']->value;?>
d3.v3.min.js" type="text/javascript"></script>
  <script src="<?php echo $_smarty_tpl->tpl_vars['JS_LIBS_PATH']->value;?>
vendor/d3-tip.js" type="text/javascript"></script>
	<script src="<?php echo $_smarty_tpl->tpl_vars['JS_PATH']->value;?>
network-management-visualization.js" type="text/javascript"></script>
	<style>
    body {
      font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
      margin: auto;
      position: relative;
      background-color: white;
    }

    form {
      position: absolute;
      right: 10px;
      top: 10px;
    }

    .node {
      border: solid 1px #535353;
      font: 10px sans-serif;
      line-height: 12px;
      overflow: hidden;
      position: absolute;
      text-indent: 2px;
      color: white;
      font-family: times;
    }

    .nodeText{
      margin-top: 2px;
      font-size: 16px;
    }

    p.white {
		color: white;
	}

	p.black {
        color: black;
    }

    #labelBox{
      width: 98%;
      margin: auto;
    }
    .labelTree{
      width: 1.5em;
      height: 1.5em;
      /* background-color: #F00; */
      float: left;
      margin-left: 0.4em;
      margin-top: 1em;
      border: 1px solid #ccc;
      text-align: center;
      font-family: times;
    }
    .labelText{
      float: left;
      margin-left: 0.1em;
      padding-top: 0.1em;
      margin-top: 1em;
      font-size: 1.2em;
      font-family: times;
      color: black;
    }

    #sunburst {
      position: absolute;
      top: 800px;
      background: white;
    }
  </style>
</head>

<body>

<!-- <div class="area-top clearfix">
	<div class="pull-left header">
    	<h3 class="title">
         	Network Management - Treemap Visualization
      	</h3>
  	</div>
</div> -->

<form>
  <input type="hidden" name="fileJSONTree" id="fileJSONTree" value="<?php echo $_smarty_tpl->tpl_vars['fileJSONTree']->value;?>
"/>
  <input type="hidden" name="fileJSONSunburst" id="fileJSONSunburst" value="<?php echo $_smarty_tpl->tpl_vars['fileJSONSunburst']->value;?>
"/>
  <input type="hidden" name="fileJSONTreeViz" id="fileJSONTreeViz" value="<?php echo $_smarty_tpl->tpl_vars['fileJSONTreeViz']->value;?>
"/>
</form>

<div id="labelBox">
  <?php  $_smarty_tpl->tpl_vars['curr_id'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['curr_id']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['topic']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['curr_id']->key => $_smarty_tpl->tpl_vars['curr_id']->value){
$_smarty_tpl->tpl_vars['curr_id']->_loop = true;
?>
    <div class="labelTree" style="background-color: <?php echo $_smarty_tpl->tpl_vars['curr_id']->value['color'];?>
; color: <?php echo $_smarty_tpl->tpl_vars['curr_id']->value['font_color'];?>
"></div><span class="labelText"><?php echo $_smarty_tpl->tpl_vars['curr_id']->value[1];?>
 (<?php echo $_smarty_tpl->tpl_vars['curr_id']->value['table_name'];?>
)</span>
  <?php } ?>
<div>

<!-- <div id="treemap">
</div> -->

<div id="treemapViz"> 
</div>

<!--<div id="sunburst">
</div>-->

</body>
</html>
<?php }} ?>