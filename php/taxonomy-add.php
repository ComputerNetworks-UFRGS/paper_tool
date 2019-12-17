<?php
require_once "session.php";
require_once "../conf/general.php";
require_once INCLUDE_SMARTY;
require_once INCLUDE_ADODB;
require_once INCLUDE_ADODB_ERROR;
require_once "project_id.php";

$smarty = new Smarty();
$smarty->assign('project_id', $PROJECT_ID);

$smarty->assign('IMAGES_PATH',IMAGES_PATH);
$smarty->assign('JS_PATH',JS_PATH);
$smarty->assign('CSS_PATH',CSS_PATH);
$smarty->assign('JS_LIBS_PATH',JS_LIBS_PATH);
$smarty->assign('CSS_LIBS_PATH',CSS_LIBS_PATH);

$smarty->assign('SYS_TITLE',SYS_TITLE);

$smarty->assign('USERNAME',$_SESSION['username']);

$conexao = ADONewConnection(DATABASE_DRIVER);
//$db->debug = true;
$conexao->Connect(DATABASE_SERVER, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME);

$params = array();
$sSQL = "SELECT id,name from taxonomies where active = 1 and project_id = ? order by name";
$params[] = $PROJECT_ID;

//workaround to buggy GetAssoc() in adodb 5.21 --ggf
$arr = $conexao->GetArray($sSQL, $params);
$taxonomies = array();
foreach ($arr as $item) {
    $taxonomies[$item[0]] = $item[1];
}


$smarty->assign('taxonomies', $taxonomies);

$smarty->display('taxonomy-add.tpl');
?>
