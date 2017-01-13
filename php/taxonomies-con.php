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

	echo print_r($_REQUEST,1);

}

?>
