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


$sSQL = " SELECT *,(select count(*) from papers_nm_subtopic where nm_subtopic_id in (select id from nm_subtopic where topic_id = nmt.id) "; 
$sSQL.= " and paper_id in (select id from papers where status=1 and gray_for_viz = 0 and gray_for_nm = 0 and same_as = 0 and for_discussion = 0 and year > 1980)) cont from nm_topic nmt where active = 1 order by id; ";
$topic = $conexao->GetArray($sSQL);

$label = array();

$json = '{ "name" : "Taxonomy" , "children": [ ';
$csv = "";

for($i = 0; $i < count($topic); $i++){

	$sSQL = "SELECT * from nm_subtopic where topic_id = '".$topic[$i]['id']."' and active='1';";
	$subtopic = $conexao->GetArray($sSQL);

	$json.= '{ "name" : "'.$topic[$i]['description'].'" , "color" : "'.$topic[$i]['color'].'" ,"children": [ ';

	$csv.= $topic[$i]['description']."|----\n";

	for($j = 0; $j < count($subtopic); $j++){	

		$sSQL = "SELECT count(*) from papers_nm_subtopic where nm_subtopic_id = '".$subtopic[$j]['id']."' and paper_id in (select id from papers where status=1 and gray_for_viz = 0 and gray_for_nm = 0 and same_as = 0 and for_discussion = 0 and year > 1980);";
		$size = $conexao->GetOne($sSQL);

		if(count($subtopic) == ($j + 1)){
			$json.= '{ "name" : "'.$subtopic[$j]['description'].'" , "size": '.$size.' , "fontColor": "'.$topic[$i]['font_color'].'" }';
		}
		else{
			$json.= '{ "name" : "'.$subtopic[$j]['description'].'" , "size": '.$size.' , "fontColor": "'.$topic[$i]['font_color'].'"},';
		}

		$csv.= $subtopic[$j]['description']."|".$size."\n";

	}

	if(count($topic) == ($i + 1))
		$json.= ' ] }';
	else
		$json.= ' ] },';	
}

$json.= ' ] } ';

$fileCSV = "tmp/csvnm".rand().".csv";
$fp = fopen($fileCSV,"w+");
fwrite($fp,$csv);
fclose($fp);

$fileJSONTree = "tmp/treemap".rand().".json";
$fp = fopen($fileJSONTree,"w+");
fwrite($fp,$json);
fclose($fp);


/*
$fileJSONSunburst = "tmp/sunburst".rand().".json";
$fp = fopen($fileJSONSunburst,"w+");
fwrite($fp,$json);
fclose($fp);
*/

$sSQL = " SELECT *,(select count(*) from papers_viz_subtopic where viz_subtopic_id in (select id from viz_subtopic where topic_id = vizt.id) ";
$sSQL.= " and paper_id in (select id from papers where status=1 and gray_for_viz = 0 and gray_for_nm = 0 and same_as = 0 and for_discussion = 0 and year > 1980)) ";
$sSQL.= " cont from viz_topic vizt where active = 1 order by id; ";
$topic = $conexao->GetArray($sSQL);

$label = array();

$json = '{ "name" : "Taxonomy" , "children": [ ';
$csv = "";

for($i = 0; $i < count($topic); $i++){

	$sSQL = "SELECT * from viz_subtopic where topic_id = '".$topic[$i]['id']."' and active='1';";
	$subtopic = $conexao->GetArray($sSQL);

	$json.= '{ "name" : "'.$topic[$i]['description'].'" , "color" : "'.$topic[$i]['color'].'" ,"children": [ ';

	$csv.= $topic[$i]['description']."|----\n";

	for($j = 0; $j < count($subtopic); $j++){	

		$sSQL = "SELECT count(*) from papers_viz_subtopic where viz_subtopic_id = '".$subtopic[$j]['id']."' and paper_id in (select id from papers where status=1 and gray_for_viz = 0 and gray_for_nm = 0 and same_as = 0 and for_discussion = 0 and year > 1980);";
		$size = $conexao->GetOne($sSQL);

		if(count($subtopic) == ($j + 1))
			$json.= '{ "name" : "'.$subtopic[$j]['description'].'" , "size": '.$size.', "fontColor": "'.$topic[$i]['font_color'].'" }';
		else
			$json.= '{ "name" : "'.$subtopic[$j]['description'].'" , "size": '.$size.', "fontColor": "'.$topic[$i]['font_color'].'" },';

		$csv.= $subtopic[$j]['description']."|".$size."\n";
	}

	if(count($topic) == ($i + 1))
		$json.= ' ] }';
	else
		$json.= ' ] },';	
}

$json.= ' ] } ';

$fileCSV = "tmp/csvviz".rand().".csv";
$fp = fopen($fileCSV,"w+");
fwrite($fp,$csv);
fclose($fp);

$fileJSONTreeViz = "tmp/treemapViz".rand().".json";
$fp = fopen($fileJSONTreeViz,"w+");
fwrite($fp,$json);
fclose($fp); 


$smarty->assign('fileJSONTree',$fileJSONTree);
$smarty->assign('fileJSONTreeViz',$fileJSONTreeViz);
$smarty->assign('fileJSONSunburst',$fileJSONSunburst);

$smarty->assign('topic',$topic);

$smarty->display('network-taxonomy-visualization.tpl');
?>
