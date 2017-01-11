<?php
require_once "../conf/general.php";
require_once INCLUDE_ADODB;
require_once INCLUDE_ADODB_ERROR;

$db = ADONewConnection(DATABASE_DRIVER);
//$db->debug = true;
$db->Connect(DATABASE_SERVER, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME);

$papers = $db->GetArray("SELECT * from papers where status=1;");
//$db->debug = true;

$fp = fopen("saida.txt","r+");

while(!feof($fp)){
	$line = trim(fgets($fp));
	
	$c = $db->GetOne("SELECT count(*) from papers where title ilike '%".$line."%';");

	if($c == 1){
		$id = $db->GetOne("SELECT id from papers where title ilike '%".$line."%';");
		$db->Execute("UPDATE papers SET title ='".$line."' where id = '".$id."';");
	}
	else
		echo $line." - ".$db->GetOne("SELECT count(*) from papers where title ilike '%".$line."%';")."\n";	
}

?>
