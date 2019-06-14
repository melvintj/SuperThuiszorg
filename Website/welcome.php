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
<meta charset="UTF-8">
      <title>Super Thuiszorg</title>
      <link rel="stylesheet" type="text/css" href="style.css">  
</head>
<body>
    <div class="topnav">
        <img class="logo" src="Afbeeldingen/logo.jpg" alt="Super Thuiszorg logo" align="left">
        <a href="index.html">Home</a>
        <a href="werkwijze.html">Werkwijze</a>
        <a href="overons.html">Over ons</a>
        <a href="contact.php">Contact</a>
        <a class="active" href="inloggen.php">Inloggen</a>
        <a href="aanmelden.php">Aanmelden</a>
    </div>
    <div class="content">
        <h1>Hallo, <b><?php echo htmlspecialchars($_SESSION["username"]); ?></b>. Welkom op onze site.</h1>
    </div>
    <p>
        <a href="reset-password.php" class="button">Verander uw wachtwoord</a>
        <a href="uitloggen.php" class="button">UITLOGGEN</a>
    </p>
</body>
</html>