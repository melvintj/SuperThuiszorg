<?php
    $username = $POST['username'];
    $password = $POST['password'];

    // prevent mysql injection
    $username = stripcslashes($username);
    $password = stripcslashes($password);
    $username = mysql_real_escape_string($username);
    $password = mysql_real_escape_string($password);
    
    //connect to the server and select the database
    mysql_connect("localhost", "root", "");
    mysql_select_db("superthuiszorgdb");

    // Query the database for user
    $result = mysql_query("SELECT portal.password, userportal.userID FROM portal, userportal WHERE userportal.userID = '$username' AND portal.password = '$password'")
        or die("Failed to query database ".mysql_error());
    $row = mysql_fetch_array($result);
    if($row['$username'] == $username && $row['$password'] == $password ){
        echo "The login was successful!!!  Welcome to Super Thuiszorg".$row['$username'];
    }else{
        echo "Failed to login, please try agian.";
    }
?>