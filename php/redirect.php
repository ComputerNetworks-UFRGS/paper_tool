<?php

session_start();

require "../conf/general.php";
require INCLUDE_ADODB;
require INCLUDE_ADODB_ERROR;
require INCLUDE_RBAC;

$conexao = &ADONewConnection(DATABASE_DRIVER);
$conexao->PConnect(DATABASE_SERVER,DATABASE_USER,DATABASE_PASSWORD,DATABASE_NAME);

if(preg_match("/[^a-zA-Z0-9_.-]+/", $_POST["username"]) /*or preg_match("/[^a-zA-Z0-9_.-]+/",$_POST["pass"])*/)
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

		$params = array();
		$params[] = $userid;
		$params[] = $_SERVER['HTTP_USER_AGENT'];

        $sSQL = "insert into users_log (user_id,user_agent) values (?,?)";
        $conexao->Execute($sSQL,$params);

        if (isset($_REQUEST['invite_code'])) {
            process_invitation($_REQUEST['invite_code'], $_SESSION["username"]);
        }

        rbac_load();
        $sSQL = "select id, name from projects;";
        //workaround to buggy GetAssoc() in adodb 5.21 --ggf
        $arr = $conexao->GetArray($sSQL);
        $projects = array();
        foreach ($arr as $item) {
            if (rbac_check('project_view', $item[0])) {
                $projects[$item[0]] = $item[1];
                if (!isset($_SESSION['project_id'])) {
                    $_SESSION['project_id'] = $item[0];
                }
            }
        }
        $_SESSION['projects'] = $projects;

		
		header("location: main.php?all_projects");
		}
	else
		{
		$conexao->close();
		header("location: login.php?erro=1");
		}
	}
?>
