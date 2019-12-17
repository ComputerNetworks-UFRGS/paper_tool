<?php
require_once "session.php";
require_once "../conf/general.php";
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

$operation = $_REQUEST["operation"];

if ($operation == OPERATION_PROJECT_ADD) {
    $name = trim($_REQUEST['name']);
    if ($name == '') {
        $error = 1;
        $msg = "name is empty";
    }

    if (rbac_check('g_project_add')) {
        $owner = trim($_REQUEST['owner']);
        if ($owner < 1) {
            $error = 1;
            $msg = "owner not informed";
        }
    } else {
        $owner = $_SESSION['userid'];
    }


    $params = array(
        $name,
        $owner
    );
    $sSQL = "INSERT INTO projects (name, owner) VALUES (?, ?)";
    if(!$conexao->Execute($sSQL, $params)){
        $error = 1;
        $msg = "Oops! Project not created (db error).";
    } else {
        $params = array(
            $owner,
            $conexao->insert_Id()
        );
        $sSQL = "INSERT INTO access_control (user_id, project_id, role_id) VALUES (?, ?, 2)";
        if (!$conexao->Execute($sSQL, $params)) {
            $error = 1;
            $msg = "Oops! Project not created (db error).";
        } else {
            $error = '';
            $msg = "Success! Project created.";
        }
    }

    $smarty->assign('error',$error);
    $smarty->assign('msg',$msg);
    $smarty->assign('operation','project_add');
    $smarty->display('feedback.tpl');
}

if ($operation == OPERATION_PROJECT_EDIT) {
}

if ($operation == OPERATION_PROJECT_DELETE) {
}

if ($operation == OPERATION_PROJECT_QUESTIONS_ADD) {
    if (!rbac_check('project_edit_users', $_POST['project_id'])) {
        $error = 1;
        $msg = "You don't have permissions to edit questions in this project.";
    } else {
        $sSQL = "INSERT INTO questions (question, created_by, project_id) VALUES(?, ?, ?)";
        $params = array(
            $_POST['question_text'],
            $_SESSION['userid'],
            $_POST['project_id']
        );
        if ($conexao->execute($sSQL, $params)) {
            $error = '';
            $msg = "Question added to project successfully";
        } else {
            $error = 1;
            $msg = "Can't add question to project (db error).";
        }
    }
    $smarty->assign('error',$error);
    $smarty->assign('msg',$msg);
    $smarty->assign('operation','project_edit_questions');
    $smarty->assign('project_id',$_POST['project_id']);
    $smarty->display('feedback.tpl');
}

if ($operation == OPERATION_PROJECT_QUESTIONS_EDIT) {
    if (!rbac_check('project_edit_users', $_POST['project_id'])) {
        $error = 1;
        $msg = "You don't have permissions to edit questions in this project.";
    } else {
        $sSQL = "UPDATE questions SET question = ? WHERE id = ?";
        $params = array(
            $_POST['question_text'],
            $_POST['question_id']
        );
        if ($conexao->execute($sSQL, $params)) {
            $error = '';
            $msg = "Question edited successfully";
        } else {
            $error = 1;
            $msg = "Can't edit question (db error).";
        }
    }
    $smarty->assign('error',$error);
    $smarty->assign('msg',$msg);
    $smarty->assign('operation','project_edit_questions');
    $smarty->assign('project_id',$_POST['project_id']);
    $smarty->display('feedback.tpl');
}

if ($operation == OPERATION_PROJECT_QUESTIONS_DELETE) {
    if (!rbac_check('project_edit_users', $_POST['project_id'])) {
        $error = 1;
        $msg = "You don't have permissions to edit questions in this project.";
    } else {
        $sSQL = "DELETE FROM papers_users_answers WHERE question_id = ?";
        $params = array(
            $_POST['question_id']
        );
        if ($conexao->execute($sSQL, $params)) {
            $sSQL = "DELETE FROM questions WHERE id = ?";
            $params = array(
                $_POST['question_id']
            );
            if ($conexao->execute($sSQL, $params)) {
                $error = '';
                $msg = "Question deleted successfully";
            }
        }
        if (!isset($msg)) {
            $error = 1;
            $msg = "Can't delete question (db error).";
        }
    }
    $smarty->assign('error',$error);
    $smarty->assign('msg',$msg);
    $smarty->assign('operation','project_edit_questions');
    $smarty->assign('project_id',$_POST['project_id']);
    $smarty->display('feedback.tpl');
}

if ($operation == OPERATION_PROJECT_USERS_ADD) {
    if (!rbac_check('project_edit_users', $_POST['project_id'])) {
        $error = 1;
        $msg = "You don't have permissions to edit users in this project.";
    } else {
        $is_email = (bool)strpos($_POST['user-email-name'], '@');
        if ($is_email) {
            $sSQL = "SELECT id FROM users WHERE email = ?";
        } else {
            $sSQL = "SELECT id FROM users WHERE username = ?";
        }
        $params = array($_POST['user-email-name']);
        $user_id = $conexao->getOne($sSQL, $params);
        if ($user_id > 0) {
            $sSQL = "SELECT count(*) FROM access_control WHERE user_id = ? AND project_id = ?";
            $params = array(
                $user_id,
                $_POST['project_id'],
            );
            $q = $conexao->getOne($sSQL, $params);
            if ($q > 0) {
                $error = 1;
                $msg = "User ".$_POST['user-email-name']." is already part of the project group.";
            } else {
                $sSQL = "INSERT INTO access_control (user_id, project_id, role_id) VALUES(?, ?, ?)";
                $params = array(
                    $user_id,
                    $_POST['project_id'],
                    PROJECT_ROLE_COLLABORATOR
                );
                if ($conexao->execute($sSQL, $params)) {
                    $error = '';
                    $msg = "User added to project successfully";
                } else {
                    $error = 1;
                    $msg = "Can't add user to project (db error).";
                }
            }
        } else {
            if ($is_email) {
                if (generate_ticket(TICKET_TYPE_INVITATION, $_POST['user-email-name'], true, $_POST['project_id'])) {
                    $error = '';
                    $msg = "User invited to project successfully";
                } else {
                    $error = 1;
                    $msg = "Can't invite user to project (invitation error).";
                }
            } else {
                $error = 1;
                $msg = "User " . $_POST['user-email-name'] . " not found.";
            }
        }
    }
    $smarty->assign('error',$error);
    $smarty->assign('msg',$msg);
    $smarty->assign('operation','project_edit_users');
    $smarty->assign('project_id',$_POST['project_id']);
    $smarty->display('feedback.tpl');
}

if ($operation == OPERATION_PROJECT_USERS_EDIT) {
    if (!rbac_check('project_edit_users', $_POST['project_id'])) {
        $error = 1;
        $msg = "You don't have permissions to edit users in this project.";
    } else {
        $sSQL = "UPDATE access_control SET role_id = ? WHERE user_id = ? and project_id = ?";
        $params = array(
            $_POST['role'],
            $_POST['user_id'],
            $_POST['project_id'],
        );
        if (!$conexao->Execute($sSQL, $params)) {
            $error = 1;
            $msg = "Can't edit user permission (db error).";
        } else {
            $error = '';
            $msg = "User permission updated successfully.";
        }
    }
    $smarty->assign('error',$error);
    $smarty->assign('msg',$msg);
    $smarty->assign('operation','project_edit_users');
    $smarty->assign('project_id',$_POST['project_id']);
    $smarty->display('feedback.tpl');
}

if ($operation == OPERATION_PROJECT_USERS_DELETE) {
    if (!rbac_check('project_edit_users', $_POST['project_id'])) {
        $error = 1;
        $msg = "You don't have permissions to edit users in this project.";
    } else {
        if (is_numeric($_POST['user_id'])) {
            $sSQL = "SELECT count(*) from projects where id = ? and owner = ?";
            $params = array(
                $_POST['project_id'],
                $_POST['user_id']
            );
            $c = $conexao->getOne($sSQL, $params);
            if ($c === '0') {
                $sSQL = "DELETE FROM access_control WHERE project_id = ? AND user_id = ?";
                $params = array(
                    $_POST['project_id'],
                    $_POST['user_id']
                );
                if ($conexao->execute($sSQL, $params)) {
                    $error = '';
                    $msg = "User removed from project successfully";
                } else {
                    $error = 1;
                    $msg = "Can't remove user from project (db error).";
                }
            } else if ($c === '1') {
                $error = 1;
                $msg = "Can't delete owner from project.";
            } else {
                $error = 1;
                $msg = "Can't validate user (db error).";
            }
        } else {
            $sSQL = "SELECT code from tickets where email = ?";
            $params = array($_POST['user_id']);
            $code = $conexao->getOne($sSQL, $params);
            if ($code == '') {
                $error = 1;
                $msg = "Can't validate invitation (db error).";
            } else {
                $sSQL = "DELETE FROM tickets_projects WHERE code = ? and project_id = ?";
                $params = array(
                    $code,
                    $_POST['user_id']
                );
                if ($conexao->execute($sSQL, $params)) {
                    $error = '';
                    $msg = "User removed from project successfully";
                } else {
                    $error = 1;
                    $msg = "Can't remove user from project (db error).";
                }
            }
        }
    }
    $smarty->assign('error',$error);
    $smarty->assign('msg',$msg);
    $smarty->assign('operation','project_edit_users');
    $smarty->assign('project_id',$_POST['project_id']);
    $smarty->display('feedback.tpl');
}