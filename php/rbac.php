<?php
function rbac_load($userId = null) {
    if ($userId == null) {
        $userId = $_SESSION["userid"];
    }
    $conexao = ADONewConnection(DATABASE_DRIVER);
    $conexao->PConnect(DATABASE_SERVER,DATABASE_USER,DATABASE_PASSWORD,DATABASE_NAME);
    $params = array($userId);

    $permissions = array();

    $sSQL = "SELECT w.id as project, p.name as permission ".
            "FROM permissions p ".
            "INNER JOIN roles_permissions rp ON p.name = rp.permission ".
            "INNER JOIN roles r ON rp.role_id = r.id ".
            "INNER JOIN access_control ac ON r.id = ac.role_id ".
            "INNER JOIN projects w ON ac.project_id = w.id ".
            "WHERE ac.user_id = ? AND p.is_global = 0;";

    $results_local = $conexao->getArray($sSQL, $params);
    $length = count($results_local);
    for($i = 0; $i < $length; $i++){
      $permissions[$results_local[$i]['project']][$results_local[$i]['permission']] = true;
    }

    $sSQL = "SELECT p.name as permission ".
            "FROM permissions p ".
            "INNER JOIN roles_permissions rp ON p.name = rp.permission ".
            "INNER JOIN roles r ON rp.role_id = r.id ".
            "INNER JOIN access_control ac ON r.id = ac.role_id ".
            "WHERE ac.user_id = ? AND p.is_global = 1; ";

    $results_global = $conexao->getArray($sSQL, $params);
    $length = count($results_global);
    for($i = 0; $i < $length; $i++){
      $permissions[RBAC_PROJECT_ID_GLOBAL][$results_global[$i]['permission']] = true;
    }

    $_SESSION["permissions"] = $permissions;
    $conexao->close();
}

function rbac_check($permission, $project = RBAC_PROJECT_ID_GLOBAL) {
    return isset($_SESSION["permissions"][$project][$permission]);
}

function rbac_list($project = RBAC_PROJECT_ID_GLOBAL) {
    if (isset($_SESSION["permissions"][$project])) {
        return $_SESSION["permissions"][$project];
    } else {
        return array();
    }
}
?>