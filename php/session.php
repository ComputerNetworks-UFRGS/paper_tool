<?php

session_start();

if(!$_SESSION['userid'])
    {
    session_destroy();
    header("Location: login.php");
    die;
    }
?>
