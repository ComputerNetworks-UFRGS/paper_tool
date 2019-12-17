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

$smarty->assign('can_edit_questions', rbac_check('project_edit_questions', $PROJECT_ID));

$conexao = ADONewConnection(DATABASE_DRIVER);
$conexao->Connect(DATABASE_SERVER, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME);

$sSQL = "SELECT row_number() OVER (), q.id, q.question, pua.num_answers FROM questions q LEFT JOIN (SELECT count(*) as num_answers, question_id FROM papers_users_answers GROUP BY question_id) pua ON q.id = pua.question_id WHERE q.active = 1 AND project_id = ?";
$params = array($PROJECT_ID);
$arr = $conexao->GetArray($sSQL, $params);

$questions = array();
if (!empty($arr)) foreach ($arr as $item) {
    $questions[] = array(
        'seq' => $item[0],
        'id' => $item[1],
        'question' => $item[2],
        'num_answers' => $item[3]
    );
}

$smarty->assign('project_name', $_SESSION['projects'][$PROJECT_ID]);
$smarty->assign('questions', $questions);


$smarty->display('projects-manage-questions.tpl');