<?php
require_once "session.php";
require_once "../conf/general.php";
require_once INCLUDE_SMARTY;
require_once INCLUDE_ADODB;
require_once INCLUDE_ADODB_ERROR;

$smarty = new Smarty();

$smarty->assign('IMAGES_PATH',IMAGES_PATH);
$smarty->assign('JS_PATH',JS_PATH);
$smarty->assign('CSS_PATH',CSS_PATH);
$smarty->assign('JS_LIBS_PATH',JS_LIBS_PATH);
$smarty->assign('CSS_LIBS_PATH',CSS_LIBS_PATH);

$smarty->assign('SYS_TITLE',SYS_TITLE);

$smarty->assign('USERNAME',$_SESSION['username']);

if(!isset($_REQUEST['paper_id'])){
	die('ERROR! No paper id!');
}

$paper_id = $_REQUEST['paper_id'];
$user_id = $_SESSION['userid'];

$conexao = ADONewConnection(DATABASE_DRIVER);
$conexao->Connect(DATABASE_SERVER, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME);

$sSQL = "select * from papers where id = ? ";
$paper = $conexao->GetArray($sSQL,array($paper_id));
$smarty->assign('paper',$paper);

$sSQL = " select * from questions where active = 1 order by id ";
$questions = $conexao->GetArray($sSQL);

$c = count($questions);
for($i = 0; $i < $c; $i++){

	$sSQL = " select pua.id,pua.answer,pua.time,u.username from papers_users_answers as pua,users as u ";
	$sSQL.= " where question_id = ? and pua.user_id = u.id and pua.paper_id = ? order by pua.time desc ";
	$answers = $conexao->GetArray($sSQL,array($questions[$i]['id'],$paper_id));	

	$questions[$i]['answers'] = $answers;
}

$smarty->assign('questions',$questions);

$smarty->display('paper-view-answers.tpl');
?>
