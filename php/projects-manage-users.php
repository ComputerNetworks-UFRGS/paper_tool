<?php
require_once "session.php";
require_once "../conf/general.php";
require_once INCLUDE_SMARTY;
require_once INCLUDE_ADODB;
require_once INCLUDE_ADODB_ERROR;
require_once INCLUDE_RBAC;
require_once "project_id.php";

if (!rbac_check('project_view', $PROJECT_ID)) {
    die("You don't have permission to view this project");
}

$smarty = new Smarty();
$smarty->assign('project_id', $PROJECT_ID);

$smarty->assign('IMAGES_PATH',IMAGES_PATH);
$smarty->assign('JS_PATH',JS_PATH);
$smarty->assign('CSS_PATH',CSS_PATH);
$smarty->assign('JS_LIBS_PATH',JS_LIBS_PATH);
$smarty->assign('CSS_LIBS_PATH',CSS_LIBS_PATH);

$smarty->assign('SYS_TITLE',SYS_TITLE);

$smarty->assign('USERNAME',$_SESSION['username']);

$smarty->assign('can_edit_users', rbac_check('project_edit_users', $PROJECT_ID));

$conexao = ADONewConnection(DATABASE_DRIVER);
$conexao->Connect(DATABASE_SERVER, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME);

$sSQL = "SELECT r.id, r.name FROM roles r WHERE EXISTS (SELECT p.name, rp.role_id FROM permissions p LEFT JOIN roles_permissions rp ON rp.permission = p.name WHERE p.active = 1 AND p.is_global = 0 AND rp.role_id = r.id)";

//workaround to buggy GetAssoc() in adodb 5.21 --ggf
$arr = $conexao->GetArray($sSQL);
foreach ($arr as $item) {
    $roles[$item[0]] = $item[1];
}


$users = array();

$sSQL = "SELECT u.id, u.username, u.name, r.id, r.name FROM users u LEFT JOIN access_control a on u.id = a.user_id LEFT JOIN roles r on a.role_id = r.id WHERE u.active = 1 AND u.confirmed = 1 AND a.project_id = ?";
$params = array($PROJECT_ID);
$arr = $conexao->GetArray($sSQL,$params);
if (!empty($arr)) foreach ($arr as $item) {
    $users[] = array(
        'id' => $item[0],
        'name' => '['.$item[1].'] '.$item[2],
        'role_id' => $item[3],
        'role' => $item[4],
        'can_edit' => ($item[3] == PROJECT_ROLE_OWNER ? '0' : '1'),
        'can_delete' => ($item[3] == PROJECT_ROLE_OWNER ? '0' : '1')
    );
}

$sSQL = "SELECT t.email FROM tickets t LEFT JOIN tickets_projects tp on t.code = tp.code WHERE tp.project_id = ? AND t.type = ? AND t.used = 0 AND t.expiration > now()";
$params = array($PROJECT_ID, TICKET_TYPE_INVITATION);
$arr = $conexao->GetArray($sSQL,$params);
if (!empty($arr)) foreach ($arr as $item) {
    $users[] = array(
        'id' => $item[0],
        'username' => $item[0],
        'name' => $item[0],
        'role_id' => PROJECT_ROLE_COLLABORATOR,
        'role' => $roles[PROJECT_ROLE_COLLABORATOR].' (pending invitation)',
        'can_edit' => '0',
        'can_delete' => '1'
    );
}
unset($roles[PROJECT_ROLE_OWNER]);
$smarty->assign('project_name', $_SESSION['projects'][$PROJECT_ID]);
$smarty->assign('roles', $roles);
$smarty->assign('users', $users);


$smarty->display('projects-manage-users.tpl');