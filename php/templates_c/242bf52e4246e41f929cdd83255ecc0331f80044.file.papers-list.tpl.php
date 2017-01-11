<?php /* Smarty version Smarty-3.1.13, created on 2014-08-12 10:02:33
         compiled from "./templates/papers-list.tpl" */ ?>
<?php /*%%SmartyHeaderCode:7193171453c1df83eecc59-43885910%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '242bf52e4246e41f929cdd83255ecc0331f80044' => 
    array (
      0 => './templates/papers-list.tpl',
      1 => 1407848547,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '7193171453c1df83eecc59-43885910',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_53c1df844335c5_91220218',
  'variables' => 
  array (
    'SYS_TITLE' => 0,
    'CSS_LIBS_PATH' => 0,
    'CSS_PATH' => 0,
    'JS_LIBS_PATH' => 0,
    'JS_PATH' => 0,
    'papers' => 0,
    'open_box' => 0,
    'row' => 0,
    'cont' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_53c1df844335c5_91220218')) {function content_53c1df844335c5_91220218($_smarty_tpl) {?><!doctype html>
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
       		List of Papers
		</h5>
  	</div>
</div>

<div class="paper_info">
	<h4 style=" width: 100%; text-align: right; color: #08C;"><a sytle="float: right; color: #08C;" href="network-taxonomy-visualization.php">View taxonomy treemap</a></h4>
    <h3>Some instructions:</h3>
	<h5>"VS" and "NS" columns show, respectively, the score of the paper in the visualization and network management fields.</h5>
	<h5>The column "V" refers to the paper's classification in the Visualization taxonomy.</h5>
	<h5>The column "N" refers to the paper's classification in the Network Management taxonomy.</h5>
	<h5>The red circle (<div class="circler" style="display: inline-table;"></div>) means that the paper either has not been evaluated or may be withdrawn (a first analysis was already done). Otherwise, is used a green circle (<div class="circleg" style="display: inline-table;"></div>).</h5>
	<h5>To evaluate a paper in a taxonomy, just click on the corresponding circle.</h5>
	<h5>PS: circles in the column "V" are disabled, because the Visualization taxonomy was not defined yet.</h5>
</div>

<hr class="divider"></hr>

<?php $_smarty_tpl->tpl_vars["open_box"] = new Smarty_variable("1", null, 0);?>
<?php $_smarty_tpl->tpl_vars["cont"] = new Smarty_variable("0", null, 0);?>

<?php  $_smarty_tpl->tpl_vars['row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['papers']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['row']->key => $_smarty_tpl->tpl_vars['row']->value){
$_smarty_tpl->tpl_vars['row']->_loop = true;
?>
	
	<?php if ($_smarty_tpl->tpl_vars['open_box']->value==1){?>
<div class="box">
    <div class="box-header"><h3>&nbsp;&nbsp;&nbsp;<?php echo $_smarty_tpl->tpl_vars['row']->value['year'];?>
</h3></div>
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
							<th name="Viz" tabindex="0" rowspan="1" colspan="1">
                                <div>VS</div>
                            </th>
                            <th name="Man" tabindex="0" rowspan="1" colspan="1">
                                <div>NS</div>
                            </th>
							<th name="Viz" tabindex="0" rowspan="1" colspan="1">
                                <div>V</div>
                            </th>
							<th name="Man" tabindex="0" rowspan="1" colspan="1">
                                <div>N</div>
                            </th>
							<th class="sorting" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1">
								<div>Citations</div>
							</th>
							<th class="sorting" role="columnheader" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1">
								<div>Vehicle</div>
							</th>
							<th name="preview" tabindex="0" rowspan="1" colspan="1">
                                <div>Preview</div>
                            </th>
						</tr>
					</thead>

					<tbody role="alert" aria-live="polite" aria-relevant="all">
						<tr>
							<td ><?php echo $_smarty_tpl->tpl_vars['row']->value['id'];?>
</td>
            				<td ><?php echo $_smarty_tpl->tpl_vars['row']->value['title'];?>
</td>
							<td ><?php echo $_smarty_tpl->tpl_vars['row']->value['visualization_rating'];?>
</td>
            				<td ><?php echo $_smarty_tpl->tpl_vars['row']->value['network_rating'];?>
</td>
							<td>
								<?php if ($_smarty_tpl->tpl_vars['row']->value['viz']){?>
									<a href="visualization-taxonomy.php?id=<?php echo $_smarty_tpl->tpl_vars['row']->value['id'];?>
"><div class="circleg"></div></a>
								<?php }else{ ?>
									<a href="visualization-taxonomy.php?id=<?php echo $_smarty_tpl->tpl_vars['row']->value['id'];?>
"><div class="circler"></div></a>
								<?php }?>
							</td>
                            <td>
								<?php if ($_smarty_tpl->tpl_vars['row']->value['man']){?>
									<a href="network-taxonomy.php?id=<?php echo $_smarty_tpl->tpl_vars['row']->value['id'];?>
"><div class="circleg"></div></a>
								<?php }else{ ?>
									<a href="network-taxonomy.php?id=<?php echo $_smarty_tpl->tpl_vars['row']->value['id'];?>
"><div class="circler"></div></a>
								<?php }?>
							</td>
            				<td class="center "><?php echo $_smarty_tpl->tpl_vars['row']->value['citations'];?>
</td>
            				<td ><?php echo $_smarty_tpl->tpl_vars['row']->value['vehicle'];?>
<a href="<?php echo $_smarty_tpl->tpl_vars['row']->value['site'];?>
" target="_blank">&nbsp;<i class="icon-external-link"></a></td>
            				<td class="center "><a href="../papers/<?php echo $_smarty_tpl->tpl_vars['row']->value['file'];?>
" target="_blank"><i class="icon-file"></i></a></i></a></td>
        				</tr>
		<?php $_smarty_tpl->tpl_vars["open_box"] = new Smarty_variable("0", null, 0);?>	
	<?php }else{ ?>
		<tr>
			<td ><?php echo $_smarty_tpl->tpl_vars['row']->value['id'];?>
</td>
            <td ><?php echo $_smarty_tpl->tpl_vars['row']->value['title'];?>
</td>
			<td ><?php echo $_smarty_tpl->tpl_vars['row']->value['visualization_rating'];?>
</td>
			<td ><?php echo $_smarty_tpl->tpl_vars['row']->value['network_rating'];?>
</td>
            <td>
            	<?php if ($_smarty_tpl->tpl_vars['row']->value['viz']){?>
              		<a href="visualization-taxonomy.php?id=<?php echo $_smarty_tpl->tpl_vars['row']->value['id'];?>
"><div class="circleg"></div></a>
               	<?php }else{ ?>
                	<a href="visualization-taxonomy.php?id=<?php echo $_smarty_tpl->tpl_vars['row']->value['id'];?>
"><div class="circler"></div></a>
              	<?php }?>
            </td>
            <td>
				<?php if ($_smarty_tpl->tpl_vars['row']->value['man']){?>
              		<a href="network-taxonomy.php?id=<?php echo $_smarty_tpl->tpl_vars['row']->value['id'];?>
"><div class="circleg"></div></a>
               	<?php }else{ ?>
                	<a href="network-taxonomy.php?id=<?php echo $_smarty_tpl->tpl_vars['row']->value['id'];?>
"><div class="circler"></div></a>
              	<?php }?>	
			</td>
			<td class="center "><?php echo $_smarty_tpl->tpl_vars['row']->value['citations'];?>
</td>
            <td ><?php echo $_smarty_tpl->tpl_vars['row']->value['vehicle'];?>
<a href="<?php echo $_smarty_tpl->tpl_vars['row']->value['site'];?>
" target="_blank">&nbsp;<i class="icon-external-link"></a></td>
			<td class="center "><a href="../papers/<?php echo $_smarty_tpl->tpl_vars['row']->value['file'];?>
" target="_blank"><i class="icon-file"></i></a></i></a></td>
		</tr>
	<?php }?>

	<?php ob_start();?><?php echo $_smarty_tpl->tpl_vars['cont']->value+1;?>
<?php $_tmp1=ob_get_clean();?><?php if ($_smarty_tpl->tpl_vars['papers']->value[$_tmp1]['year']!=$_smarty_tpl->tpl_vars['row']->value['year']){?>
					</tbody>
          		</table>
            </div>
        </div>
    </div>
</div>
<br/>
	<?php $_smarty_tpl->tpl_vars["open_box"] = new Smarty_variable("1", null, 0);?>
	<?php }?>
	
	<?php $_smarty_tpl->tpl_vars['cont'] = new Smarty_variable($_smarty_tpl->tpl_vars['cont']->value+1, null, 0);?>
<?php } ?>

</body>
</html>
<?php }} ?>