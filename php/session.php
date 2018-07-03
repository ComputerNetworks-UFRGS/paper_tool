<?php

session_start("tool");

if(!$_SESSION['userid'])
    {
    session_destroy();
    header("Location: login.php");
    }

?>
