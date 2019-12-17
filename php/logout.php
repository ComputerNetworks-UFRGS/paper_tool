<?php

session_start();

require_once "../conf/general.php";

unset($_SESSION);
session_destroy();

header("location: login.php");

?>
