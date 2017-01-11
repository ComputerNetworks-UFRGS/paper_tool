<?php

session_start('tool');

require_once "../conf/general.php";
require_once INCLUDE_ADODB;
require_once INCLUDE_ADODB_ERROR;

$conexao = ADONewConnection(DATABASE_DRIVER);
$conexao->Connect(DATABASE_SERVER, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME);

$sSQL = "UPDATE access_log SET logout=current_timestamp where id='".$_SESSION["log_id"]."';";
$conexao->Execute($sSQL);

unset($_SESSION);
session_destroy();

header("location: login.php");

?>
