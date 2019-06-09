<?php

include("userValidationClass.php");
$userClass = new UserClass();

$errorMessage = "";

if (!empty($_POST['submitloginform'])) {
    
    $email    = $_POST['email'];
    $password = $_POST['password'];
    
    if (strlen(trim($email)) > 1 && strlen(trim($password)) > 1) {
        
        $uid = $userClass->userLogin($email, $password);
        if ($uid) {
            $url = 'index.php';
            header("Location: $url"); // Page redirecting to home.php 
        } else {
            $errorMessage = "Please enter the valid credential";
        }
        
    } else {
        $errorMessage = "Please Enter the valid details";
        
    }
    
    
}
?>


<!--
BOVENSTAAND = PHP ONLY
ONDERSTAAND = HTML ONLY
-->


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
        <a href="contact.html">Contact</a>
        <a class="active" href="inloggen.php">Inloggen</a>
        <a href="aanmelden.php">Aanmelden</a>
    </div>
      <br>
      <h1>Inloggen</h1>
      <form action="userValidationClass.php">
         <div class="container">
            <h2>Voor het inloggen met u account vult u de onderstaande gegevens in:</h2>
            <hr>
             
            <table>
                <form method="post" action="" name="login">
                   <tr>
                      <th><label><b>E-mail:</b></label></th>
                      <th><input type="text" placeholder="e-mail...." name="email" required><br></th>
                   </tr>
                   <tr>
                        <th><label><b>Wachtwoord</b></label></th>
                        <th><input type="password" placeholder="wachtwoord...." name="password" required></th>
                        <div class="errorMsg"><?php echo $errorMessage; ?></div>
                   </tr>
                </form>  
            </table>
            <input type="submit" class="button" name="submitloginform" value="Login">
         </div>
            <span class="psw"><a href="#">Wachtwoord vergeten?</a></span>
      </form>
       <br><br><br><br>   
       <div class="copyright">
         <p>
            © Copyright by Super Thuiszorg!
         </p>
      </div>
   </body>
</html>