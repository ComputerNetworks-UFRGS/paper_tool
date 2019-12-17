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

$sSQL = "SELECT * from papers where id='$paper_id';";
$paper = $conexao->GetArray($sSQL);

$sSQL = "SELECT papers_viz_comments.id,papers_viz_comments.comments,to_char(papers_viz_comments.time,'FMMonth, FMDD HH24:MI:SS') as data,users.username from papers_viz_comments,users where papers_viz_comments.paper_id=$paper_id and papers_viz_comments.user_id=users.id order by data DESC;";
$comments = $conexao->GetArray($sSQL);

$sSQL = "SELECT viz_topic.description as topic,viz_subtopic.id,viz_subtopic.description as subtopic,(select count(*) from papers_viz_subtopic where papers_viz_subtopic.paper_id=$paper_id and papers_viz_subtopic.viz_subtopic_id=viz_subtopic.id) as flag from viz_topic,viz_subtopic where viz_subtopic.topic_id=viz_topic.id order by topic_id,viz_subtopic.id;";
$taxonomy = $conexao->GetArray($sSQL);

$smarty->assign('userid',$_SESSION["userid"]);
$smarty->assign('previous_comments',$comments);
$smarty->assign('comments',count($comments));
$smarty->assign('paper',$paper);
$smarty->assign('taxonomy',$taxonomy);

$smarty->display('visualization-taxonomy.tpl');
?>
