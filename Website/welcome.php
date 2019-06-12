<?php
// Initialize the session
session_start();
 
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: inloggen.php");
    exit;
}
?>
 
<!DOCTYPE html>
<html>
<head>

</head>
<body>
    <div class="topnav">
        <img class="logo" src="Afbeeldingen/logo.jpg" alt="Super Thuiszorg logo" align="left">
        <a href="index.html">Home</a>
        <a href="werkwijze.html">Werkwijze</a>
        <a href="overons.html">Over ons</a>
        <a href="contact.html">Contact</a>
        <a class="active" href="inloggen.php">Inloggen</a>
        <a href="aanmelden.php">Aanmelden</a>
    </div>
    <div class="page-header">
        <h1>Hi, <b><?php echo htmlspecialchars($_SESSION["username"]); ?></b>. Welcome to our site.</h1>
    </div>
    <p>
        <a href="reset-password.php" class="btn btn-warning">Reset Your Password</a>
        <a href="uitloggen.php" class="btn btn-danger">Sign Out of Your Account</a>
    </p>
</body>
</html>