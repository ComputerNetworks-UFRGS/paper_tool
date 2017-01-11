<?php /* Smarty version Smarty-3.1.13, created on 2014-07-12 22:40:54
         compiled from "./templates/visualization-taxonomy.tpl" */ ?>
<?php /*%%SmartyHeaderCode:67656201253c1e3a6e36706-61668466%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'a7e857b9198c0365b7bc36168d99abe3d5d2bd84' => 
    array (
      0 => './templates/visualization-taxonomy.tpl',
      1 => 1405215639,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '67656201253c1e3a6e36706-61668466',
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
    'paper' => 0,
    'comments' => 0,
    'cont' => 0,
    'taxonomy' => 0,
    'close' => 0,
    'open' => 0,
    'line' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_53c1e3a79bf290_02189169',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_53c1e3a79bf290_02189169')) {function content_53c1e3a79bf290_02189169($_smarty_tpl) {?><!doctype html>
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
	<script src="<?php echo $_smarty_tpl->tpl_vars['JS_LIBS_PATH']->value;?>
jquery.rating.pack.js" type="text/javascript"></script>
	<script src="<?php echo $_smarty_tpl->tpl_vars['JS_PATH']->value;?>
papers.js" type="text/javascript"></script>
	
</head>

<body >

<div class="area-top clearfix">
	<div class="pull-left header">
    	<h3 class="title">
         	Visualization Taxonomy
      	</h3>
        <h5>
       		Paper classification
		</h5>
  	</div>
</div>
<form name="taxonomy-id" method="post" id="taxonomy-id">
<div class="paper_info">
	<h4 class="paper_field">ID:</h4><h4 class="paper_content"><?php echo $_smarty_tpl->tpl_vars['paper']->value[0]['id'];?>
</h4>
	<h4 class="paper_field">Paper title:</h4><h4 class="paper_content"><?php echo $_smarty_tpl->tpl_vars['paper']->value[0]['title'];?>
</h4>
	<h4 class="paper_field">Year:</h4><h4 class="paper_content"><?php echo $_smarty_tpl->tpl_vars['paper']->value[0]['year'];?>
</h4>
	<h4 class="paper_field">Citations:</h4><h4 class="paper_content"><?php echo $_smarty_tpl->tpl_vars['paper']->value[0]['citations'];?>
</h4>
	<h4 class="paper_field">Vehicle:</h4><h4 class="paper_content"><?php echo $_smarty_tpl->tpl_vars['paper']->value[0]['vehicle'];?>
</h4>
	<h4 class="paper_field">Rating:</h4>
	<h4 class="paper_content">
		<?php if ($_smarty_tpl->tpl_vars['paper']->value[0]['visualization_rating']==1){?>
			<input name="star1" type="radio" class="star" value="1" checked/> 
		<?php }else{ ?>
			<input name="star1" type="radio" class="star" value="1"/>
		<?php }?>

		<?php if ($_smarty_tpl->tpl_vars['paper']->value[0]['visualization_rating']==2){?>
            <input name="star1" type="radio" class="star" value="2" checked/> 
        <?php }else{ ?>
            <input name="star1" type="radio" class="star" value="2"/>
		<?php }?>

		<?php if ($_smarty_tpl->tpl_vars['paper']->value[0]['visualization_rating']==3){?>
            <input name="star1" type="radio" class="star" value="3" checked/> 
        <?php }else{ ?>
            <input name="star1" type="radio" class="star" value="3"/>
		<?php }?>

		<?php if ($_smarty_tpl->tpl_vars['paper']->value[0]['visualization_rating']==4){?>
            <input name="star1" type="radio" class="star" value="4" checked/> 
        <?php }else{ ?>
            <input name="star1" type="radio" class="star" value="4"/>
		<?php }?>

		<?php if ($_smarty_tpl->tpl_vars['paper']->value[0]['visualization_rating']==5){?>
            <input name="star1" type="radio" class="star" value="5" checked/> 
        <?php }else{ ?>
            <input name="star1" type="radio" class="star" value="5"/>		
		<?php }?>
	</h4>
</div>

<hr class="divider"></hr>

<div style="height: 100px;">
<ul class="action-nav-normal rounded">

  <li class="action-nav-button">
    <a href="../papers/<?php echo $_smarty_tpl->tpl_vars['paper']->value[0]['file'];?>
" target="_blank" class="tip" title="" data-original-title="Open paper file">
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
    <span class="label label-black" id="previous-comment"><?php echo $_smarty_tpl->tpl_vars['comments']->value;?>
</span>
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

<input type="hidden" name="operation" id="operation" value="6"/>
<input type="hidden" name="paper_id" id="paper_id" value="<?php echo $_smarty_tpl->tpl_vars['paper']->value[0]['id'];?>
"/>

<div class="box">
  <div class="box-header">
    <h3 style="text-align: center;">Taxonomy</h3>
  </div>

<?php $_smarty_tpl->tpl_vars["cont"] = new Smarty_variable("0", null, 0);?>
<?php $_smarty_tpl->tpl_vars["open"] = new Smarty_variable("1", null, 0);?>
<?php $_smarty_tpl->tpl_vars["close"] = new Smarty_variable("0", null, 0);?>
<?php $_smarty_tpl->tpl_vars["line"] = new Smarty_variable("0", null, 0);?>
<?php while ($_smarty_tpl->tpl_vars['cont']->value<count($_smarty_tpl->tpl_vars['taxonomy']->value)){?>

  		<?php if ($_smarty_tpl->tpl_vars['close']->value){?>	
			</tbody>
      </table>
      </div>
      <?php $_smarty_tpl->tpl_vars["open"] = new Smarty_variable("1", null, 0);?>
			<?php $_smarty_tpl->tpl_vars["close"] = new Smarty_variable("0", null, 0);?>	
	 		<?php }?>

			<?php if ($_smarty_tpl->tpl_vars['open']->value){?>
		  <div class="box-content">
    	<table class="table table-normal">
      <thead>
      <tr>
        <td colspan=4 style="text-align: left"><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value;?>
<?php $_tmp1=ob_get_clean();?><?php echo $_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp1]['topic'];?>
</td>
      </tr>
      </thead>
      <tbody>
								<tr>                  
        					<td width="25%">
														<?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value;?>
<?php $_tmp2=ob_get_clean();?><?php if ($_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp2]['flag']){?>
														<input type="checkbox" name="subtopic[]" value="<?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value;?>
<?php $_tmp3=ob_get_clean();?><?php echo $_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp3]['id'];?>
" checked/> <?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value;?>
<?php $_tmp4=ob_get_clean();?><?php echo $_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp4]['subtopic'];?>

														<?php }else{ ?>
														<input type="checkbox" name="subtopic[]" value="<?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value;?>
<?php $_tmp5=ob_get_clean();?><?php echo $_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp5]['id'];?>
"/> <?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value;?>
<?php $_tmp6=ob_get_clean();?><?php echo $_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp6]['subtopic'];?>

														<?php }?>
									</td>
				 	<?php $_smarty_tpl->tpl_vars["open"] = new Smarty_variable("0", null, 0);?>
					<?php $_smarty_tpl->tpl_vars['cont'] = new Smarty_variable($_smarty_tpl->tpl_vars['cont']->value+1, null, 0);?>     
  		<?php }?>
 
			<?php if ($_smarty_tpl->tpl_vars['line']->value){?>
		    <tr>
         <td width="25%">
              <?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value;?>
<?php $_tmp7=ob_get_clean();?><?php if ($_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp7]['flag']){?>
              <input type="checkbox" name="subtopic[]" value="<?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value;?>
<?php $_tmp8=ob_get_clean();?><?php echo $_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp8]['id'];?>
" checked/> <?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value;?>
<?php $_tmp9=ob_get_clean();?><?php echo $_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp9]['subtopic'];?>

              <?php }else{ ?>
              <input type="checkbox" name="subtopic[]" value="<?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value;?>
<?php $_tmp10=ob_get_clean();?><?php echo $_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp10]['id'];?>
"/> <?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value;?>
<?php $_tmp11=ob_get_clean();?><?php echo $_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp11]['subtopic'];?>

              <?php }?>
         </td>
         <?php $_smarty_tpl->tpl_vars["line"] = new Smarty_variable("0", null, 0);?>
         <?php $_smarty_tpl->tpl_vars['cont'] = new Smarty_variable($_smarty_tpl->tpl_vars['cont']->value+1, null, 0);?>
			<?php }?>

			<?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value;?>
<?php $_tmp12=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value-1;?>
<?php $_tmp13=ob_get_clean();?><?php if ($_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp12]['topic']==$_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp13]['topic']){?>
					<td width="25%">
              <?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value;?>
<?php $_tmp14=ob_get_clean();?><?php if ($_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp14]['flag']){?>
              <input type="checkbox" name="subtopic[]" value="<?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value;?>
<?php $_tmp15=ob_get_clean();?><?php echo $_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp15]['id'];?>
" checked/> <?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value;?>
<?php $_tmp16=ob_get_clean();?><?php echo $_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp16]['subtopic'];?>

              <?php }else{ ?>
              <input type="checkbox" name="subtopic[]" value="<?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value;?>
<?php $_tmp17=ob_get_clean();?><?php echo $_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp17]['id'];?>
"/> <?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value;?>
<?php $_tmp18=ob_get_clean();?><?php echo $_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp18]['subtopic'];?>

              <?php }?>
     			</td>
				<?php $_smarty_tpl->tpl_vars['cont'] = new Smarty_variable($_smarty_tpl->tpl_vars['cont']->value+1, null, 0);?>
			<?php }else{ ?>
					<td width="25%"></td>
					<td width="25%"></td>
					<td width="25%"></td>
					</tr>
     			<?php $_smarty_tpl->tpl_vars["close"] = new Smarty_variable("1", null, 0);?>
					<?php continue 1?>
			<?php }?>

		<?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value;?>
<?php $_tmp19=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value-1;?>
<?php $_tmp20=ob_get_clean();?><?php if ($_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp19]['topic']==$_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp20]['topic']){?>
     <td width="25%">
              <?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value;?>
<?php $_tmp21=ob_get_clean();?><?php if ($_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp21]['flag']){?>
              <input type="checkbox" name="subtopic[]" value="<?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value;?>
<?php $_tmp22=ob_get_clean();?><?php echo $_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp22]['id'];?>
" checked/> <?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value;?>
<?php $_tmp23=ob_get_clean();?><?php echo $_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp23]['subtopic'];?>

              <?php }else{ ?>
              <input type="checkbox" name="subtopic[]" value="<?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value;?>
<?php $_tmp24=ob_get_clean();?><?php echo $_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp24]['id'];?>
"/> <?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value;?>
<?php $_tmp25=ob_get_clean();?><?php echo $_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp25]['subtopic'];?>

              <?php }?>
     </td>
				 <?php $_smarty_tpl->tpl_vars['cont'] = new Smarty_variable($_smarty_tpl->tpl_vars['cont']->value+1, null, 0);?>
  	<?php }else{ ?>  
  			<td width="25%"></td>
     		<td width="25%"></td>
					</tr>
					<?php $_smarty_tpl->tpl_vars["close"] = new Smarty_variable("1", null, 0);?>
     <?php continue 1?>
		<?php }?>

		<?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value;?>
<?php $_tmp26=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value-1;?>
<?php $_tmp27=ob_get_clean();?><?php if ($_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp26]['topic']==$_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp27]['topic']){?>
     <td width="25%">
              <?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value;?>
<?php $_tmp28=ob_get_clean();?><?php if ($_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp28]['flag']){?>
              <input type="checkbox" name="subtopic[]" value="<?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value;?>
<?php $_tmp29=ob_get_clean();?><?php echo $_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp29]['id'];?>
" checked/> <?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value;?>
<?php $_tmp30=ob_get_clean();?><?php echo $_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp30]['subtopic'];?>

              <?php }else{ ?>
              <input type="checkbox" name="subtopic[]" value="<?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value;?>
<?php $_tmp31=ob_get_clean();?><?php echo $_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp31]['id'];?>
" /> <?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value;?>
<?php $_tmp32=ob_get_clean();?><?php echo $_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp32]['subtopic'];?>

              <?php }?>
     </td>
					</tr>
					<?php $_smarty_tpl->tpl_vars['cont'] = new Smarty_variable($_smarty_tpl->tpl_vars['cont']->value+1, null, 0);?>
  <?php }else{ ?>  
     <td width="25%"></td>
					</tr>
					<?php $_smarty_tpl->tpl_vars["close"] = new Smarty_variable("1", null, 0);?>
     <?php continue 1?>
  <?php }?>

		<?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value;?>
<?php $_tmp33=ob_get_clean();?><?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value-1;?>
<?php $_tmp34=ob_get_clean();?><?php if ($_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp33]['topic']!=$_smarty_tpl->tpl_vars['taxonomy']->value[$_tmp34]['topic']){?>
					<?php $_smarty_tpl->tpl_vars["close"] = new Smarty_variable("1", null, 0);?>
		<?php }else{ ?>
					<?php $_smarty_tpl->tpl_vars["line"] = new Smarty_variable("1", null, 0);?>
		<?php }?>
	
<?php }?>
</div>
</form>

<form name="withdraw" method="post" id="withdraw" action="papers-con.php">
<input type="hidden" name="operation" id="operation" value="3"/>
<input type="hidden" name="paper_id" id="paper_id" value="<?php echo $_smarty_tpl->tpl_vars['paper']->value[0]['id'];?>
"/>
</form>

<?php echo $_smarty_tpl->getSubTemplate ("paper_add_viz_comment.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>

<?php echo $_smarty_tpl->getSubTemplate ("paper_add_viz_previous_comment.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>


</body>
</html>
<?php }} ?>