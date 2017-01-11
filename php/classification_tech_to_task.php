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

$sSQL = " SELECT * from viz_subtopic where active = 1 and topic_id = 2 order by id; ";
$viz_subtopic = $conexao->GetArray($sSQL);

$classification = array();

for ($i=0 ; $i < count($viz_subtopic) ; $i++) { 

	/* Dataset types  ***************************************************************************/	

	$sSQL = "SELECT * from papers_viz_subtopic where viz_subtopic_id = ".$viz_subtopic[$i]['id']." and paper_id in ";
	$sSQL.= " (select id from papers where status=1 and gray_for_viz = 0 and gray_for_nm = 0 and same_as = 0 and for_discussion = 0 and year > 1980) order by paper_id;";
	$papers = $conexao->GetArray($sSQL);

	$output = array();

	for ($j=0 ; $j < count($papers) ; $j++) { 	

		$sSQL = "SELECT * from papers_viz_subtopic where paper_id = ".$papers[$j]['paper_id']." and viz_subtopic_id in (select id from viz_subtopic where topic_id = 3 and active = 1);";
		$tasks_interactions = $conexao->GetArray($sSQL);

		for ($k=0; $k < count($tasks_interactions); $k++) {

			$sSQL = "SELECT description from viz_subtopic where id = ".$tasks_interactions[$k]['viz_subtopic_id'].";";
			$tmp = $conexao->GetOne($sSQL);

			if(!array_key_exists($tmp, $output)){
				$output[$tmp] = 0;
				$output[$tmp]++;
			}
			else{
				$output[$tmp]++;	
			}
		 } 
	}

	$classification[$viz_subtopic[$i]['description']] = $output;

}


echo "<pre>";
print_r($classification);
echo "</pre>";

$csv= "";

foreach($classification as $k => $v ){
	$csv.= $k."|------\n";
	foreach ($v as $key => $value) {
		$csv.= $key."|".$value."\n";
	}
}

$fileCSV = "tmp/techniques_task_interactions".rand().".csv";
$fp = fopen($fileCSV,"w+");
fwrite($fp,$csv);
fclose($fp);

//$smarty->assign('classification',$classification);
//$smarty->display('classification.tpl');

?>


