<?php

function processPCAP($pcap,$script,$conexao){

	$sSQL = "SELECT file_name from pcap_files where id = '".$pcap."';";
	$pcap_name = $conexao->GetOne($sSQL);

	$sSQL = " SELECT snmp_dump_param,process_csv_param,script_from_csv,script_to_db from analysis_script "; 
	$sSQL.= " where id ='".$script."' and active = '1';";
	$scripts_name = $conexao->GetRow($sSQL);	

	$dir_process = "../tmp/process".rand();

	$r = shell_exec("mkdir ".$dir_process);
	$r = shell_exec("cp ".TRACES_PATH.$pcap_name." ".$dir_process);
	$r = shell_exec("cp ".SCRIPTS_PATH_FROMCSV.$scripts_name[2]." ".$dir_process);
	$r = shell_exec("cp ".SCRIPTS_PATH_TODB.$scripts_name[3]." ".$dir_process);
	
	$r = shell_exec(SNMP_DUMP_PATH."snmpdump $dir_process/$pcap_name ".$scripts_name[0]." -C $dir_process > /dev/null");
	
	$output = "output.out";
	$r = shell_exec($dir_process."/".$scripts_name[2]." $dir_process/".$scripts_name[1]." > ".$dir_process."/".$output);

	$tableControl = "s".$script."_control";
	$idTableControl = $conexao->GetOne("SELECT nextval('s1_control_seq');");
	$sSQL = "INSERT INTO $tableControl (id,pcap_id) VALUES (".$idTableControl.",$pcap);";
	$conexao->Execute($sSQL);	

	$r = shell_exec("php ".$dir_process."/".$scripts_name[3]." $dir_process/$output $idTableControl");

	$r = shell_exec("rm -Rf $dir_process");

	return $idTableControl;
}

?>
