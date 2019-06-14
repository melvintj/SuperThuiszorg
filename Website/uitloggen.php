<?php
//    header("location: inloggen.php");
//        session_unset();
//        session_destroy();
//        session_write_close();
//        unset($_SESSION['loggedin']);
//        unset($_SESSION['UserID']);
//        unset($_SESSION['username']); 

    header("location: inloggen.php");
    session_start();
    session_unset();
    session_destroy();
    session_write_close();
    setcookie(session_name(),'',0,'/');
    session_regenerate_id(true);
?>


