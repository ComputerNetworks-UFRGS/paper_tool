<?php
//define("DEFAULT_PROJECT_ID", 1);
if (isset($_REQUEST['project_id'])) {
    $PROJECT_ID = $_REQUEST['project_id'];
} else {
    //trigger_error('project_id request variable is undefined. Falling back to session variable.', E_USER_WARNING);
    if (isset($_SESSION['project_id'])) {
        $PROJECT_ID = $_SESSION['project_id'];
    } else {
        //trigger_error('project_id session variable is undefined. Falling back to DEFAULT_PROJECT_ID constant.', E_USER_WARNING);
        if (defined('DEFAULT_PROJECT_ID')) {
            $PROJECT_ID = DEFAULT_PROJECT_ID;
        } else {
            $PROJECT_ID = 0;
            //trigger_error('DEFAULT_PROJECT_ID constant is undefined. Aborted.', E_USER_ERROR);
        }
    }
}

$conexao = ADONewConnection(DATABASE_DRIVER);
$conexao->Connect(DATABASE_SERVER, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME);

if ($PROJECT_ID != 0) {

    $params = array();
    $sSQL = " SELECT count(*) from projects where active = 1 and id = ?; ";
    $params[] = $PROJECT_ID;
    $q = $conexao->GetOne($sSQL, $params);

    if ($q != 1) {
        trigger_error('Project id ' . $PROJECT_ID . ' is invalid or inactive. Aborted.', E_USER_ERROR);
    }

    $_SESSION['project_id'] = $PROJECT_ID;
}

if (isset($_REQUEST['reload'])) {
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
}

$conexao->close();