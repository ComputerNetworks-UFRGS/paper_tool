<?php /* Smarty version Smarty-3.1.13, created on 2014-07-12 22:23:25
         compiled from "./templates/paper_add_nm_comment.tpl" */ ?>
<?php /*%%SmartyHeaderCode:192711377253c1df8d3cc377-38292210%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '9650880cdcd5098af73740ebe21ce1d383df47a2' => 
    array (
      0 => './templates/paper_add_nm_comment.tpl',
      1 => 1389548876,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '192711377253c1df8d3cc377-38292210',
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
  'unifunc' => 'content_53c1df8d3f9a76_43154024',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_53c1df8d3f9a76_43154024')) {function content_53c1df8d3f9a76_43154024($_smarty_tpl) {?><div id="modal-form-add-comment" class="modal hide fade">
  	<div class="modal-header">
    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    	<h6 id="modal-formLabel">Add comment</h6>
  	</div>
  	<div>
        <form class="form-horizontal fill-up separate-sections" name="paper-add-comment" id="paper-add-comment">
					<input type="hidden" name="operation" id="operation" value="4"/>
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