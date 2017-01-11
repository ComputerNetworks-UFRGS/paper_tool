<?php /* Smarty version Smarty-3.1.13, created on 2014-07-12 22:40:55
         compiled from "./templates/paper_add_viz_comment.tpl" */ ?>
<?php /*%%SmartyHeaderCode:164634852953c1e3a79df093-87074136%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'feeb27ab05baea3007f4adb2f24efb09d089d85e' => 
    array (
      0 => './templates/paper_add_viz_comment.tpl',
      1 => 1405210711,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '164634852953c1e3a79df093-87074136',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'paper' => 0,
    'userid' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_53c1e3a7a0c373_09702675',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_53c1e3a7a0c373_09702675')) {function content_53c1e3a7a0c373_09702675($_smarty_tpl) {?><div id="modal-form-add-comment" class="modal hide fade">
  	<div class="modal-header">
    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    	<h6 id="modal-formLabel">Add comment</h6>
  	</div>
  	<div>
        <form class="form-horizontal fill-up separate-sections" name="paper-add-comment" id="paper-add-comment">
					<input type="hidden" name="operation" id="operation" value="5"/>
					<input type="hidden" name="paper_id" id="paper_id" value="<?php echo $_smarty_tpl->tpl_vars['paper']->value[0]['id'];?>
"/>	
					<input type="hidden" name="userid" id="userid" value="<?php echo $_smarty_tpl->tpl_vars['userid']->value;?>
"/>	
					<div>
        		<textarea rows="10" name="comment" placeholder="Type comments" style="font-size: 14px;width: 99%;margin: auto;"></textarea>
      		</div>
				</form>
  	</div>
  	<div class="modal-footer">
    	<button class="btn btn-blue" data-dismiss="modal" id="btn-add-comment">Add comment</button>
  	</div>
</div>
<?php }} ?>