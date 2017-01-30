<?php

session_start('tool');

require_once "../conf/general.php";

unset($_SESSION);
session_destroy();

header("location: login.php");

?>
