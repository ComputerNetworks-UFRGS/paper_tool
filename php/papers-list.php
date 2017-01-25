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

if(isset($_REQUEST['year'])){
	$year = $_REQUEST['year'];
}
else{
	$year = date("Y") - 1;	
}

$sSQL = "SELECT id,name from taxonomies where active=1 order by name;";
$taxonomies = $conexao->GetArray($sSQL);

$param = array();
$param[] = 1;
$param[] = $year;

$sSQL = "SELECT * from papers where status = ? and year = ? order by year desc, title asc;";
$papers = $conexao->GetArray($sSQL,$param);

$c1 = count($papers);
$c2 = count($taxonomies);
for($i = 0; $i < $c1 ; $i++){
	$papers[$i]['ratingColorCode'] = $ratingColors[$papers[$i]['rating']]['colorCode']; 

	$str = '<option value="0" selected>Select here ...</option>';
	$icon = $ratingColors[1]['class'];
	$taxonomyColorCode = $ratingColors[1]['colorCode'];
	for($j = 0; $j < $c2 ; $j++){
		$sSQL = " SELECT count(*) from papers_taxonomies where ";
		$sSQL.= " paper_id = '".$papers[$i]['id']."' and taxonomy_id = '".$taxonomies[$j]['id']."';";
		if($conexao->GetOne($sSQL) == 0){
			$class = $icon = $ratingColors[4]['class'];
			$taxonomyColorCode = $ratingColors[4]['colorCode'];
		}
		else{
			$class = $ratingColors[1]['class'];
		}	
		$str.= '<option value="'.$taxonomies[$j]['id'].'" data-status="'.$class.'">'.$taxonomies[$j]['name'].'</option>';
	}

	$papers[$i]['taxonomyOptions'] = $str;
	$papers[$i]['taxonomyIcon'] = $icon;
	$papers[$i]['taxonomyColorCode'] = $taxonomyColorCode;

}
$smarty->assign('papers',$papers);

$years = array();
for($i = date("Y"); $i >= 1970; $i--){
	$years[$i] = $i;
}

$smarty->assign('year',$year);
$smarty->assign('years',$years);

$smarty->display('papers-list.tpl');
?>
