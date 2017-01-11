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
$smarty->assign('SVG_PATH',SVG_PATH);
$smarty->assign('JS_LIBS_PATH',JS_LIBS_PATH);
$smarty->assign('CSS_LIBS_PATH',CSS_LIBS_PATH);

$smarty->assign('SYS_TITLE',SYS_TITLE);

$smarty->assign('USERNAME',$_SESSION['username']);
$smarty->assign('ID_TOPOLOGY',$_REQUEST['id-topology']);

$conexao = ADONewConnection(DATABASE_DRIVER);
//$db->debug = true;
$conexao->Connect(DATABASE_SERVER, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME);

//$rs = $db->Execute('select * from teste;');

//** un-comment the following line to show the debug console
//$smarty->debugging = true;

$sSQL = "SELECT id,alias from device_type order by alias;";
$smarty->assign("device_type",$conexao->getAssoc($sSQL));

$sSQL = "SELECT id,alias||' - '||file_name  from pcap_files where owner = '".$_SESSION["userid"]."' and active = '1';";
$smarty->assign("pcap_file",$conexao->getAssoc($sSQL));

$smarty->display('topology.tpl');
?>
