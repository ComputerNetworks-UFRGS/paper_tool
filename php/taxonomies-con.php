<?php
//require_once "session.php";
require_once "../conf/general.php";
require_once INCLUDE_ADODB;
require_once INCLUDE_ADODB_ERROR;
require_once PHP_INCLUDE_PATH."general.functions.php";


$conexao = ADONewConnection(DATABASE_DRIVER);
$conexao->Connect(DATABASE_SERVER, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME);

$operation = $_REQUEST["operation"];

// Add taxonomy
if($operation == 1){
	
	$id = $conexao->GetOne("SELECT nextval('taxonomies_seq');");
	$ext = explode(".", $_FILES["paper"]["name"]);	

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
// Add new taxonomy fields
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
    	$sSQL.= "	id integer DEFAULT nextval('taxonomy_1_fields_seq'::regclass) NOT NULL,";
    	$sSQL.= "	name text,";
    	$sSQL.= "	parent_id integer,";
    	$sSQL.= "	active smallint DEFAULT 1";
    	$sSQL.= " ); ";
    	$conexao->Execute($sSQL);

		$conexao->Execute("ALTER TABLE public.".$tableName." OWNER TO tool;");
		$conexao->Execute("ALTER SEQUENCE public.".$sequenceName." OWNER TO tool;");
	}

	$treeJson = $_REQUEST['treeJson'];
	$length = count($treeJson);
	if(!$length){
		echo $length;
	}

	$parentId = 0;
	storeFields($treeJson,$length,$parentId,$tableName,$sequenceName,$conexao);

}

function storeFields($json,$length,$parentId,$tableName,$sequenceName,$conexao){

	for($i = 0; $i < $length; $i++){
		$topicName = $json[$i]['text']; 
		$topicId = $conexao->GetOne("SELECT nextval('".$sequenceName."');");
		$sSQL = " INSERT into ".$tableName." (id,name,parent_id) ";
		$sSQL.= " values (".$topicId.",'".$topicName."',".$parentId.");";
		//echo $sSQL."\n";
		$conexao->Execute($sSQL);
		if(is_array($json[$i]['children'])){
			storeFields($json[$i]['children'],
						count($json[$i]['children']),
						$topicId,$tableName,
						$sequenceName,
						$conexao);			
		}
	}
}
?>
