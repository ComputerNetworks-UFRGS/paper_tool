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

$smarty->assign('admin', rbac_check('g_project_add'));

$conexao = ADONewConnection(DATABASE_DRIVER);
$conexao->Connect(DATABASE_SERVER, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME);

$sSQL = " SELECT id,username from users where active = 1 order by username ";

//workaround to buggy GetAssoc() in adodb 5.21 --ggf
$arr = $conexao->GetArray($sSQL);
$users = array();
foreach ($arr as $item) {
    $users[$item[0]] = $item[1];
}

$smarty->assign('users',$users);

$smarty->display('projects-add.tpl');
?>
