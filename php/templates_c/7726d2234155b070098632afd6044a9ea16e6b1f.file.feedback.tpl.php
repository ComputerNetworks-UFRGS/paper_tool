<?php /* Smarty version Smarty-3.1.13, created on 2014-07-28 14:00:27
         compiled from "./templates/feedback.tpl" */ ?>
<?php /*%%SmartyHeaderCode:92204896253d681ab682088-23264024%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '7726d2234155b070098632afd6044a9ea16e6b1f' => 
    array (
      0 => './templates/feedback.tpl',
      1 => 1387308640,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '92204896253d681ab682088-23264024',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'SYS_TITLE' => 0,
    'CSS_LIBS_PATH' => 0,
    'CSS_PATH' => 0,
    'JS_LIBS_PATH' => 0,
    'JS_PATH' => 0,
    'msg' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_53d681ab8a7a02_92130034',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_53d681ab8a7a02_92130034')) {function content_53d681ab8a7a02_92130034($_smarty_tpl) {?><!doctype html>
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
	<link href="<?php echo $_smarty_tpl->tpl_vars['CSS_PATH']->value;?>
papers.css" media="screen" rel="stylesheet" type="text/css" />
	
	<!--[if lt IE 9]>
	<script src="../../javascripts/vendor/html5shiv.js" type="text/javascript"></script>
	<script src="../../javascripts/vendor/excanvas.js" type="text/javascript"></script>
	<![endif]-->
	<script src="<?php echo $_smarty_tpl->tpl_vars['JS_LIBS_PATH']->value;?>
application.js" type="text/javascript"></script>
	<script src="<?php echo $_smarty_tpl->tpl_vars['JS_LIBS_PATH']->value;?>
alertify/alertify.min.js" type="text/javascript"></script>
	<script src="<?php echo $_smarty_tpl->tpl_vars['JS_PATH']->value;?>
papers.js" type="text/javascript"></script>
	
</head>
<body >

	<h1 class="feedback"><?php echo $_smarty_tpl->tpl_vars['msg']->value;?>
</h1>

</body>
</html>
<?php }} ?>