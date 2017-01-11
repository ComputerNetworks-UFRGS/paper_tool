<?php

function getTopologyList($_id_topology,$conexao){
	
	$conexao = ADONewConnection(DATABASE_DRIVER);
	$conexao->Connect(DATABASE_SERVER, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME);

	$sSQL = " SELECT device.id,device.alias,device.ipaddress,device.coordx,device.coordy,device.parent_id,device_type.icon, ";
    $sSQL.= " device.width,device.height ";
    $sSQL.= " from device,device_type where topology_id = '".$_id_topology."' and active = '1' and ";
    $sSQL.= " device.device_type_id = device_type.id order by device.parent_id;";

    $_topology_list["devices"] = $conexao->GetArray($sSQL);

    $sSQL = " SELECT connections.device_from,connections.device_to,connections_type.style from connections,connections_type ";
    $sSQL.= " where device_from in (select id from device where topology_id = '".$_id_topology."' and active = '1') ";
    $sSQL.= " and connections.connection_type=connections_type.id; ";

    $_topology_list["connections"] = $conexao->GetArray($sSQL);

    return json_encode($_topology_list);

}

function updateDevicesPosition($json_devices,$conexao){

	$devices = json_decode($json_devices);

    $cont = count($devices);
    for($i = 0; $i < $cont ; $i++) {
        $sSQL = " UPDATE device SET coordx = '".$devices[$i]->coordx."',coordy = '".$devices[$i]->coordy."' ";
        $sSQL.= " where id = '".$devices[$i]->id."';";
        $conexao->Execute($sSQL);
    }	

}

function addDevice($alias,$ipaddress,$description,$topology_id,$device_type_id,$snmp_version,$conexao){

	$sSQL = "SELECT df_width,df_height from device_type where id = '".$device_type_id."';";
    $size = $conexao->GetRow($sSQL);

    $idDevice = $conexao->GetOne("SELECT nextval('device_seq');");

    if($snmp_version == 0)
        $manageable = 0;
    else
        $manageable = 1;

    $sSQL = "INSERT INTO device (id,alias,ipaddress,description,topology_id,device_type_id,snmp_version,manageable,width,height) VALUES ";
    $sSQL.= " ('".$idDevice."','".$alias."','".$ipaddress."','".$description."', ";
    $sSQL.= " '".$topology_id."','".$device_type_id."','".$snmp_version."','".$manageable."', ";
    $sSQL.= " '".$size[0]."','".$size[1]."'); ";

    $conexao->Execute($sSQL);

	return $idDevice;

}	

function addConnection($from,$to,$c_type,$conexao){

	$sSQL = " SELECT count(*) from connections where (device_from = '".$from."' and device_to = '".$to."') ";
    $sSQL.= " or (device_from = '".$to."' and device_to = '".$from."'); ";
    if($conexao->GetOne($sSQL) > 0){
        return 0;
    }
    else{
        $sSQL = " INSERT INTO connections (device_from,device_to,connection_type) VALUES ";
        $sSQL.= " ('".$from."','".$to."','".$c_type."');";
        $conexao->Execute($sSQL);

        return 1;
    }

}

function dropConnection($from,$to,$conexao){

	$sSQL = " SELECT count(*) from connections where (device_from = '".$from."' and device_to = '".$to."') ";
    $sSQL.= " or (device_from = '".$to."' and device_to = '".$from."'); ";
    if($conexao->GetOne($sSQL) == 0){
        return 0;
    }
    else{
        $sSQL = " DELETE FROM connections WHERE (device_from = '".$from."' and device_to = '".$to."') ";
        $sSQL.= " or (device_from = '".$to."' and device_to = '".$from."');";
        $conexao->Execute($sSQL);

        return 1;
    }

}

function dropDevice($deviceId,$conexao){
	
	$sSQL = "DELETE FROM connections WHERE device_to='".$deviceId."' or device_from = '".$deviceId."';";
    $conexao->Execute($sSQL);

    $sSQL = "UPDATE device SET active = '0' where id = '".$deviceId."';";
    $conexao->Execute($sSQL);

}

function getDeviceSize($deviceId,$conexao){

	$sSQL = "SELECT width,height from device where id='".$deviceId."';";
	$size = $conexao->GetArray($sSQL);

	return json_encode($size);

}

function getManagers($tableName,$idTableControl,$conexao){

	/* GERENTE
    SELECT addr1 from s1_data where id_control='1' and flow_type='cg/cr' and addr1 not in (select addr2 from s1_data where flow_type='cg/cr' and id_control='1') group by addr1 UNION SELECT addr2 from s1_data where id_control='1' and flow_type='no/nr' and addr2 not in (select addr2 from s1_data where flow_type='cg/cr' and id_control='1') group by addr2;
    */
    $sSQL = " SELECT addr1 from $tableName where id_control='".$idTableControl."' and flow_type='cg/cr' and addr1 not in ";
    $sSQL.= " (select addr2 from $tableName where flow_type='cg/cr' and id_control='".$idTableControl."') group by addr1 UNION";
    $sSQL.= " SELECT addr2 from $tableName where id_control='".$idTableControl."' and flow_type='no/nr' and addr2 not in ";
    $sSQL.= " (select addr2 from $tableName where flow_type='cg/cr' and id_control='".$idTableControl."') group by addr2;";
    return $conexao->GetCol($sSQL);	

}

function getAgents($tableName,$idTableControl,$conexao){

	/* AGENTE
    SELECT addr2 from s1_data where id_control='1' and flow_type='cg/cr' and addr2 not in (select addr1 from s1_data where id_control='1' and flow_type='cg/cr') group by addr2 EXCEPT SELECT addr1 from s1_data where id_control='1' and flow_type='no/nr' group by addr1;
    */
    $sSQL = " SELECT addr2 from $tableName where id_control='".$idTableControl."' and flow_type='cg/cr' and addr2 not in ";
    $sSQL.= " (select addr1 from $tableName where id_control='".$idTableControl."' and flow_type='cg/cr') group by addr2 ";
    $sSQL.= " EXCEPT SELECT addr1 from $tableName where id_control='".$idTableControl."' and flow_type='no/nr' group by addr1; ";
    return $conexao->GetCol($sSQL);

}

function getTraps($tableName,$idTableControl,$conexao){

	/* TRAP
    SELECT addr1 from s1_data where id_control='1' and flow_type='no/nr' and addr1 not in (select addr2 from s1_data where id_control='1' and flow_type='cg/cr') and addr1 not in (select addr1 from s1_data where id_control='1' and flow_type='cg/cr') group by addr1;
    */
    $sSQL = " SELECT addr1 from $tableName where id_control='".$idTableControl."' and flow_type='no/nr' and addr1 not in ";
    $sSQL.= " (select addr2 from $tableName where id_control='".$idTableControl."' and flow_type='cg/cr') and addr1 not in ";
    $sSQL.= " (select addr1 from $tableName where id_control='".$idTableControl."' and flow_type='cg/cr') group by addr1; ";
    return $conexao->GetCol($sSQL);

}

function getManagerAgent($tableName,$idTableControl,$conexao){

	/* GERENTE AGENTE
    SELECT addr1 from s1_data where id_control='1' and flow_type='cg/cr' and addr1 in (select addr2 from s1_data where id_control='1' and flow_type='cg/cr') group by addr1 UNION select addr2 from s1_data where id_control='1' and flow_type='no/nr' and addr2 in (select addr2 from s1_data where id_control='1' and flow_type='cg/cr') group by addr2;
    */
    $sSQL = " SELECT addr1 from $tableName where id_control='".$idTableControl."' and flow_type='cg/cr' and addr1 in ";
    $sSQL.= " (select addr2 from $tableName where id_control='".$idTableControl."' and flow_type='cg/cr') group by addr1 UNION ";
    $sSQL.= " select addr2 from $tableName where id_control='".$idTableControl."' and flow_type='no/nr' and addr2 in ";
    $sSQL.= " (select addr2 from $tableName where id_control='".$idTableControl."' and flow_type='cg/cr') group by addr2; ";
    return $conexao->GetCol($sSQL);
	
}

function getAgentTrap($tableName,$idTableControl,$conexao){

	/* AGENTE TRAP
    SELECT addr1 from s1_data where id_control='1' and flow_type='no/nr' and addr1 in (select addr2 from s1_data where id_control='1' and flow_type='cg/cr') group by addr1;
    */
    $sSQL = " SELECT addr1 from $tableName where id_control='".$idTableControl."' and flow_type='no/nr' and addr1 in ";
    $sSQL.= " (select addr2 from $tableName where id_control='".$idTableControl."' and flow_type='cg/cr') group by addr1; ";
    return $conexao->GetCol($sSQL);

}

function getPointOnCircle($radius,$angle,$origx,$origy){
	
	//echo "$radius === $angle === $origx === $origy +++++++++++++\n";

	$r['coordX'] = ($radius * cos($angle * (pi() / 180))) + ($origx - $radius / 2);
    $r['coordY'] = ($radius * sin($angle * (pi() / 180))) + ($origy - $radius / 2);

	return $r;

}

function getCircleCenterRadius($angle,$_x,$_y,$_w,$_h){

	$w_factor = 3;
	$h_factor = 2;
	$r_factor = 3;

	if($angle == 0){
		$r['x'] = (($_w - $_x) / $w_factor) + $_x;	
		$r['y']	= $_y;
		$r['radius'] = ($r['x'] - $_x) / $r_factor;
	}
	elseif($angle == 90){
		$r['x'] = $_x;
        $r['y'] = (($_h - $_y) / $h_factor) + $_y;
		$r['radius'] = (float)(($r['y'] - $_y) / $r_factor);
    }
	elseif($angle == 180){
   		$r['x'] = $_x - ($_x / $w_factor);
        $r['y'] = $_y; 
		$r['radius'] = (float)(($_x - $r['x']) / $r_factor);
    }
	elseif($angle == 270){
    	$r['x'] = $_x;
        $r['y'] = $_y - ($_y / $h_factor);	
		$r['radius'] = (float)(($_y - $r['y']) / $r_factor);
    }
	elseif($angle > 0 && $angle < 90){
		$r['x'] = (($_w - $_x) / $w_factor) + $_x;
		$r['y'] = (($_h - $_y) / $h_factor) + $_y;
		$r['radius'] = (float)sqrt( pow((float)(($_w - $_x) / $w_factor),2) + pow((float)(($_h - $_y) / $h_factor),2) );
		if(($r['radius'] + $r['y']) > $_h)
            $r['y'] = $r['radius'] * 0.5;
	}
	elseif($angle > 90 && $angle < 180){
		$r['x'] = $_x - ($_x / $w_factor);
        $r['y'] = (($_h - $_y) / $h_factor) + $_y;
		$r['radius'] = (float)sqrt( pow((float)($_x / $w_factor),2) + pow((float)(($_h - $_y) / $h_factor),2) );
		if(($r['radius'] + $r['y']) > $_h)
            $r['y'] = $r['radius'] * 0.5;
    }
	elseif($angle > 180 && $angle < 270){
		$r['x'] = $_x - ($_x / $w_factor);
        $r['y'] = $_y - ($_y / $h_factor);
		$r['radius'] = (float)sqrt( pow((float)($_x / $w_factor),2) + pow((float)($_y / $h_factor),2) );
		if($r['radius'] > $r['y'])
			$r['y'] = $r['radius'] * 1.5;
    }
	elseif($angle > 270){
		$r['x'] = (($_w - $_x) / $w_factor) + $_x;
        $r['y'] = $_y - ($_y / $h_factor);
		$r['radius'] = (float)sqrt( pow((float)(($_w - $_x) / $w_factor),2) + pow((float)($_y / $h_factor),2) );
		if($r['radius'] > $r['y'])
            $r['y'] = $r['radius'] * 1.5;
    }

	return $r;

}

function getMAgentConn($manager,$arrControl,$topology,$tableName,$idTableControl,$agent,$conexao){

	$saida = array();

	$aux = count($agent);
    for($i = 0; $i < $aux; $i++){
    	$sSQL = " SELECT * from $tableName where id_control='".$idTableControl."' and addr2='".$agent[$i]."' ";
       	$sSQL.= " and addr1='".$manager."' and flow_type='cg/cr'; ";
		$result = $conexao->GetRow($sSQL);
        if(count($result) > 0){
			if(!array_key_exists($agent[$i],$arrControl)){
				$deviceId = addDevice("",
                               $agent[$i],
                               "",
                               $topology,
                               8,
                               0,
                               $conexao);
				$saida[$agent[$i]] = $deviceId;
        		//echo "AGENT conecta AG = ".$agent[$i]." ---- GE = ".$manager."\n";
          		//addConnection($deviceId,$control_array[$manager[$j]],$conexao);              
			} 
       	}
  	} 

	return $saida;

}

function getMTrapConn($manager,$arrControl,$topology,$tableName,$idTableControl,$trap,$conexao){ 

	$saida = array();

	$aux = count($trap);
    for($i = 0; $i < $aux; $i++){
        $sSQL = " SELECT * from $tableName where id_control='".$idTableControl."' and addr1='".$trap[$i]."' ";
        $sSQL.= " and addr2='".$manager."' and flow_type='no/nr'; ";
        $result = $conexao->GetRow($sSQL);
        //echo $sSQL."\n";
        if(count($result) > 0){
			if(!array_key_exists($trap[$i],$arrControl)){
                $deviceId = addDevice("",
                               $trap[$i],
                               "",
                               $topology,
                               10,
                               0,
                               $conexao);
                $saida[$trap[$i]] = $deviceId;
            	//echo "TRAP conecta AG = ".$trap[$i]." ---- GE = ".$manager."\n";
            	//addConnection($deviceId,$control_array[$manager[$j]],$conexao);              
			} 
        }
    }

	return $saida;
}

function getMAgentTrapConn($manager,$arrControl,$topology,$tableName,$idTableControl,$agent_trap,$conexao){

	$saida = array();

	$aux = count($agent_trap);
    for($i = 0; $i < $aux; $i++){
        $sSQL = " SELECT * from $tableName where id_control='".$idTableControl."' and ((addr1='".$agent_trap[$i]."' ";
        $sSQL.= " and addr2='".$manager."' and flow_type='no/nr') or ";
		$sSQL.= " (addr2='".$agent_trap[$i]."' and addr1='".$manager."' and flow_type='cg/cr')); ";
        $result = $conexao->GetRow($sSQL);
		if(count($result) > 0){
			if(!array_key_exists($agent_trap[$i],$arrControl)){
                $deviceId = addDevice("",
                               $agent_trap[$i],
                               "",
                               $topology,
                               11,
                               0,
                               $conexao);
                $saida[$agent_trap[$i]] = $deviceId;
            	//echo "conecta AG = ".$agent_trap[$i]." ---- GE = ".$manager."\n";
            	//addConnection($deviceId,$control_array[$manager[$j]],$conexao);               
			}
			else{
				$saida[$agent_trap[$i]] = $arrControl[$agent_trap[$i]];
			}
        }
    }

	return $saida;
}

function getConnectionType($from,$to,$conexao){

	$fromType = $conexao->GetOne("SELECT device_type_id from device where id = '".$from."';");
	$toType = $conexao->GetOne("SELECT device_type_id from device where id = '".$to."';");

	if($toType == 8 && $fromType == 7 || $toType == 8 && $fromType == 9) return 2;
	if($toType == 10 && $fromType == 7 || $toType == 10 && $fromType == 9) return 3;
	if($toType == 11 && $fromType == 7 || $toType == 11 && $fromType == 9) return 4;
	if($toType == 9 && $fromType == 7) return 5;

}

?>
