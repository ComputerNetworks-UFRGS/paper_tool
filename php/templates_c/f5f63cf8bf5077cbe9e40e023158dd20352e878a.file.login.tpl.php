<?php /* Smarty version Smarty-3.1.13, created on 2014-07-13 19:15:32
         compiled from "./templates/login.tpl" */ ?>
<?php /*%%SmartyHeaderCode:197131622053c30504ab3603-89028164%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'f5f63cf8bf5077cbe9e40e023158dd20352e878a' => 
    array (
      0 => './templates/login.tpl',
      1 => 1389566868,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '197131622053c30504ab3603-89028164',
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
    'erro' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_53c30504c99c13_60882438',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_53c30504c99c13_60882438')) {function content_53c30504c99c13_60882438($_smarty_tpl) {?><!doctype html>
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

<!--
  <link href="<?php echo $_smarty_tpl->tpl_vars['CSS_LIBS_PATH']->value;?>
box.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="<?php echo $_smarty_tpl->tpl_vars['CSS_LIBS_PATH']->value;?>
bootstrap/bootstrap.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="<?php echo $_smarty_tpl->tpl_vars['CSS_LIBS_PATH']->value;?>
bootstrap/responsive.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="<?php echo $_smarty_tpl->tpl_vars['CSS_LIBS_PATH']->value;?>
base.css" media="screen" rel="stylesheet" type="text/css" />
  <link href="<?php echo $_smarty_tpl->tpl_vars['CSS_LIBS_PATH']->value;?>
buttons.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="<?php echo $_smarty_tpl->tpl_vars['CSS_LIBS_PATH']->value;?>
bootstrap-editable.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="<?php echo $_smarty_tpl->tpl_vars['CSS_LIBS_PATH']->value;?>
bootstrap_include.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="<?php echo $_smarty_tpl->tpl_vars['CSS_LIBS_PATH']->value;?>
form_elements.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="<?php echo $_smarty_tpl->tpl_vars['CSS_LIBS_PATH']->value;?>
font-awesome.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="<?php echo $_smarty_tpl->tpl_vars['CSS_LIBS_PATH']->value;?>
sidebar.css" media="screen" rel="stylesheet" type="text/css" />
-->
	<link href="<?php echo $_smarty_tpl->tpl_vars['CSS_LIBS_PATH']->value;?>
application.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="<?php echo $_smarty_tpl->tpl_vars['CSS_PATH']->value;?>
login.css" media="screen" rel="stylesheet" type="text/css" />

	<script src="<?php echo $_smarty_tpl->tpl_vars['JS_LIBS_PATH']->value;?>
application.js" type="text/javascript"></script>
	<script src="<?php echo $_smarty_tpl->tpl_vars['JS_PATH']->value;?>
login.js" type="text/javascript"></script>
</head>

<body>

	<div class="container">
  <!--		<div class="span4 offset4"> -->
			<div class="padded">
				<div class="logo">
					<h1>Visualization and Network Management paper</h1>
					<p class="lead">
					Support tool
					</p>
    			</div>
				<div class="login box" style="margin-top: 40px;">
					<div class="box-header">
        				<span class="title">Login</span>
      				</div>
					<div class="box-content padded">
        				<form class="separate-sections" method="post" name="formulario" id="formulario" action="redirect.php">
          					<div class="input-prepend">
          						<span class="add-on" href="#">
            						<i class="icon-user"></i>
          						</span>
            					<input type="text" placeholder="username" name="username" />
          					</div>
							<div class="input-prepend">
          						<span class="add-on" href="#">
            						<i class="icon-key"></i>
          						</span>
            					<input type="password" placeholder="pass" name="pass" id="pass"/>
          					</div>
							<?php if ($_smarty_tpl->tpl_vars['erro']->value){?>
								<div style="text-align: center;">
                                	<p style="color: red;"><strong>Dados de acesso incorretos!</strong></p>
                            	</div>
							<?php }?>
							<div>
            					<a class="btn btn-blue btn-block" id="btn" href="#">Login <i class="icon-signin"></i></a>
          					</div>
						</form>
      				</div>
				</div>
  			</div>
	<!--	</div> -->
	</div>

</body>
</html>
<?php }} ?>