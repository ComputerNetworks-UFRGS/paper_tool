<?php
require_once "../conf/general.php";
require_once INCLUDE_ADODB;
require_once INCLUDE_ADODB_ERROR;

$db = ADONewConnection(DATABASE_DRIVER);
//$db->debug = true;
$db->Connect(DATABASE_SERVER, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME);

$papers = $db->GetArray("SELECT id,file from papers where status='1';");
//$db->debug = true;

/*
$c_papers = count($papers);
for($i = 0; $i < $c_papers; $i++){
	echo $papers[$i]['id']." - ".$papers[$i]['file']."<br/>";
	$db->Execute("UPDATE papers SET file = '".$papers[$i]['id'].".pdf' where id='".$papers[$i]['id']."';");		
}
*/

//exec("ls -1 ../papers/",$files);

/*
$c_files = count($files);
$ccc = 0;
for($j = 0; $j < $c_files; $j++){
	$fname = substr(trim($files[$j]),5,strlen(trim($files[$j])) - 9);
	$f = $db->GetOne("SELECT count(*) from papers where title ilike '%".$fname."%';");
	if($f == 0){
		echo "$fname<br/>";
		$ccc++;
	}
}
echo $ccc;
*/
/*
$c_papers = count($papers);
$c_files = count($files);
$count = 0;
for($i = 0; $i < $c_papers; $i++){
	for($j = 0; $j < $c_files; $j++){
		$fname = substr(trim($files[$j]),5,strlen(trim($files[$j])) - 9);
		if(strtoupper($papers[$i]['title']) === strtoupper(trim($fname))){
			$newfname = $papers[$i]['id'].".pdf";
			$count++;
			echo "Codigo do paper ".$papers[$i]['id']." =============================<br/>";
			echo strtoupper($papers[$i]['title']);
			echo "<br/>";
			echo strtoupper(trim($fname));
			echo "<br/><br/>";
			exec("mv ../papers/'".$files[$j]."' ../papers/'".$newfname."'");
			$db->Execute("UPDATE papers SET file = '".$newfname."' where id='".$papers[$i]['id']."';");
			break;
		}
	}
}
*/
echo "Encontrei = $count";
?>
