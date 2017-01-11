<?php
require_once "../conf/general.php";
require_once INCLUDE_SMARTY;
require_once INCLUDE_ADODB;
require_once INCLUDE_ADODB_ERROR;

$smarty = new Smarty();

$smarty->assign('IMAGES_PATH',IMAGES_PATH);
$smarty->assign('JS_PATH',JS_PATH);
$smarty->assign('CSS_PATH',CSS_PATH);
$smarty->assign('JS_LIBS_PATH',JS_LIBS_PATH);
$smarty->assign('CSS_LIBS_PATH',CSS_LIBS_PATH);

$smarty->assign('SYS_TITLE',SYS_TITLE);

//$db = ADONewConnection(DATABASE_DRIVER);
//$db->debug = true;
//$db->Connect(DATABASE_SERVER, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME);

if(isset($_REQUEST['erro']))
	$smarty->assign("erro","1");
else
	$smarty->assign("erro","0");

//$rs = $db->Execute('select * from teste;');

//** un-comment the following line to show the debug console
//$smarty->debugging = true;

$smarty->display('main.tpl');
?>
