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
$conexao->Connect(DATABASE_SERVER, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME);

$sSQL = " SELECT id,username from users where active = 1 and id not in (1) order by username ";
$users = $conexao->GetAssoc($sSQL);
$smarty->assign('users',$users);

$sSQL = " SELECT year from papers where active = 1 group by year order by year desc ";
$years = $conexao->GetCol($sSQL);

if(isset($_REQUEST['year'])){
	$year = $_REQUEST['year'];
}
else{
	$year = $years[0];	
}

$param = array();
if($year == 0){
	$sSQL = "SELECT * from papers where active = ? order by year desc, title asc;";
	$param[] = 1;
}
else{
	$sSQL = "SELECT * from papers where active = ? and year = ? order by year desc, title asc;";	
	$param[] = 1;
	$param[] = $year;
}
$papers = $conexao->GetArray($sSQL,$param);

$sSQL = "SELECT id,name from taxonomies where active=1 order by name;";
$taxonomies = $conexao->GetArray($sSQL);

$c1 = count($papers);
$c2 = count($taxonomies);
for($i = 0; $i < $c1 ; $i++){
	if(empty($papers[$i]['assigned_to'])){
		$papers[$i]['assignedToUser'] = '--';
	}
	else{
		$sSQL = "SELECT username from users where id = ".$papers[$i]['assigned_to'];
		$papers[$i]['assignedToUser'] = $conexao->GetOne($sSQL);	
	}

	//if(empty($papers[$i]['pdf_link'])){
	$papers[$i]['pdf_link'] = "../papers/".$papers[$i]['id'].".pdf";
	//}

	$papers[$i]['ratingColorCode'] = $ratingColors[$papers[$i]['rating']]['colorCode'];
	$papers[$i]['ratingClass'] = $ratingColors[$papers[$i]['rating']]['class']; 

	$str = '<option value="0" selected>Select here ...</option>';
	$taxonomyClass = $ratingColors[1]['class'];
	for($j = 0; $j < $c2 ; $j++){
		$sSQL = " SELECT count(*) from papers_taxonomies where ";
		$sSQL.= " paper_id = '".$papers[$i]['id']."' and taxonomy_id = '".$taxonomies[$j]['id']."';";
		if($conexao->GetOne($sSQL) == 0){
			$taxonomyClass = $ratingColors[0]['class'];
			$str.= '<option value="'.$taxonomies[$j]['id'].'" >[NOK] - '.$taxonomies[$j]['name'].'</option>';
		}
		else{
			$str.= '<option value="'.$taxonomies[$j]['id'].'" >[OK] - '.$taxonomies[$j]['name'].'</option>';
		}
	}

	$papers[$i]['taxonomyOptions'] = $str;
	$papers[$i]['taxonomyClass'] = $taxonomyClass;

	$sSQL = "select count(*) from papers_users_answers where paper_id = ? and user_id = ? ";
	$hasUserAnswer = $conexao->GetOne($sSQL,array($papers[$i]['id'],$_SESSION["userid"]));

	$papers[$i]['hasUserAnswer'] = $hasUserAnswer;

	$sSQL = "select count(*) from papers_users_answers where paper_id = ? ";
	$haveAnswers = $conexao->GetOne($sSQL,array($papers[$i]['id']));

	$papers[$i]['haveAnswers'] = $haveAnswers;
}

$smarty->assign('papers',$papers);

$sSQL = " SELECT count(*) from papers where active = 1 ";
$smarty->assign('total_papers',$conexao->GetOne($sSQL));

$smarty->assign('year',$year);
$smarty->assign('years',$years);

$sSQL = " SELECT year||' - '||count(year)||' paper(s)' as year ";
$sSQL.= " from papers where active = 1 group by year order by year desc; ";
$smarty->assign('years_output',$conexao->GetCol($sSQL));

$smarty->assign('ratingValues', $ratingValues);

$smarty->display('papers-list.tpl');
?>
