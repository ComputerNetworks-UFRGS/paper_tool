<?php
$operation = $_REQUEST["operation"];

require_once "../conf/general.php";
if ($operation != OPERATION_USER_SIGN_UP) {
    require_once "session.php";
}
require_once INCLUDE_SMARTY;
require_once INCLUDE_ADODB;
require_once INCLUDE_ADODB_ERROR;
require_once INCLUDE_RBAC;
require_once INCLUDE_TICKETS;
/* FUNCTIONS */
/* FUNCTIONS */

$smarty = new Smarty();

$smarty->assign('IMAGES_PATH',IMAGES_PATH);
$smarty->assign('JS_PATH',JS_PATH);
$smarty->assign('CSS_PATH',CSS_PATH);
$smarty->assign('JS_LIBS_PATH',JS_LIBS_PATH);
$smarty->assign('CSS_LIBS_PATH',CSS_LIBS_PATH);
$smarty->assign('SYS_TITLE',SYS_TITLE);



$conexao = ADONewConnection(DATABASE_DRIVER);
$conexao->Connect(DATABASE_SERVER, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME);

if ($operation == OPERATION_USER_INVITE) {
}

if (($operation == OPERATION_USER_ADD) || ($operation == OPERATION_USER_SIGN_UP)) {
    if (($operation == OPERATION_USER_ADD) && !rbac_check('g_user_add')) {
        $error = 1;
        $msg = "You don't have permission to add users";
    } else {
        $msg = '';
        $error = '';

        $name = trim($_REQUEST['name']);
        if ($name == '') {
            $error = 1;
            $msg .= "Name is empty. ";
        }

        $username = trim($_REQUEST['username']);
        if ($username == '') {
            $error = 1;
            $msg .= "Username is empty. ";
        }

        $email = trim($_REQUEST['email']);
        if ($email == '') {
            $error = 1;
            $msg .= "Email is empty. ";
        }

        if ($_REQUEST['password'] == '') {
            $error = 1;
            $msg .= "Password is empty. ";
        } else if ($_REQUEST['password'] != $_REQUEST['password_confirm']) {
            $error = 1;
            $msg .= "Password doesn't match confirmation. ";
        }
        $password = md5($_REQUEST['password']);

        if ($error != 1) {
            $sSQL = "SELECT count(*) FROM users WHERE username = ?";
            $params = array($_REQUEST['username']);
            $q = $conexao->getOne($sSQL, $params);
            if ($q != 0) {
                $error = 1;
                $msg .= "Username already registered. ";
            }

            $sSQL = "SELECT count(*) FROM users WHERE email = ?";
            $params = array($_REQUEST['email']);
            $q = $conexao->getOne($sSQL, $params);
            if ($q != 0) {
                $error = 1;
                $msg .= "Email already registered. ";
            }
        }

        if ($error != 1) {
            $params = array(
                $name,
                $username,
                $email,
                $password,
                1
            );
            $sSQL = "INSERT INTO users (name, username, email, password, confirmed) VALUES (?, ?, ?, ?, ?);";
            if ($conexao->Execute($sSQL, $params)) {
                if (isset($_REQUEST['invite_code']) && ($_REQUEST['invite_code'] != '')) {
                    $num_projects = process_invitation($_REQUEST['invite_code'], $conexao->insert_Id());
                    if ($num_projects > 0) {
                        $error = '';
                        $msg = "Success! You are registered and added to " . $num_projects . " projects as collaborator.";
                    } else {
                        $error = '';
                        $msg = "You are registered but your invitation to projects failed. Contact project admins to be added manually.";
                    }
                } else {
                    $error = '';
                    $msg = "Success! You are registered.";
                }
            } else {
                $error = 1;
                $msg = "Oops! Your registration was not recorded (db error).";
            }
        }
    }

    $smarty->assign('error',$error);
    $smarty->assign('msg',$msg);
    $smarty->assign('operation','user_add');
    $smarty->display('feedback.tpl');
}

if ($operation == OPERATION_USER_EDIT) {
}

if ($operation == OPERATION_USER_DELETE) {
}

if ($operation == OPERATION_USER_REQUEST_NEW_PASSWORD) {
}

if ($operation == OPERATION_USER_CHANGE_PASSWORD) {
}