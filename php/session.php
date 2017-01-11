<?

session_start("vispaper");

if(!$_SESSION['userid'])
    {
    session_destroy();
    header("Location: login.php");
    }

?>
