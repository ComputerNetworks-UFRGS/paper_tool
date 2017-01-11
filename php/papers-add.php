<?php
require_once "session.php";
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

$smarty->assign('USERNAME',$_SESSION['username']);

$conexao = ADONewConnection(DATABASE_DRIVER);
//$db->debug = true;
$conexao->Connect(DATABASE_SERVER, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME);

$sSQL = "SELECT * from papers where status = '1';";

$topologies = $conexao->GetArray($sSQL);
$smarty->assign("topologies_count",count($topologies));
$smarty->assign("topologies",$topologies);

$years = array();
for($i = 1980; $i <= 2020; $i++){
	$years[$i] = $i;
}

$smarty->assign('years',$years);

//ivar_dump($topologies);

//$rs = $db->Execute('select * from teste;');

//** un-comment the following line to show the debug console
//$smarty->debugging = true;

$smarty->display('papers-add.tpl');
?>
