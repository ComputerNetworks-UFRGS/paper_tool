<?php
// System URL
define("SYS_URL", 'http://'.$_SERVER['SERVER_NAME'].dirname($_SERVER['PHP_SELF']).'/');

// System DIR_NAME
define("SYS_DIR_NAME","paper-tool");

// System PATH
$_path = strstr(getcwd(),SYS_DIR_NAME,true);
define("SYS_PATH",$_path.SYS_DIR_NAME."/");

// PHPMailer
define("INCLUDE_PHPMAILER",SYS_PATH."libs/php/phpmailer/src/PHPMailer.php");
define("INCLUDE_PHPMAILER_SMTP",SYS_PATH."libs/php/phpmailer/src/SMTP.php");
define("INCLUDE_PHPMAILER_EXCEPTION",SYS_PATH."libs/php/phpmailer/src/Exception.php");

// Tickets
define("INCLUDE_TICKETS",SYS_PATH."php/tickets.php");

// Adodb
define("INCLUDE_ADODB",SYS_PATH."libs/php/adodb/adodb.inc.php");
define("INCLUDE_ADODB_ERROR",SYS_PATH."libs/php/adodb/adodb-error.inc.php");

// RBAC
define("INCLUDE_RBAC",SYS_PATH."php/rbac.php");

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

// EMAIL settings

define("EMAIL_SENDER_NAME","Paper Tool");
define("EMAIL_SENDER_ADDRESS","papertool.inf@gmaiil.com");
define("EMAIL_SMTP_HOST","smtp.gmail.com");
define("EMAIL_SMTP_AUTH",true);
define("EMAIL_SMTP_USER","papertool.inf");
define("EMAIL_SMTP_PASSWORD","5y5tr3vw@)!(");
define("EMAIL_SMTP_SECURITY","ssl");
define("EMAIL_SMTP_PORT","465");

// TICKETs

define("TICKET_TYPE_INVITATION", 1);
define("TICKET_TYPE_CONFIRMATION", 2);
define("TICKET_TYPE_PASSWORD_RESET", 2);
define("NUM_DAYS_TICKET_EXPIRATION", 7);

// ID GLOBAL RBAC
define("RBAC_PROJECT_ID_GLOBAL", 0);

// PROJECT ROLEs

define("PROJECT_ROLE_OWNER", 2);
define("PROJECT_ROLE_ADMIN", 3);
define("PROJECT_ROLE_COLLABORATOR", 4);

// OPERATIONs

define("OPERATION_PROJECT_ADD", 1);
define("OPERATION_PROJECT_EDIT", 2);
define("OPERATION_PROJECT_DELETE", 3);
define("OPERATION_PROJECT_QUESTIONS_ADD", 81);
define("OPERATION_PROJECT_QUESTIONS_EDIT", 82);
define("OPERATION_PROJECT_QUESTIONS_DELETE", 83);
define("OPERATION_PROJECT_USERS_ADD", 91);
define("OPERATION_PROJECT_USERS_EDIT", 92);
define("OPERATION_PROJECT_USERS_DELETE", 93);
define("OPERATION_USER_INVITE", 0);
define("OPERATION_USER_ADD", 1);
define("OPERATION_USER_EDIT", 2);
define("OPERATION_USER_DELETE", 3);
define("OPERATION_USER_REQUEST_NEW_PASSWORD", 91);
define("OPERATION_USER_CHANGE_PASSWORD", 92);
define("OPERATION_USER_SIGN_UP", 99);

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

function formatSQLDate($date, $format = 'd/m/Y H:i:s') {
  return date($format, strtotime($date));
}
?>
