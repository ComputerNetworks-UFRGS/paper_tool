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

//$sSQL = "SELECT *,(select count(*) from papers_nm_subtopic where papers_nm_subtopic.paper_id=papers.id) as man,(select count(*) from papers_viz_subtopic where papers_viz_subtopic.paper_id=papers.id) as viz from papers where status=1 order by year desc, title asc;";

$ratingColors = array();
$ratingColors[0]['class'] = "circlegray";
$ratingColors[1]['class'] = "circlegreen";
$ratingColors[2]['class'] = "circleyellow";
$ratingColors[3]['class'] = "circleorange";
$ratingColors[4]['class'] = "circlered";
$ratingColors[0]['colorCode'] = "#c5c5c5";
$ratingColors[1]['colorCode'] = "#8fc400";
$ratingColors[2]['colorCode'] = "#ffeb3b";
$ratingColors[3]['colorCode'] = "#ff9800";
$ratingColors[4]['colorCode'] = "#cc0000";

$sSQL = "SELECT id,name from taxonomies where active=1 order by name;";
$taxonomies = $conexao->GetArray($sSQL);

$sSQL = "SELECT * from papers where status=1 order by year desc, title asc;";
$papers = $conexao->GetArray($sSQL);

$c1 = count($papers);
$c2 = count($taxonomies);
for($i = 0; $i < $c1 ; $i++){
	$papers[$i]['ratingColBackground'] = $ratingColors[$papers[$i]['rating']]['colorCode']; 

	$str = '<option value="0" selected>Select here ...</option>';
	$icon = $ratingColors[1]['class'];
	for($j = 0; $j < $c2 ; $j++){
		$sSQL = " SELECT count(*) from papers_taxonomies where ";
		$sSQL.= " paper_id = '".$papers[$i]['id']."' and taxonomy_id = '".$taxonomies[$j]['id']."';";
		if($conexao->GetOne($sSQL) == 0){
			$class = $icon = $ratingColors[4]['class'];
		}
		else{
			$class = $ratingColors[1]['class'];
		}	
		$str.= '<option value="'.$taxonomies[$j]['id'].'" data-status="'.$class.'">'.$taxonomies[$j]['name'].'</option>';
	}

	$papers[$i]['taxonomyOptions'] = $str;
	$papers[$i]['taxonomyIcon'] = $icon;

}

$smarty->assign('papers',$papers);

$smarty->display('papers-list.tpl');
?>
