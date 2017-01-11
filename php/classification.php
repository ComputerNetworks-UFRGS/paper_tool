<?php
//require_once "session.php";
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

$sSQL = " SELECT nm_subtopic_id,(select description from nm_topic where id in (select topic_id from nm_subtopic where id=nm_subtopic_id)) as topic, ";
$sSQL.= " (select description from nm_subtopic where id=nm_subtopic_id) as subtopic,paper_id from papers_nm_subtopic where paper_id in ";
$sSQL.= " (select id from papers where status=1 and gray_for_viz = 0 and gray_for_nm = 0 and same_as = 0 and for_discussion = 0 and year > 1980) ";
$sSQL.= " order by nm_subtopic_id; ";
$nm_subtopic = $conexao->GetArray($sSQL);
  
for ($i=0 ; $i < count($nm_subtopic) ; $i++) { 


	if(!isset($saidaNSM[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]))
		$saidaNSM[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']] = 0;

	$saidaNSM[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]++;

	/* Dataset types  ***************************************************************************/	

	$sSQL = "SELECT viz_subtopic_id from papers_viz_subtopic where paper_id = ".$nm_subtopic[$i]['paper_id']." and viz_subtopic_id in (select id from viz_subtopic where topic_id = 1);";
	$viz_subtopic = $conexao->GetArray($sSQL);

	if(!isset($classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['1']))
		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['1'] = 0;
	if(!isset($classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['2']))
		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['2'] = 0;
	if(!isset($classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['3']))
		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['3'] = 0;
	if(!isset($classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['4']))
		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['4'] = 0;
	if(!isset($classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['5']))
		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['5'] = 0;
	if(!isset($classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['6']))
		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['6'] = 0;
	if(!isset($classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['7']))
		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['7'] = 0;
	if(!isset($classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['8']))
		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['8'] = 0;

	for ($j=0; $j < count($viz_subtopic); $j++) {
		switch ($viz_subtopic[$j]['viz_subtopic_id']) {
		 	case 1:
		 		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['1']++;
		 		break;
		 	case 2:
		 		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['2']++;
		 		break;
		 	case 3:
		 		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['3']++;
		 		break;
		 	case 4:
		 		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['4']++;
		 		break;
		 	case 5:
		 		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['5']++;
		 		break;
		 	case 6:
		 		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['6']++;
		 		break;
		 	case 7:
		 		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['7']++;
		 		break;
		 	case 8:
		 		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['8']++;
		 		break;
		 } 
	}
	/* Dataset types  ***************************************************************************/	

	/* Visuzalization techniques ****************************************************************/

	$sSQL = "SELECT viz_subtopic_id from papers_viz_subtopic where paper_id = ".$nm_subtopic[$i]['paper_id']." and viz_subtopic_id in (select id from viz_subtopic where topic_id = 2);";
	$viz_subtopic = $conexao->GetArray($sSQL);

	if(!isset($classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['9']))
		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['9'] = 0;
	if(!isset($classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['10']))
		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['10'] = 0;
	if(!isset($classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['11']))
		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['11'] = 0;
	if(!isset($classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['12']))
		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['12'] = 0;
	if(!isset($classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['13']))
		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['13'] = 0;

	for ($j=0; $j < count($viz_subtopic); $j++) {
		switch ($viz_subtopic[$j]['viz_subtopic_id']) {
		 	case 9:
		 		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['9']++;
		 		break;
		 	case 10:
		 		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['10']++;
		 		break;
		 	case 11:
		 		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['11']++;
		 		break;
		 	case 12:
		 		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['12']++;
		 		break;
		 	case 13:
		 		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['13']++;
		 		break;
		 } 
	}
	/* Visuzalization techniques ****************************************************************/

	/* Tasks/Interactions techniques ************************************************************/

	$sSQL = "SELECT viz_subtopic_id from papers_viz_subtopic where paper_id = ".$nm_subtopic[$i]['paper_id']." and viz_subtopic_id in (select id from viz_subtopic where topic_id = 3);";
	$viz_subtopic = $conexao->GetArray($sSQL);

	if(!isset($classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['14']))
		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['14'] = 0;
	if(!isset($classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['15']))
		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['15'] = 0;
	if(!isset($classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['16']))
		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['16'] = 0;
	if(!isset($classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['17']))
		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['17'] = 0;
	if(!isset($classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['18']))
		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['18'] = 0;
	if(!isset($classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['19']))
		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['19'] = 0;
	if(!isset($classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['20']))
		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['20'] = 0;
	if(!isset($classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['25']))
		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['25'] = 0;
	if(!isset($classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['29']))
		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['29'] = 0;

	for ($j=0; $j < count($viz_subtopic); $j++) {
		switch ($viz_subtopic[$j]['viz_subtopic_id']) {
		 	case 14:
		 		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['14']++;
		 		break;
		 	case 15:
		 		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['15']++;
		 		break;
		 	case 16:
		 		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['16']++;
		 		break;
		 	case 17:
		 		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['17']++;
		 		break;
		 	case 18:
		 		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['18']++;
		 		break;
		 	case 19:
		 		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['19']++;
		 		break;
		 	case 20:
		 		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['20']++;
		 		break;
		 	case 25:
		 		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['25']++;
		 		break;
		 	case 29:
		 		$classification[$nm_subtopic[$i]['topic']][$nm_subtopic[$i]['subtopic']]['29']++;
		 		break;
		 } 
	}
	/* Tasks/Interactions techniques ************************************************************/

} 

$sSQL = " SELECT (select description from viz_subtopic where id=viz_subtopic_id) as subtopic,count(id) as total from papers_viz_subtopic where paper_id in ";
$sSQL.= " (select id from papers where status=1 and gray_for_viz = 0 and gray_for_nm = 0 and same_as = 0 and for_discussion = 0 and year > 1980) ";
$sSQL.= " group by subtopic, viz_subtopic_id order by viz_subtopic_id; ";
$saidaVIS = $conexao->GetArray($sSQL);

//echo "<pre>";
//print_r($saidaNSM);
//echo "</pre>";

//echo "<pre>";
//print_r($saidaVIS);
//echo "</pre>";

//echo "<pre>";
//print_r($classification);
//echo "</pre>";

$csv = "-----|";

$sSQL = "select * from viz_subtopic where topic_id = 1 and active = 1 order by id;";
$subtopic = $conexao->GetArray($sSQL);
for($i = 0; $i < count($subtopic); $i++){
	$csv.= $subtopic[$i]['description']."|";
}

$sSQL = "select * from viz_subtopic where topic_id = 2 and active = 1 order by id;";
$subtopic = $conexao->GetArray($sSQL);
for($i = 0; $i < count($subtopic); $i++){
	$csv.= $subtopic[$i]['description']."|";
}

$sSQL = "select * from viz_subtopic where topic_id = 3 and active = 1 order by id;";
$subtopic = $conexao->GetArray($sSQL);
for($i = 0; $i < count($subtopic); $i++){
	$csv.= $subtopic[$i]['description']."|";
}

$csv.= "\n";

foreach($classification as $k => $v ){
	foreach ($v as $key => $value) {
		$csv.= $key."|";
		foreach ($value as $v1) {
			$csv.= $v1."|";
		}
		$csv.= "\n";
	}
}

$fileCSV = "tmp/heatmap".rand().".csv";
$fp = fopen($fileCSV,"w+");
fwrite($fp,$csv);
fclose($fp);


$smarty->assign('classification',$classification);
$smarty->display('classification.tpl');

?>


