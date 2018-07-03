<?php

// System DIR_NAME
define("SYS_DIR_NAME","netslicing");

// System PATH
$_path = strstr(getcwd(),SYS_DIR_NAME,true);
define("SYS_PATH",$_path.SYS_DIR_NAME."/");

// PHPMailer
define("INCLUDE_PHPMAILER",SYS_PATH."libs/php/phpmailer/class.phpmailer.php");

// Adodb
define("INCLUDE_ADODB",SYS_PATH."libs/php/adodb/adodb.inc.php");
define("INCLUDE_ADODB_ERROR",SYS_PATH."libs/php/adodb/adodb-error.inc.php");

// Smarty
define("INCLUDE_SMARTY",SYS_PATH."libs/php/smarty/libs/Smarty.class.php");

// Papers
define("PAPERS_PATH",SYS_PATH."papers/");

// DATABASE settings

define("DATABASE_DRIVER","postgres");
define("DATABASE_SERVER","localhost");
define("DATABASE_USER","tool");
define("DATABASE_PASSWORD","tool");
define("DATABASE_NAME","paper_tool");

// Misc PATHs

define("PHP_INCLUDE_PATH","include/");

define("IMAGES_PATH","templates/images/");
define("JS_PATH","templates/js/");
define("CSS_PATH","templates/css/");
define("SVG_PATH","templates/svg/");

define("SYS_TITLE","Paper Tool");

define("JS_LIBS_PATH","../libs/js/");
define("CSS_LIBS_PATH","../libs/css/");

define("SCRIPTS_PATH_TODB","../scripts/dataToDB/");
define("SCRIPTS_PATH_FROMCSV","../scripts/processCSV/");

$ratingValues = array();
$ratingValues[0] = "No rated";
$ratingValues[1] = "Excelent";
$ratingValues[2] = "Good";
$ratingValues[3] = "Average";
$ratingValues[4] = "Poor";

$ratingColors = array();
$ratingColors[0]['class'] = "gray";
$ratingColors[1]['class'] = "green";
$ratingColors[2]['class'] = "yellow";
$ratingColors[3]['class'] = "orange";
$ratingColors[4]['class'] = "red";
$ratingColors[0]['colorCode'] = "#c5c5c5";
$ratingColors[1]['colorCode'] = "#8fc400";
$ratingColors[2]['colorCode'] = "#ffeb3b";
$ratingColors[3]['colorCode'] = "#ff9800";
$ratingColors[4]['colorCode'] = "#cc0000";

?>
