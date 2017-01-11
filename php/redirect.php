<?php

session_start("tool");

require "../conf/general.php";
require INCLUDE_ADODB;
require INCLUDE_ADODB_ERROR;

$conexao = &ADONewConnection(DATABASE_DRIVER);
$conexao->PConnect(DATABASE_SERVER,DATABASE_USER,DATABASE_PASSWORD,DATABASE_NAME);

if(ereg("[^a-zA-Z0-9_.-]{1,}",$_POST["username"]) or ereg("[^a-zA-Z0-9_.-]{1,}",$_POST["pass"]))
    {
	$conexao->close();
    header("location: login.php?erro=1");
    }
else
	{
	$pass_md5 = md5($_POST['pass']);

	$sSQL = "select id from users where username='".$_POST['username']."' and password='".$pass_md5."' and active='1';";
	$userid = $conexao->GetOne($sSQL);

	if($userid)
		{
		$_SESSION["userid"] = $userid; 
		$_SESSION["username"] = $_POST['username']; 
		
		header("location: main.php");
		}
	else
		{
		$conexao->close();
		header("location: login.php?erro=1");
		}
	}
?>
