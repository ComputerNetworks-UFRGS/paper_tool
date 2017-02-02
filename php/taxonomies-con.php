<?php
require_once "session.php";
require_once "../conf/general.php";
require_once INCLUDE_ADODB;
require_once INCLUDE_ADODB_ERROR;

$conexao = ADONewConnection(DATABASE_DRIVER);
$conexao->Connect(DATABASE_SERVER, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME);

function storeFields($json,$length,$parentId,$order,$tableName,$sequenceName,$conexao){

	for($i = 0; $i < $length; $i++){
		$topicName = $json[$i]['text']; 
		$topicId = $conexao->GetOne("SELECT nextval('".$sequenceName."');");
		$sSQL = " INSERT into ".$tableName." (id,name,order_view,parent_id) ";
		$sSQL.= " values (".$topicId.",'".$topicName."',".$order.",".$parentId.");";
		$conexao->Execute($sSQL);
		if(is_array($json[$i]['children'])){
			storeFields($json[$i]['children'],
						count($json[$i]['children']),
						$topicId,
						0,
						$tableName,
						$sequenceName,
						$conexao);			
		}
		$order++;
	}
}

$operation = $_REQUEST["operation"];

// Add taxonomy
if($operation == 1){
	
	$id = $conexao->GetOne("SELECT nextval('taxonomies_seq');");	

	$params = array();
	$params[] = $id;
	$params[] = $_REQUEST['newTaxonomyName'];
	$params[] = 1; // ajustar para pegar o codigo pela sessao

	$sSQL = "INSERT INTO taxonomies (id,name,created_by) values (?,?,?)";
    if($conexao->Execute($sSQL,$params)){
    	echo $id;
    }
    else{
    	echo 0;
    }
}

// Storing taxonomy fields
if($operation == 2){

	$tableName = "taxonomy_".$_REQUEST['taxonomyId']."_fields";
	$sequenceName = "taxonomy_".$_REQUEST['taxonomyId']."_fields_seq";

	$sSQL = "SELECT EXISTS ";
	$sSQL.= "( SELECT 1 FROM information_schema.tables WHERE ";
	$sSQL.= "  table_schema = 'public' AND table_name = '".$tableName."') as exist;";
	$exist = $conexao->GetOne($sSQL);

	if($exist == 'f'){
		$conexao->Execute("create sequence ".$sequenceName.";");

		$sSQL = "create table ".$tableName." ( ";
    	$sSQL.= "	id integer DEFAULT nextval('".$sequenceName."'::regclass) NOT NULL,";
    	$sSQL.= "	name text,";
    	$sSQL.= "	parent_id integer,";
    	$sSQL.= "	active smallint DEFAULT 1,";
    	$sSQL.= "	order_view smallint";
    	$sSQL.= " ); ";
    	$conexao->Execute($sSQL);

		$conexao->Execute("ALTER TABLE public.".$tableName." OWNER TO tool;");
		$conexao->Execute("ALTER SEQUENCE public.".$sequenceName." OWNER TO tool;");
	}

	$treeJson = $_REQUEST['treeJson'];
	$length = count($treeJson);
	if(!$length){
		echo $length;
		die();
	}

	$parentId = 0;
	storeFields($treeJson,$length,$parentId,0,$tableName,$sequenceName,$conexao);
	echo 1;
}

// Loading taxonomy fields
if($operation == 3){

	$tableName = "taxonomy_".$_REQUEST['taxonomyId']."_fields";
	$sequenceName = "taxonomy_".$_REQUEST['taxonomyId']."_fields_seq";

	$sSQL = " SELECT id,CASE WHEN parent_id = 0 THEN '#' ELSE parent_id::text END as parent, ";
	$sSQL.= " name||' | ['||(select count(*) from papers_taxonomies where topic_id = ".$tableName.".id and taxonomy_id = ".$_REQUEST['taxonomyId']." )||']' as text ";
	$sSQL.= " from ".$tableName." where active = 1 order by parent_id,order_view;";

	$taxoFields = $conexao->GetArray($sSQL);

	$length = count($taxoFields);
	if(!$length){
		echo $length;
		die();
	}

	$result = array();
	for($i = 0; $i < $length; $i++){
		$result[$i]['id'] = $taxoFields[$i]['id'];
		$result[$i]['parent'] = $taxoFields[$i]['parent'];
		$result[$i]['text'] = $taxoFields[$i]['text'];
	}

	echo json_encode($result);
}

?>
