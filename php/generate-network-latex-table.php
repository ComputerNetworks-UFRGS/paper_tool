<?php
require_once "../conf/general.php";
require_once INCLUDE_SMARTY;
require_once INCLUDE_ADODB;
require_once INCLUDE_ADODB_ERROR;

$conexao = ADONewConnection(DATABASE_DRIVER);
//$db->debug = true;
$conexao->Connect(DATABASE_SERVER, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME);

/*
echo '\begin{table*}[t]';
echo '<br>';
echo '\renewcommand{\arraystretch}{1}';
echo '<br>';
echo '\caption{Network and Service Management Taxonomy}';
echo '<br>';
echo '\label{tab:network_taxonomy_dist}';
echo '<br>';
echo '\tiny';
echo '<br>';
echo '\centering';
echo '<br>';
echo '\begin{tabularx}{\textwidth}{|l|l|l|X|}';
echo '<br>';
echo '\hline';
echo '<br>';
echo '\textbf{Topic}                                & \textbf{Subtopic}  & \textbf{Papers} & \textbf{References} \\\\ \hline';
echo '<br>';
echo '\hline';
echo '<br>';

for($i = 0; $i < count($topic); $i++){

	$sSQL = "SELECT * from nm_subtopic where topic_id = '".$topic[$i]['id']."' and active='1';";
	$subtopic = $conexao->GetArray($sSQL);

	$sSQL   = "SELECT paper_id from papers_nm_subtopic where nm_subtopic_id = '".$subtopic[0]['id']."' and paper_id in (select id from papers where status=1);";
	$papers = $conexao->GetArray($sSQL);

	$citations = "";
	$f = 0;
	foreach($papers as $paper){
		$f++;
		$citations.= "\cite{".$paper['paper_id']."} ";
	}
	if(!$f){
		$citations = '\textbf{-----}';
	}

	echo '\multirow{'.count($subtopic).'}{*}{'.str_replace("&", "\&", $topic[$i]['description']).'} & '.str_replace("&", "\&",$subtopic[0]['description']).'  &   '.count($papers).'    &  '.$citations.'  \\\ \cline{2-4} ';
	echo '<br>';

	for($j = 1; $j < count($subtopic) - 1; $j++){

		$sSQL   = "SELECT paper_id from papers_nm_subtopic where nm_subtopic_id = '".$subtopic[$j]['id']."' and paper_id in (select id from papers where status=1);";
		$papers = $conexao->GetArray($sSQL);

		$citations = "";
		$f = 0;
		foreach($papers as $paper){
			$f++;
			$citations.= "\cite{".$paper['paper_id']."} ";
		}
		if(!$f){
			$citations = '\textbf{-----}';
		}

		echo '                                     & '.str_replace("&", "\&",$subtopic[$j]['description']).' & '.count($papers).'                &  '.$citations.' \\\ \cline{2-4}';
		echo '<br>';
	}

	$sSQL   = "SELECT paper_id from papers_nm_subtopic where nm_subtopic_id = '".$subtopic[$j]['id']."' and paper_id in (select id from papers where status=1);";
	$papers = $conexao->GetArray($sSQL);

	$citations = "";
	$f = 0;
	foreach($papers as $paper){
		$f++;
		$citations.= "\cite{".$paper['paper_id']."} ";
	}
	if(!$f){
		$citations = '\textbf{-----}';
	}

	echo '                                     & '.str_replace("&", "\&",$subtopic[$j]['description']).' & '.count($papers).'  & '.$citations.'   \\\ \hline';
	echo '<br>';
	

}

echo '\end{tabularx}';
echo '<br>';
echo '\end{table*}';

*/

$sSQL = "SELECT *,(select count(*) from papers_nm_subtopic where nm_subtopic_id in (select id from nm_subtopic where topic_id = nmt.id)) cont from nm_topic nmt where active = 1 order by id;";
$topic = $conexao->GetArray($sSQL);

for($i = 0; $i < count($topic); $i++){

	echo '\begin{table*}[htpb]';
	echo '<br>';
	echo '\renewcommand{\arraystretch}{1.5}';
	echo '<br>';
	echo '\caption{Network and Service Management Taxonomy - Topic: '.str_replace("&", "\&", $topic[$i]['description']).'}';
	echo '<br>';
	echo '\label{tab:nm_topic_'.$i.'}';
	echo '<br>';
	echo '\footnotesize';
	echo '<br>';
	echo '\centering';
	echo '<br>';
	echo '\begin{tabularx}{\textwidth}{|l|l|X|}';
	echo '<br>';
	echo '\hline';
	echo '<br>';
	echo '\textbf{Total}  & \textbf{Subtopic} & \textbf{References of articles/papers} \\\\ \hline';
	echo '<br>';
	echo '\hline';
	echo '<br>';

	$sSQL = "SELECT * from nm_subtopic where topic_id = '".$topic[$i]['id']."' and active='1';";
	$subtopic = $conexao->GetArray($sSQL);

//	$sSQL   = "SELECT paper_id from papers_nm_subtopic where nm_subtopic_id = '".$subtopic[0]['id']."' and paper_id in (select id from papers where status=1 );";
//	$papers = $conexao->GetArray($sSQL);

	$tempArray = array();

	for($j = 0; $j < count($subtopic); $j++){

		$sSQL   = "SELECT paper_id from papers_nm_subtopic where nm_subtopic_id = '".$subtopic[$j]['id']."' and paper_id in (select id from papers where status=1 and gray_for_viz = 0 and gray_for_nm = 0 and same_as = 0 and for_discussion = 0 and year > 1980);";
		$papers = $conexao->GetArray($sSQL);

		$citations = "";
		$f = 0;
		foreach($papers as $paper){
			$f++;
			$citations.= "\cite{".$paper['paper_id']."} ";
		}
		if(!$f){
			$citations = '\textbf{-----}';
		}

		$tempArray[$j]['papers'] = count($papers);
		$tempArray[$j]['description'] = str_replace("&", "\&",$subtopic[$j]['description']);
		$tempArray[$j]['citations'] = $citations;

		//echo count($papers).' & '.str_replace("&", "\&",$subtopic[$j]['description']).'                &  '.$citations.' \\\ \hline';
		//echo '<br>';
	}

	array_multisort($tempArray, SORT_DESC);

	//echo "<pre>";
	//print_r($tempArray);
	//echo "</pre>";

	for($j = 0; $j < count($tempArray); $j++){
		echo $tempArray[$j]['papers'].' & '.$tempArray[$j]['description'].' & '.$tempArray[$j]['citations'].' \\\ \hline';
		echo '<br>';
	}	
	
	echo '\end{tabularx}';
	echo '<br>';
	echo '\end{table*}';

	echo '<br>';
	echo '<br>';
	echo '<br>';

}


echo "<br><br> ==================== ==========================<br><br>";

$sSQL = "SELECT *,(select count(*) from papers_viz_subtopic where viz_subtopic_id in (select id from viz_subtopic where topic_id = nmt.id)) cont from viz_topic nmt where active = 1 order by id;";
$topic = $conexao->GetArray($sSQL);

for($i = 0; $i < count($topic); $i++){

	echo '\begin{table*}[htpb]';
	echo '<br>';
	echo '\renewcommand{\arraystretch}{1.5}';
	echo '<br>';
	echo '\caption{Information Visualization Taxonomy - Topic: '.str_replace("&", "\&", $topic[$i]['description']).'}';
	echo '<br>';
	echo '\label{tab:viz_topic_'.$i.'}';
	echo '<br>';
	echo '\footnotesize';
	echo '<br>';
	echo '\centering';
	echo '<br>';
	echo '\begin{tabularx}{\textwidth}{|l|l|X|}';
	echo '<br>';
	echo '\hline';
	echo '<br>';
	echo '\textbf{Total}  & \textbf{Subtopic} & \textbf{References of articles/papers} \\\\ \hline';
	echo '<br>';
	echo '\hline';
	echo '<br>';

	$sSQL = "SELECT * from viz_subtopic where topic_id = '".$topic[$i]['id']."' and active='1';";
	$subtopic = $conexao->GetArray($sSQL);

	//$sSQL   = "SELECT paper_id from papers_viz_subtopic where viz_subtopic_id = '".$subtopic[0]['id']."' and paper_id in (select id from papers where status=1);";
	//$papers = $conexao->GetArray($sSQL);

	$tempArray = array();
	for($j = 0; $j < count($subtopic); $j++){

		$sSQL   = "SELECT paper_id from papers_viz_subtopic where viz_subtopic_id = '".$subtopic[$j]['id']."' and paper_id in (select id from papers where status=1 and gray_for_viz = 0 and gray_for_nm = 0 and same_as = 0 and for_discussion = 0 and year > 1980);";
		$papers = $conexao->GetArray($sSQL);

		$citations = "";
		$f = 0;
		foreach($papers as $paper){
			$f++;
			$citations.= "\cite{".$paper['paper_id']."} ";
		}
		if(!$f){
			$citations = '\textbf{-----}';
		}

		$tempArray[$j]['papers'] = count($papers);
		$tempArray[$j]['description'] = str_replace("&", "\&",$subtopic[$j]['description']);
		$tempArray[$j]['citations'] = $citations;

		//echo str_replace("&", "\&",$subtopic[$j]['description']).' & '.count($papers).'                &  '.$citations.' \\\ \hline';
		//echo '<br>';
	}
	
	array_multisort($tempArray, SORT_DESC);

	//echo "<pre>";
	//print_r($tempArray);
	//echo "</pre>";

	for($j = 0; $j < count($tempArray); $j++){
		echo $tempArray[$j]['papers'].' & '.$tempArray[$j]['description'].' & '.$tempArray[$j]['citations'].' \\\ \hline';
		echo '<br>';
	}
	
	echo '\end{tabularx}';
	echo '<br>';
	echo '\end{table*}';

	echo '<br>';
	echo '<br>';
	echo '<br>';

}
?>
