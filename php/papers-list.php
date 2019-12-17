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
if (!rbac_check('paper_view', $PROJECT_ID)) {
    die("You don't have permission to view papers on this project");
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

$conexao = ADONewConnection(DATABASE_DRIVER);
$conexao->Connect(DATABASE_SERVER, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME);

$sSQL = " SELECT u.id,u.username FROM users u LEFT JOIN access_control ac ON u.id = ac.user_id WHERE u.active = 1 AND ac.project_id = ? ORDER BY username";
$params = array($PROJECT_ID);

//workaround to buggy GetAssoc() in adodb 5.21 --ggf
$arr = $conexao->GetArray($sSQL, $params);
$users = array();
foreach ($arr as $item) {
    $users[$item[0]] = $item[1];
}

$smarty->assign('users',$users);

$params = array();
$sSQL = " SELECT year from papers where active = 1 and project_id = ? group by year order by year desc ";
$params[] = $PROJECT_ID;
$years = $conexao->GetCol($sSQL,$params);

if(isset($_REQUEST['year'])){
	$year = $_REQUEST['year'];
    $_SESSION['papers-list'][$PROJECT_ID]['year'] = $_REQUEST['year'];
}
if(isset($_SESSION['papers-list'][$PROJECT_ID]['year'])){
    $year = $_SESSION['papers-list'][$PROJECT_ID]['year'];
}
else if(isset($years[0])){
	$year = $years[0];	
}
else {
	$year = 0;
}

$params = array();
if($year == 0){
	$sSQL = "SELECT * from papers where active = ? and project_id = ? order by year desc, title asc;";
	$params[] = 1;
	$params[] = $PROJECT_ID;
}
else{
	$sSQL = "SELECT * from papers where active = ? and year = ? and project_id = ? order by year desc, title asc;";	
	$params[] = 1;
	$params[] = $year;
	$params[] = $PROJECT_ID;
}
$papers = $conexao->GetArray($sSQL,$params);

$params = array();
$sSQL = "SELECT id,name from taxonomies where active=1 and project_id = ? order by name;";
$params[] = $PROJECT_ID;
$taxonomies = $conexao->GetArray($sSQL, $params);

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

$params = array();
$sSQL = " SELECT count(*) from papers where active = 1 and project_id = ? ";
$params[] = $PROJECT_ID;
$smarty->assign('total_papers',$conexao->GetOne($sSQL,$params));

$smarty->assign('year',$year);
$smarty->assign('years',$years);

$params = array();
$sSQL = " SELECT year||' - '||count(year)||' paper(s)' as year ";
$sSQL.= " from papers where active = 1 and project_id = ? group by year order by year desc; ";
$params[] = $PROJECT_ID;
$smarty->assign('years_output',$conexao->GetCol($sSQL,$params));

$smarty->assign('ratingValues', $ratingValues);

$smarty->display('papers-list.tpl');
?>
