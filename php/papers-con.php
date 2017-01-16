<?php
require_once "session.php";
require_once "../conf/general.php";
require_once INCLUDE_ADODB;
require_once INCLUDE_ADODB_ERROR;

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
if($operation == 5){

	$_REQUEST['comment'] = pg_escape_string($_REQUEST['comment']);

	$conexao->Execute("INSERT INTO papers_viz_comments (comments,user_id,paper_id) values ('".$_REQUEST['comment']."','".$_REQUEST['userid']."','".$_REQUEST['paper_id']."');");

    echo $conexao->GetOne("SELECT count(*) from papers_viz_comments where paper_id = '".$_REQUEST['paper_id']."';"); 

}

// rating a paper
if($operation == 10){

	$params = array();
	$params[] = $_REQUEST['rating'];
	$params[] = $_REQUEST['paperId'];

	$sSQL = "UPDATE papers SET rating = ? where id = ?;";
	if($conexao->Execute($sSQL,$params)){
		echo json_encode($ratingColors[$_REQUEST['rating']]['colorCode']);
	}
	else{
		echo 0;
	}

}

// Add comment
if($operation == 11){

	$params = array();
	$params[] = $_REQUEST['comment'];
	$params[] = $_SESSION['userid'];
	$params[] = $_REQUEST['paper_id_comment'];

	$sSQL = "INSERT INTO papers_comments (comment,user_id,paper_id) values (?,?,?);";

	if($conexao->Execute($sSQL,$params)){
		echo 1;
	}
	else{
		echo 0;
	}
}

// Load comments
if($operation == 12){

	$params = array();
	$params[] = $_REQUEST['paperId'];

	$sSQL = " SELECT papers_comments.id, ";
	$sSQL.= " regexp_replace(papers_comments.comment, E'[\\n\\r\\u2028]+', '<br>', 'g' ) as comment, ";
	$sSQL.= " to_char(papers_comments.time,'FMMonth, FMDD HH24:MI:SS') as time, ";
	$sSQL.= " users.username as user from papers_comments,users where ";
	$sSQL.= " paper_id = ? and papers_comments.user_id = users.id order by time desc ";

	$result = $conexao->GetArray($sSQL,$params);

	if(count($result) > 0){
		echo json_encode($result);
	}
	elseif(count($result) == 0){
		echo -1;
	}
	else{
		echo 0;		
	}
	
}

// Load taxonomy
if($operation == 20){

	$taxonomyTable = 'taxonomy_'.$_REQUEST['taxonomyId'].'_fields';

	$params = array();
	$params[] = $_REQUEST['paperId'];
	$params[] = $_REQUEST['taxonomyId'];

	$sSQL = " SELECT id,CASE WHEN parent_id = 0 THEN '#' ELSE parent_id::text END as parent,  ";
	$sSQL.= " name as text, CASE WHEN id in (SELECT topic_id from papers_taxonomies where ";
	$sSQL.= " topic_id = ".$taxonomyTable.".id and paper_id = ? and taxonomy_id = ?) THEN 1 ELSE 0 END as"; 
	$sSQL.= " checked from ".$taxonomyTable." where active = 1 order by parent_id,order_view ";
	$taxoFields = $conexao->GetArray($sSQL,$params);

	//echo print_r($taxoFields,1);

	$length = count($taxoFields);
	if(!$length){
		die();
	}

	$result = array();
	for($i = 0; $i < $length; $i++){
		$result[$i]['id'] = $taxoFields[$i]['id'];
		$result[$i]['parent'] = $taxoFields[$i]['parent'];
		$result[$i]['text'] = $taxoFields[$i]['text'];
		if($taxoFields[$i]['checked'] == 1){
			$result[$i]['state'] = array('selected' => true);
		}
		else{
			$result[$i]['state'] = array('selected' => false);
		}
	}

	echo json_encode($result);

}

?>
