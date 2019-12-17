<?php
if (!isset($_REQUEST['signup'])) {
    require_once "session.php";
}
require_once "../conf/general.php";
require_once INCLUDE_SMARTY;
require_once INCLUDE_ADODB;
require_once INCLUDE_ADODB_ERROR;
require_once INCLUDE_RBAC;



$smarty = new Smarty();

$smarty->assign('IMAGES_PATH',IMAGES_PATH);
$smarty->assign('JS_PATH',JS_PATH);
$smarty->assign('CSS_PATH',CSS_PATH);
$smarty->assign('JS_LIBS_PATH',JS_LIBS_PATH);
$smarty->assign('CSS_LIBS_PATH',CSS_LIBS_PATH);

$smarty->assign('SYS_TITLE',SYS_TITLE);

if (!isset($_REQUEST['signup'])) {
    if (!rbac_check('g_user_add')) {
        die("You don't have permission to add users");
    } else {
        $smarty->assign('title', 'Users');
        $smarty->assign('sub_title', 'Add new user');
        $smarty->assign('btn_label', 'Add User');
        $smarty->assign('operation', OPERATION_USER_ADD);
    }
} else {
    $smarty->assign('title', 'Sign Up');
    $smarty->assign('sub_title', 'Register to use paper tool');
    $smarty->assign('btn_label', 'Sign Up');
    $smarty->assign('operation', OPERATION_USER_SIGN_UP);
    if (isset($_REQUEST['invite_code'])) {
        $smarty->assign('invite_code', $_REQUEST['invite_code']);
    } else {
        $smarty->assign('invite_code', null);
    }
}

$smarty->display('users-add.tpl');
?>
