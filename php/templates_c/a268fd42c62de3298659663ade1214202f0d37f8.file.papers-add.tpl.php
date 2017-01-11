<?php /* Smarty version Smarty-3.1.13, created on 2014-07-29 14:19:45
         compiled from "./templates/papers-add.tpl" */ ?>
<?php /*%%SmartyHeaderCode:202472483353d7d7b1172d81-41508551%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'a268fd42c62de3298659663ade1214202f0d37f8' => 
    array (
      0 => './templates/papers-add.tpl',
      1 => 1387306328,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '202472483353d7d7b1172d81-41508551',
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
    'years' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_53d7d7b13895a3_21723178',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_53d7d7b13895a3_21723178')) {function content_53d7d7b13895a3_21723178($_smarty_tpl) {?><?php if (!is_callable('smarty_function_html_options')) include '/var/www/visualization_paper/libs/php/smarty/libs/plugins/function.html_options.php';
?><!doctype html>
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

<div class="area-top clearfix">
	<div class="pull-left header">
    	<h3 class="title">
            <i class="icon-file"></i>
            Papers
      	</h3>
        <h5>
       		Adding a new paper
	</h5>
  	</div>
</div>

  	<div class="modal-body">
    	<form name="form" class="form-horizontal fill-up separate-sections" method="post" enctype="multipart/form-data" action="papers-con.php">
			<input type="hidden" value="1" id="operation" name="operation"/>
      		<div>
        		<label>Paper title</label>
        		<input type="text" name="title" placeholder="title" required/>
      		</div>

			<div>
            	<label>Paper year</label>
               	<select class="chzn-select" name="year" style="width:40%">
					<?php echo smarty_function_html_options(array('options'=>$_smarty_tpl->tpl_vars['years']->value),$_smarty_tpl);?>
	
                </select>
			</div>
			
			<div>
                <label>Citations</label>
                <input type="text" pattern="\d*" name="citations" placeholder="citations (just numbers)" maxlength="5"/>
            </div>

			<div>
                <label>Vehicle</label>
                <input type="text" name="vehicle" placeholder="vehicle" required/>
            </div>

			<div>
                <label>Vehicle site</label>
                <input type="url" name="site" placeholder="site" required/>
            </div>
		
			<div>
				<label>Comments</label>
        		<textarea rows="4" placeholder="enter a brief paper explanation" name="comments"></textarea>
      		</div>
			
            <div>
                <label>Paper upload</label>
				<div class="uploader">
            	<input name="paper" type="file" required><span style="-moz-user-select: none;" class="filename">No file selected</span><span style="-moz-user-select: none;" class="action">+</span>
				</div>
			</div>
	</div>
	<div class="modal-footer">
    	<input type="submit" id="add-paper" class="btn btn-blue" value="Add paper"/>
  	</div>
	</form>

</body>
</html>
<?php }} ?>