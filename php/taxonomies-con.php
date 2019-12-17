<?php
require_once "session.php";
require_once "../conf/general.php";
require_once INCLUDE_ADODB;
require_once INCLUDE_ADODB_ERROR;

$conexao = ADONewConnection(DATABASE_DRIVER);
$conexao->Connect(DATABASE_SERVER, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME);

function storeFields($json,$length,$parentId,$order,$tableName,$sequenceName,$conexao){

    $storedIds = array();
	for($i = 0; $i < $length; $i++){
		$topicId = (int)$json[$i]['id'];
		$topicName = $json[$i]['text'];
		if ($topicId == 0) {
            $topicId = $conexao->GetOne("SELECT nextval('" . $sequenceName . "');");
            $sSQL = " INSERT into " . $tableName . " (id,name,order_view,parent_id) " .
                    " values (" . $topicId . ",'" . $topicName . "'," . $order . "," . $parentId . ");";
			$conexao->Execute($sSQL);
			$storedIds[] = $conexao->insert_Id();
        } else {
            $sSQL = " UPDATE " . $tableName . " SET " .
				    " name = '" . $topicName . "', " .
				    " order_view = " . $order . "," .
				    " parent_id = " . $parentId . " " .
                    " WHERE id = " . $topicId . ";";
			$conexao->Execute($sSQL);
			$storedIds[] = $topicId;
		}


		if(isset($json[$i]['children']) && is_array($json[$i]['children'])){
			$childIds = storeFields($json[$i]['children'],
						count($json[$i]['children']),
						$topicId,
						0,
						$tableName,
						$sequenceName,
						$conexao);
			$storedIds = array_merge($storedIds, $childIds);
		}
		$order++;
	}
	return $storedIds;
}

$operation = $_REQUEST["operation"];

// Add taxonomy
if($operation == 1){
	
	$id = $conexao->GetOne("SELECT nextval('taxonomies_seq');");	

	$params = array();
	$params[] = $id;
	$params[] = $_REQUEST['newTaxonomyName'];
	$params[] = $_SESSION['userid'];
	$params[] = $_REQUEST['projectId'];

	$sSQL = "INSERT INTO taxonomies (id,name,created_by,project_id) values (?,?,?,?)";
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
	$ids = storeFields($treeJson,$length,$parentId,0,$tableName,$sequenceName,$conexao);

	$sSQL = "DELETE from ".$tableName." where id not in (".implode(',', $ids).")";
	$arr = $conexao->getArray($sSQL);
	echo 1;
}

// Loading taxonomy fields
if($operation == 3){

	$tableName = "taxonomy_".$_REQUEST['taxonomyId']."_fields";
	$sequenceName = "taxonomy_".$_REQUEST['taxonomyId']."_fields_seq";


	$sSQL = "
		SELECT taxo.id, taxo.name,
		CASE WHEN taxo.parent_id = 0 
			THEN 
				'#' 
			ELSE 
				taxo.parent_id::text 
			END as parent,
        CASE WHEN taxo.parent_id = 0
         	THEN
            	CASE WHEN ( select count(*) from ".$tableName." where parent_id = taxo.id ) = 0
					THEN
                    	name || ' | [' || (select count(*) from papers_taxonomies where taxonomy_id = ".$_REQUEST['taxonomyId']." and topic_id = taxo.id) || ']'
					ELSE
                        name || ' | [' || 
                        (select count(*) from 
                        	(select count(*) from papers_taxonomies 
                        	 where taxonomy_id = ".$_REQUEST['taxonomyId']." and topic_id in (select id from ".$tableName." where parent_id = taxo.id) 
                        	 group by paper_id ) 
                        as count) || ']' 
                    END               
            ELSE
                name||' | ['||(select count(*) from papers_taxonomies where topic_id = taxo.id and taxonomy_id = ".$_REQUEST['taxonomyId']." )||']' 
            END as text  
            from ".$tableName." as taxo where taxo.active = 1 order by taxo.parent_id,taxo.order_view ";

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
		if (isset($_REQUEST['edit']) && ($_REQUEST['edit'] == 1)) {
			$result[$i]['text'] = $taxoFields[$i]['name'];
		} else {
			$result[$i]['text'] = $taxoFields[$i]['text'];
		}
	}

	echo json_encode($result);
}

?>
