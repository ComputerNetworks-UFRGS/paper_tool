<?php
require_once "session.php";
require_once "../conf/general.php";
require_once INCLUDE_SMARTY;
require_once INCLUDE_ADODB;
require_once INCLUDE_ADODB_ERROR;

/* FUNCTIONS */

// Return 1 if OK - O otherwise
function validPaperTitle($title){
	if(!isset($title) || strlen($title) == 0){
		return 0;
	}
	return 1;
}
// Return 1 if OK - O otherwise
function validPaperYear($year){
	if(!isset($year) || strlen($year) == 0){
		return 0;
	}
	return 1;
}
// Return 1 if OK - O otherwise
function paperAlreadyExists($title,$conexao){	

	$sSQL = " select count(*) from papers where title = '".pg_escape_string($title)."' ";
	$count = $conexao->GetOne($sSQL);

	if($count > 0){
		return 1;
	}
	return 0;
}

function storePaperTaxonomyFields($treeJson,$length,$paperId,$taxonomyId,$conexao){

	for($i = 0; $i < $length; $i++){		
		$isSelected = $treeJson[$i]['state']['selected'];
		if($isSelected === "true"){
			$params = array();
			$params[] = $paperId;
			$params[] = $taxonomyId;
			$params[] = $treeJson[$i]['id'];
			$sSQL = "INSERT INTO papers_taxonomies (paper_id,taxonomy_id,topic_id) VALUES (?,?,?);";
			$conexao->Execute($sSQL,$params);
		}
		if(is_array($treeJson[$i]['children'])){
			storePaperTaxonomyFields($treeJson[$i]['children'],
						count($treeJson[$i]['children']),
						$paperId,
						$taxonomyId,
						$conexao);			
		}
	}
}
/* FUNCTIONS */


$smarty = new Smarty();

$smarty->assign('IMAGES_PATH',IMAGES_PATH);
$smarty->assign('JS_PATH',JS_PATH);
$smarty->assign('CSS_PATH',CSS_PATH);
$smarty->assign('JS_LIBS_PATH',JS_LIBS_PATH);
$smarty->assign('CSS_LIBS_PATH',CSS_LIBS_PATH);
$smarty->assign('SYS_TITLE',SYS_TITLE);



$conexao = ADONewConnection(DATABASE_DRIVER);
$conexao->Connect(DATABASE_SERVER, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME);

$operation = $_REQUEST["operation"];

// Add paper
if($operation == 1){
	$id = $conexao->GetOne("SELECT nextval('papers_seq');");
	$ext = explode(".", $_FILES["paper"]["name"]);
	$file_name = $id.".".$ext[count($ext) - 1];

	$error = 0;
	$uploadfile = PAPERS_PATH . $file_name;
	if (move_uploaded_file($_FILES['paper']['tmp_name'], $uploadfile)) {
		$sSQL = "INSERT INTO papers (id,year,citations,title,venue,site,comments,file) values ";
    	$sSQL.= "($id,".$_REQUEST['year'].",".$_REQUEST['citations'].",'".$_REQUEST['title']."','".$_REQUEST['venue']."','".$_REQUEST['site']."','".$_REQUEST['comments']."', '$file_name');";
    	
    	if($conexao->Execute($sSQL)){
			$msg = "Success! Paper was recorded.";
		}
		else{
			$error = 1;
			$msg = "Oops! Paper was not recorded.";
		}
	}
 	else {
 		$error = 1;
		$msg = "Oops! Paper was not recorded.";
	}
	$smarty->assign('error',$error);
	$smarty->assign('msg',$msg);
	$smarty->assign('operation',$operation);
	$smarty->display('feedback.tpl');
}

// Add paper by CSV
if($operation == 2){

	$fileTemplate = $_REQUEST['fileTemplate'];

	$uploadfile = "/tmp/".$_FILES["csvfile"]["name"];
	$error = 0;
	$msg = '';
	if (move_uploaded_file($_FILES['csvfile']['tmp_name'], $uploadfile)) {
		$fp = fopen($uploadfile,"r+");

		// fileTemplate == 1
		// IEEE Xplore CSV
		// [0] 	=> Title
		// [3]  => Venue
		// [5] 	=> Year 
		// [13] => DOI
		// [14] => PDF Link
		// [15] => Author keywords
		// [20] => Citation count
		if($fileTemplate == 1){
			$tmp = trim(fgets($fp));
			$tmp = trim(fgets($fp));
			$line = 2;
			$c_papers = 0;
			$papers = array();
			while(($data = fgetcsv($fp,0,',','"')) !== FALSE){
				
				$line++;
				$papers[$c_papers]['line'] = "Line: ".$line;
				$papers[$c_papers]['title'] = $data[0];

				if(!validPaperTitle($data[0])){
					$papers[$c_papers]['status'] = "ERROR";
					$papers[$c_papers++]['message'] = "This paper does not have title!";
					continue;
				}
				if(!validPaperYear($data[5])){
					$papers[$c_papers]['status'] = "ERROR";
					$papers[$c_papers++]['message'] = "This paper does not have year information!";
					continue;
				}
				if(paperAlreadyExists($data[0],$conexao)){
					$papers[$c_papers]['status'] = "ERROR";
					$papers[$c_papers++]['message'] = "This paper already exists in the database!";
					continue;	
				}

				$params = array();
				$params[] = $data[0];
				$params[] = $data[5];
				$params[] = (int)($data[20]);
				$params[] = $data[3];
				$params[] = $data[13];
				$params[] = $data[14];
				$params[] = $data[15];
				$params[] = "http://ieeexplore.ieee.org/document/";

				$sSQL = "insert into papers (title,year,citations,venue,doi,pdf_link,keywords,dl_link) values (?,?,?,?,?,?,?,?)";
				if(!$conexao->Execute($sSQL,$params)){
					$papers[$c_papers]['status'] = "ERROR";
					$papers[$c_papers++]['message'] = "Error executing the insert query!";
				}
				else{
					$papers[$c_papers]['status'] = "SUCCESS";
					$papers[$c_papers++]['message'] = "Paper recored!";
				}
				
			}	
		}

		// fileTemplate == 2
		// ACM
		// [6] 	=> Title
		// [12] or [20] => Venue
		// [18] => Year 
		// [11] => DOI
		// [1]  => "http://dl.acm.org/citation.cfm?id=" + ID
		// [10] => Author keywords
		// [??] => 0 (citation)
		elseif($fileTemplate == 2){
			$tmp = trim(fgets($fp));
			$line = 1;
			$c_papers = 0;
			$papers = array();
			while(($data = fgetcsv($fp,0,',','"')) !== FALSE){

				$line++;
				$papers[$c_papers]['line'] = "Line: ".$line;
				$papers[$c_papers]['title'] = $data[6];

				if(!validPaperTitle($data[6])){
					$papers[$c_papers]['status'] = "ERROR";
					$papers[$c_papers++]['message'] = "This paper does not have title!";
					continue;
				}
				if(!validPaperYear($data[18])){
					$papers[$c_papers]['status'] = "ERROR";
					$papers[$c_papers++]['message'] = "This paper does not have year information!";
					continue;
				}
				if(paperAlreadyExists($data[6],$conexao)){
					$papers[$c_papers]['status'] = "ERROR";
					$papers[$c_papers++]['message'] = "This paper already exists in the database!";
					continue;	
				}

				$params = array();
				$params[] = $data[6];
				$params[] = $data[18];
				$params[] = 0;
				if(strlen($data[12]) > 0){
					$params[] = $data[12];
				}
				else{
					$params[] = $data[20];	
				}
				$params[] = $data[11];
				$params[] = "http://dl.acm.org/citation.cfm?id=".$data[1];
				$params[] = $data[10];
				$params[] = "http://dl.acm.org/citation.cfm?id=";

				$sSQL = "insert into papers (title,year,citations,venue,doi,pdf_link,keywords,dl_link) values (?,?,?,?,?,?,?,?)";
				if(!$conexao->Execute($sSQL,$params)){
					$papers[$c_papers]['status'] = "ERROR";
					$papers[$c_papers++]['message'] = "Error executing the insert query!";
				}
				else{
					$papers[$c_papers]['status'] = "SUCCESS";
					$papers[$c_papers++]['message'] = "Paper recored!";
				}

			}
		}
		// fileTemplate == 3
		// Elsevier Bibtex to CSV by JabRef
		// [4] 	=> Title
		// [14] => Venue
		// [10] => Year 
		// [??] => "" (DOI)
		// [13] => "http:" + URL
		// [28] => Author keywords
		// [??] => 0 (citation)
		elseif($fileTemplate == 3){
			$tmp = trim(fgets($fp));
			$line = 1;
			$c_papers = 0;
			$papers = array();
			while(($data = fgetcsv($fp,0,',','"')) !== FALSE){
				// workaround for wrong lines where the year is shifted to next column
				if((!is_integer($data[10])) && (count(explode("-",$data[10])) == 2)){
					$data[10] = $data[11];
				}

				$line++;
				$papers[$c_papers]['line'] = "Line: ".$line;
				$papers[$c_papers]['title'] = $data[4];

				if(!validPaperTitle($data[4])){
					$papers[$c_papers]['status'] = "ERROR";
					$papers[$c_papers++]['message'] = "This paper does not have title!";
					continue;
				}
				if(!validPaperYear($data[10])){
					$papers[$c_papers]['status'] = "ERROR";
					$papers[$c_papers++]['message'] = "This paper does not have year information!";
					continue;
				}
				if(paperAlreadyExists($data[4],$conexao)){
					$papers[$c_papers]['status'] = "ERROR";
					$papers[$c_papers++]['message'] = "This paper already exists in the database!";
					continue;	
				}

				$params = array();
				$params[] = $data[4];
				$params[] = $data[10];
				$params[] = 0;
				$params[] = $data[14];				
				$params[] = "";
				$params[] = "http:".$data[13];
				$params[] = $data[28];
				$params[] = "";

				$sSQL = "insert into papers (title,year,citations,venue,doi,pdf_link,keywords,dl_link) values (?,?,?,?,?,?,?,?)";
				if(!$conexao->Execute($sSQL,$params)){
					$papers[$c_papers]['status'] = "ERROR";
					$papers[$c_papers++]['message'] = "Error executing the insert query!";
				}
				else{
					$papers[$c_papers]['status'] = "SUCCESS";
					$papers[$c_papers++]['message'] = "Paper recored!";
				}
			}
		}
		$msg = 'File processed!';
		fclose($fp);
	}
	else{
		$error = 1;
		$msg = 'Error to upload the file to the server! Please, contact the system administrator.';
	}

	$conexao->Close();
	$smarty->assign('error',$error);
	$smarty->assign('msg',$msg);
	$smarty->assign('papers',$papers);
	$smarty->assign('operation',$operation);
	$smarty->display('feedback.tpl');
	
}

// rating a paper
if($operation == 10){

	$params = array();
	$params[] = $_REQUEST['rating'];
	$params[] = $_REQUEST['paperId'];

	$sSQL = "UPDATE papers SET rating = ? where id = ?;";
	if($conexao->Execute($sSQL,$params)){
		echo json_encode($ratingColors[$_REQUEST['rating']]['class']);
		//echo json_encode($ratingColors[$_REQUEST['rating']]['colorCode']);
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

// Remove paper
if($operation == 13){

	$params = array();
	$params[] = $_REQUEST['paperId'];

	$sSQL = " UPDATE papers SET active = 0 where id = ? ";
	$result = array();
	$result['error'] = 0;
	if($conexao->Execute($sSQL,$params)){
		
		$sSQL = "SELECT count(*) from papers where active = 1 ";
		$total_papers = $conexao->GetOne($sSQL);	

		$result['total_papers_year'] = 0;
		$result['total_papers'] = $total_papers;

		if($_REQUEST['year'] != 0){
			$params = array();
			$params[] = $_REQUEST['year'];
			$sSQL = "SELECT count(*) from papers where active = 1 and year = ? ";
			$result['total_papers_year'] = $conexao->GetOne($sSQL,$params);
		}
		else{
			$result['total_papers_year'] = $total_papers;
		}
	}
	else{
		$result['error'] = 1;
	}	
	echo json_encode($result);
}

// Load taxonomy
if($operation == 20){

	$taxonomyTable = 'taxonomy_'.$_REQUEST['taxonomyId'].'_fields';

	$sSQL = " SELECT id,CASE WHEN parent_id = 0 THEN '#' ELSE parent_id::text END as parent, ";
	$sSQL.= " name||' | ['||(select count(*) from papers_taxonomies where topic_id = ".$taxonomyTable.".id and taxonomy_id = ".$_REQUEST['taxonomyId']." )||']' as text, "; 
	$sSQL.= " CASE WHEN id in (SELECT topic_id from papers_taxonomies where ";
	$sSQL.= " topic_id = ".$taxonomyTable.".id and paper_id = ".$_REQUEST['paperId']." and taxonomy_id = ".$_REQUEST['taxonomyId'].") THEN 1 ELSE 0 END as"; 
	$sSQL.= " checked from ".$taxonomyTable." where active = 1 order by parent_id,order_view ";
	$taxoFields = $conexao->GetArray($sSQL);

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

// Save taxonomy fields
if($operation == 21){

	$paperId = $_REQUEST['paperId'];
	$taxonomyId = $_REQUEST['taxonomyId'];
	$treeJson = $_REQUEST['treeJson'];

	$params = array();
	$params[] = $paperId;
	$params[] = $taxonomyId;

	$sSQL = "DELETE FROM papers_taxonomies where paper_id = ? and taxonomy_id = ?;";
	$conexao->Execute($sSQL,$params);

	$length = count($treeJson);
	storePaperTaxonomyFields($treeJson,$length,$paperId,$taxonomyId,$conexao);
	echo 1;

}

?>
