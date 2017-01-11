<?php
require_once "session.php";
require_once "../conf/general.php";
require_once INCLUDE_ADODB;
require_once INCLUDE_ADODB_ERROR;
require_once PHP_INCLUDE_PATH."general.functions.php";
require_once PHP_INCLUDE_PATH."topology.functions.php";

$conexao = ADONewConnection(DATABASE_DRIVER);
//$db->debug = true;
$conexao->Connect(DATABASE_SERVER, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME);

echo print_r($_REQUEST);

echo "AQUIQUQIUQIUQIUQ";

/*


$_operation = $_REQUEST['operation'];

if($_operation === "getTopologyList"){
	$_id_topology = $_REQUEST['id_topology'];
	echo getTopologyList($_id_topology,$conexao);	
}

if($_operation === "updateDevicesPosition"){
	updateDevicesPosition($_REQUEST['devices'],$conexao);
	echo true;
}

if($_operation === "addDevice"){
	echo addDevice(	$_REQUEST['alias'],
					$_REQUEST['ipaddress'],
					$_REQUEST['description'],
					$_REQUEST['ID_TOPOLOGY'],
					$_REQUEST['device_type'],
					$_REQUEST['snmp_version'],
					$conexao);
}

if($_operation === "addConnection"){
	echo addConnection($_REQUEST['from'],$_REQUEST['to'],"1",$conexao);
}

if($_operation === "dropConnection"){
	echo dropConnection($_REQUEST['from'],$_REQUEST['to'],$conexao);
}

if($_operation === "dropDevice"){
	dropDevice($_REQUEST['deviceId'],$conexao);
	echo 1;
}

if($_operation === "getDeviceSize"){
	echo getDeviceSize($_REQUEST['deviceId'],$conexao);
}

if($_operation === "createFromFile"){

	$script = 1; // managementTopology	
	$tableName = "s".$script."_data";
	// $idTableControl = processPCAP($_REQUEST['pcap_file'],$script,$conexao);
	$idTableControl = 1;

	$manager = getManagers($tableName,$idTableControl,$conexao);
//	echo var_dump($manager);
	$agent = getAgents($tableName,$idTableControl,$conexao);
//	echo var_dump($agent);
	$trap = getTraps($tableName,$idTableControl,$conexao);
//	echo var_dump($trap);
	$manager_agent = getManagerAgent($tableName,$idTableControl,$conexao);
//	echo var_dump($manager_agent);
	$agent_trap = getAgentTrap($tableName,$idTableControl,$conexao);
//	echo var_dump($agent_trap);

	$numEle = count($manager) + count($manager_agent);
	$angleFracao = 360 / $numEle;
	
	$_centerX = $_REQUEST['_width'] / 2;
	$_centerY = $_REQUEST['_height'] / 2;
	$radius = $_centerY / 2.5;

	$controlDevices = array();

	$angle = 0;
	$aux = count($manager);
	for($i = 0; $i < $aux ; $i++){
		$point = getPointOnCircle($radius,$angle,$_centerX,$_centerY);		
		$deviceId = addDevice( "",
                   			   $manager[$i],
                   			   "",
                   			   $_REQUEST['ID_TOPOLOGY'],
                   			   7,
                   			   0,
                   			   $conexao);

		$controlDevices[$manager[$i]] = $deviceId;
		$json_position = '[{"id":"'.$deviceId.'","coordx":'.$point['coordX'].',"coordy":'.$point['coordY'].'}]';
		updateDevicesPosition($json_position,$conexao);
		
		$r1 = getMAgentConn($manager[$i],$controlDevices,$_REQUEST['ID_TOPOLOGY'],$tableName,$idTableControl,$agent,$conexao);		
		$r2 = getMTrapConn($manager[$i],$controlDevices,$_REQUEST['ID_TOPOLOGY'],$tableName,$idTableControl,$trap,$conexao);
		$r3 = getMAgentTrapConn($manager[$i],$controlDevices,$_REQUEST['ID_TOPOLOGY'],$tableName,$idTableControl,$agent_trap,$conexao);

		//$out = array_merge($r1,$r2,$r3);
		//echo "------>".$manager[$i]."\n";
		//echo var_dump($out);

	$angle+= $angleFracao;

	}
	
	$aux = count($manager_agent);
    for($i = 0; $i < $aux ; $i++){

		$point = getPointOnCircle($radius,$angle,$_centerX,$_centerY);	

        $deviceId = addDevice( "",
                               $manager_agent[$i],
                               "",
                               $_REQUEST['ID_TOPOLOGY'],
                               9,
                               0,
                               $conexao);
		$controlDevices[$manager_agent[$i]] = $deviceId;
        $json_position = '[{"id":"'.$deviceId.'","coordx":'.$point['coordX'].',"coordy":'.$point['coordY'].'}]';
        updateDevicesPosition($json_position,$conexao);

		$r1 = getMAgentConn($manager_agent[$i],$controlDevices,$_REQUEST['ID_TOPOLOGY'],$tableName,$idTableControl,$agent,$conexao);
        $r2 = getMTrapConn($manager_agent[$i],$controlDevices,$_REQUEST['ID_TOPOLOGY'],$tableName,$idTableControl,$trap,$conexao);
        $r3 = getMAgentTrapConn($manager_agent[$i],$controlDevices,$_REQUEST['ID_TOPOLOGY'],$tableName,$idTableControl,$agent_trap,$conexao);		
		$out = array_merge($r1,$r2,$r3);
		if(count($out) > 0){
			$controlDevices = array_merge($controlDevices,$out);
			$circleCenter = getCircleCenterRadius($angle,$point['coordX'],$point['coordY'],$_REQUEST['_width'],$_REQUEST['_height']);

			$angle2 = 0; 
			$angle2Fracao = 360 / count($out);
			foreach($out as $id){
				$point = getPointOnCircle($circleCenter['radius'],$angle2,$circleCenter['x'],$circleCenter['y']);
				$json_position = '[{"id":"'.$id.'","coordx":'.$point['coordX'].',"coordy":'.$point['coordY'].'}]';
				updateDevicesPosition($json_position,$conexao);
				addConnection($deviceId,$id,getConnectionType($deviceId,$id,$conexao),$conexao);
				$angle2+= $angle2Fracao;
			}
			$_coordx = $circleCenter['x'] - $circleCenter['radius'] / 2;
			$_coordy = $circleCenter['y'] - $circleCenter['radius'] / 2;
			$json_position = '[{"id":"'.$deviceId.'","coordx":'.$_coordx.',"coordy":'.$_coordy.'}]';
        	updateDevicesPosition($json_position,$conexao);
		}
		$angle+= $angleFracao;
	}	

	echo "Terminei!";
}

*/
?>
