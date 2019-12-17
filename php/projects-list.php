<?php
require_once "session.php";
require_once "../conf/general.php";
require_once INCLUDE_SMARTY;
require_once INCLUDE_ADODB;
require_once INCLUDE_ADODB_ERROR;
require_once INCLUDE_RBAC;


if (isset($_GET['admin'])) {
    if (!rbac_check('g_project_view')) {
        die("You don't have permission to view all projects");
    }
    $admin = true;
} else {
    $admin = false;
}


$smarty = new Smarty();

$smarty->assign('IMAGES_PATH',IMAGES_PATH);
$smarty->assign('JS_PATH',JS_PATH);
$smarty->assign('CSS_PATH',CSS_PATH);
$smarty->assign('JS_LIBS_PATH',JS_LIBS_PATH);
$smarty->assign('CSS_LIBS_PATH',CSS_LIBS_PATH);

$smarty->assign('SYS_TITLE',SYS_TITLE);

$smarty->assign('USERNAME',$_SESSION['username']);

$conexao = ADONewConnection(DATABASE_DRIVER);
$conexao->Connect(DATABASE_SERVER, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME);

$sSQL = "SELECT id,username from users where active = 1 order by username ";

//workaround to buggy GetAssoc() in adodb 5.21 --ggf
$arr = $conexao->GetArray($sSQL);
$users = array();
foreach ($arr as $item) {
    $users[$item[0]] = $item[1];
}
$smarty->assign('users',$users);

$roles_ids = array();
$roles_names = array();
if (!$admin) {
    $sSQL = "SELECT ac.project_id, r.id, r.name FROM access_control ac LEFT JOIN roles r ON ac.role_id = r.id WHERE ac.user_id = ? AND ac.project_id IS NOT NULL";
    $params = array($_SESSION['userid']);
    $arr = $conexao->GetArray($sSQL, $params);
    foreach ($arr as $item) {
        $roles_ids[$item[0]] = $item[1];
        $roles_names[$item[0]] = $item[2];
    }
}

$projects = array();

if (isset($_REQUEST['owner'])) {
    $sSQL = "SELECT p.id, p.name, u.username FROM projects p LEFT JOIN users u ON u.id = p.owner WHERE p.owner = ? p.active = 1 ORDER BY p.name ASC";
    $params = array($_REQUEST['owner']);
} else {
    $sSQL = "SELECT p.id, p.name, u.username FROM projects p LEFT JOIN users u ON u.id = p.owner WHERE p.active = 1 ORDER BY p.name ASC;";
    $params = array();
}
$arr = $conexao->GetArray($sSQL, $params);
if (!empty($arr)) foreach ($arr as $row) {
    if ($admin || isset($roles_ids[$row[0]])) {
        $project = array(
            'id' => $row[0],
            'name' => $row[1],
            'owner' => $row[2],
            'role' => null,
            'admin' => false
        );
        if (!$admin) {
            $project['role'] = $roles_names[$row[0]];
            $project['admin'] = (($roles_ids[$row[0]] == PROJECT_ROLE_OWNER) || ($roles_ids[$row[0]] == PROJECT_ROLE_ADMIN));
        }
        $projects[] = $project;
    }
}

$smarty->assign('projects', $projects);

if ($admin) {
    $sSQL = " SELECT count(*) from projects";
    $smarty->assign('total_projects', $conexao->GetOne($sSQL));
} else {
    $smarty->assign('total_projects', null);
}

$smarty->assign('admin', $admin);
$smarty->display('projects-list.tpl');
?>