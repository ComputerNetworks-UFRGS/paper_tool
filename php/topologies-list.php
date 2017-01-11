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

$sSQL = "SELECT id,alias,description,to_char(time, 'YYYY-MM-DD') as date, to_char(time, 'HH24:MI:SS') as hour ";
$sSQL.= "from topology where active='1' and owner='".$_SESSION['userid']."';";

$topologies = $conexao->GetArray($sSQL);
$smarty->assign("topologies_count",count($topologies));
$smarty->assign("topologies",$topologies);


//ivar_dump($topologies);

//$rs = $db->Execute('select * from teste;');

//** un-comment the following line to show the debug console
//$smarty->debugging = true;

$smarty->display('topologies-list.tpl');
?>
