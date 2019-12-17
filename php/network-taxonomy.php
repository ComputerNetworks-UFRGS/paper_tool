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

$conexao = ADONewConnection(DATABASE_DRIVER);
//$db->debug = true;
$conexao->Connect(DATABASE_SERVER, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME);

$paper_id = $_GET['id'];

$sSQL = "SELECT * from papers where id='$paper_id'";
$paper = $conexao->GetArray($sSQL);

$sSQL = "SELECT papers_nm_comments.id,papers_nm_comments.comments,to_char(papers_nm_comments.time,'FMMonth, FMDD HH24:MI:SS') as data,users.username from papers_nm_comments,users where papers_nm_comments.paper_id=$paper_id and papers_nm_comments.user_id=users.id order by data DESC;";
$comments = $conexao->GetArray($sSQL);

$sSQL = "SELECT nm_topic.description as topic,nm_subtopic.id,nm_subtopic.description as subtopic,(select count(*) from papers_nm_subtopic where papers_nm_subtopic.paper_id=$paper_id and papers_nm_subtopic.nm_subtopic_id=nm_subtopic.id) as flag from nm_topic,nm_subtopic where nm_subtopic.topic_id=nm_topic.id order by id;";
$taxonomy = $conexao->GetArray($sSQL);

$smarty->assign('userid',$_SESSION["userid"]);
$smarty->assign('previous_comments',$comments);
$smarty->assign('comments',count($comments));
$smarty->assign('paper',$paper);
$smarty->assign('taxonomy',$taxonomy);

$smarty->display('network-taxonomy.tpl');
?>
