<?php
require_once "../conf/general.php";
require_once INCLUDE_ADODB;
require_once INCLUDE_ADODB_ERROR;

$db = ADONewConnection(DATABASE_DRIVER);
//$db->debug = true;
$db->Connect(DATABASE_SERVER, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME);

$x = $db->GetArray("SELECT * from nm_subtopic;");
$db->debug = true;

//exec("ls -1 ../papers/",$files);

$fp = fopen("papers.csv","r+");
$line = fgets($fp);
while(!feof($fp)){
	$line = trim(fgets($fp));
	$arr = explode(";", $line);
	$db->Execute("INSERT INTO papers (year,citations,title,vehicle,site) VALUES ('".$arr[0]."','".$arr[1]."','".$arr[2]."','".$arr[3]."','".$arr[4]."');");
}
fclose($fp);
?>
