<?php
require_once "session.php";
require_once "../conf/general.php";
require_once INCLUDE_ADODB;
require_once INCLUDE_ADODB_ERROR;
require_once PHP_INCLUDE_PATH."general.functions.php";
require_once PHP_INCLUDE_PATH."topology.functions.php";

$conexao = ADONewConnection(DATABASE_DRIVER);
//$db->debug = true;
$conexao->Connect(DATABASE_SERVER, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME);

$operation = $_REQUEST["operation"];

// Add paper
if($operation == 1){
	$id = $conexao->GetOne("SELECT nextval('papers_seq');");
	$ext = explode(".", $_FILES["paper"]["name"]);
	$file_name = $id.".".$ext[count($ext) - 1];

	$uploadfile = PAPERS_PATH . $file_name;
	if (move_uploaded_file($_FILES['paper']['tmp_name'], $uploadfile)) {
		$sSQL = "INSERT INTO papers (id,year,citations,title,venue,site,comments,file) values ";
    	$sSQL.= "($id,".$_REQUEST['year'].",".$_REQUEST['citations'].",'".$_REQUEST['title']."','".$_REQUEST['venue']."','".$_REQUEST['site']."','".$_REQUEST['comments']."', '$file_name');";
    	
		$msg = "Success! Paper was recorded.";
	
		$conexao->Execute($sSQL);
		header("location: feedback.php?msg=$msg");
	}
 	else {

		$msg = "Oops! Paper was not recorded.";

		header("location: feedback.php?msg=$msg");
	}
}

// Save network taxonomy
if($operation == 2){

	$conexao->Execute("DELETE FROM papers_nm_subtopic WHERE paper_id = '".$_REQUEST['paper_id']."';");
	
	for($i = 0; $i < count($_REQUEST['subtopic']); $i++){
		$conexao->Execute("INSERT INTO papers_nm_subtopic (paper_id,nm_subtopic_id) VALUES ('".$_REQUEST['paper_id']."','".$_REQUEST['subtopic'][$i]."');");
	}

	if(!isset($_REQUEST['star1']))
		$rating = 0;
	else
		$rating = $_REQUEST['star1'];

	$conexao->Execute("UPDATE papers SET network_rating = '".$rating."' where id = '".$_REQUEST['paper_id']."';");

	echo "1";
}

// Save visualization taxonomy
if($operation == 6){

	$conexao->Execute("DELETE FROM papers_viz_subtopic WHERE paper_id = '".$_REQUEST['paper_id']."';");
	
	for($i = 0; $i < count($_REQUEST['subtopic']); $i++){
		$conexao->Execute("INSERT INTO papers_viz_subtopic (paper_id,viz_subtopic_id) VALUES ('".$_REQUEST['paper_id']."','".$_REQUEST['subtopic'][$i]."');");
	}

	if(!isset($_REQUEST['star1']))
		$rating = 0;
	else
		$rating = $_REQUEST['star1'];

	$conexao->Execute("UPDATE papers SET visualization_rating = '".$rating."' where id = '".$_REQUEST['paper_id']."';");

	echo "1";
}

// Withdraw paper
if($operation == 3){

	$conexao->Execute("UPDATE papers SET status = 0 where id = '".$_REQUEST['paper_id']."';");
	
	$msg = "OK! Paper was withdrawn.";
    header("location: feedback.php?msg=$msg");

}

// Add comment
if($operation == 4){

	$_REQUEST['comment'] = pg_escape_string($_REQUEST['comment']);

	$conexao->Execute("INSERT INTO papers_nm_comments (comments,user_id,paper_id) values ('".$_REQUEST['comment']."','".$_REQUEST['userid']."','".$_REQUEST['paper_id']."');");

    echo $conexao->GetOne("SELECT count(*) from papers_nm_comments where paper_id = '".$_REQUEST['paper_id']."';"); 

}

// Add comment
if($operation == 5){

	$_REQUEST['comment'] = pg_escape_string($_REQUEST['comment']);

	$conexao->Execute("INSERT INTO papers_viz_comments (comments,user_id,paper_id) values ('".$_REQUEST['comment']."','".$_REQUEST['userid']."','".$_REQUEST['paper_id']."');");

    echo $conexao->GetOne("SELECT count(*) from papers_viz_comments where paper_id = '".$_REQUEST['paper_id']."';"); 

}

?>
