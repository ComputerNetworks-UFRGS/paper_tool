<?php
require_once "session.php";
require_once "../conf/general.php";
require_once INCLUDE_ADODB;
require_once INCLUDE_ADODB_ERROR;

$conexao = ADONewConnection(DATABASE_DRIVER);
//$db->debug = true;
$conexao->Connect(DATABASE_SERVER, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME);

$_REQUEST['topology-alias'] = pg_escape_string($_REQUEST['topology-alias']);
$_REQUEST['topology-description'] = pg_escape_string($_REQUEST['topology-description']);

$sSQL = "INSERT INTO topology (alias,description,owner) VALUES ";
$sSQL.= "('".$_REQUEST['topology-alias']."','".$_REQUEST['topology-description']."','".$_SESSION['userid']."');";

if($conexao->Execute($sSQL))
	echo 1;
else
	echo 0;
?>
