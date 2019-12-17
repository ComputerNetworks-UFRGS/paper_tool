<?php
require_once "session.php";
require_once "../conf/general.php";
require_once INCLUDE_SMARTY;
require_once INCLUDE_ADODB;
require_once INCLUDE_ADODB_ERROR;
require_once INCLUDE_RBAC;
require_once "project_id.php";


if (!rbac_check('project_view', $PROJECT_ID)) {
    die("You don't have permission to view this project");
}
if (!rbac_check('paper_add', $PROJECT_ID)) {
    die("You don't have permission to add papers on this project");
}

$smarty = new Smarty();
$smarty->assign('project_id', $PROJECT_ID);

$smarty->assign('IMAGES_PATH',IMAGES_PATH);
$smarty->assign('JS_PATH',JS_PATH);
$smarty->assign('CSS_PATH',CSS_PATH);
$smarty->assign('JS_LIBS_PATH',JS_LIBS_PATH);
$smarty->assign('CSS_LIBS_PATH',CSS_LIBS_PATH);

$smarty->assign('SYS_TITLE',SYS_TITLE);

$smarty->assign('USERNAME',$_SESSION['username']);

$years = array();
for($i = 1980; $i <= 2050; $i++){
	$years[$i] = $i;
}

$smarty->assign('years',$years);


$smarty->display('papers-add.tpl');
?>
