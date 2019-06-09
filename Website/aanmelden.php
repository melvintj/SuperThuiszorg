
<?php

include("userValidationClass.php");
$userClass = new UserClass();

$errorMessage  = "";
$sucessMessage = "";
$email_check = false;
if (!empty($_POST['submitregistrationform'])) {
    
    $email          = $_POST['email'];
    $password       = $_POST['password'];
    //$date= date();
    /* Regular expression check */
    $email_check    = preg_match('~^[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.([a-zA-Z]{2,4})$~i', $email);
    //$password_check = preg_match('~^[A-Za-z0-9!@#$%^&*()_]{6,20}$~i', $password);
    if ($email_check) {
        
        $uid = $userClass->userRegistration($email, $password);
        
        if ($uid) {
            
            $sucessMessage = "Registration successful, Please
   " . "<a href='inloggen.php'>Login</a>";
            
        } else {
            $errorMessage = "Email-ID already exists";
        }
        
        
    } else {
        $errorMessage = "Please enter the valid details";
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
        <a href="inloggen.php">Inloggen</a>
        <a class="active" href="aanmelden.html">Aanmelden</a>
    </div>
      <br>
       <h1>Aanmelden</h1>
         
         <div class="container">
            <h2>Voor het aanmelden van onze dienstverlening moet u een account aanmaken:</h2>
            <hr>
            <div>
               <table>
                   <form method="post" action="" name="register">
                      <tr>
                        <th>
                                <label><b>Email</b></label><br>
                        </th>
                            <th><input type="text" name="email" autocomple="off" required></th>
                        </tr>
                        <tr>
                         <th>
                            <label><b>Wachtwoord</b></label><br>
                        </th>
                        <th>
                            <input type="password" name="password" autocomple="off" required>
                            <div class="errorMsg"><?php echo $errorMessage; ?></div>
                            <div class="sucessMsg"><?php echo $sucessMessage; ?></div>
                            <input type="submit" class="button" name="submitregistrationform" value="Register">
                         </th>
                      </tr>
                    </form>
               </table>
            </div>  
         </div>
          &nbsp;Bij het aanmaken van een account gaat u akkoord met onze <a href="#">Terms & Privacy</a><br>
      <div>
          &nbsp;Heeft u al een account? <a href="inloggen.html">Inloggen</a>
      </div>
      <div class="copyright">
         <p>
            © Copyright by Super Thuiszorg!
             © Copyright by Super Thuiszorg!
         </p>
      </div>
   </body>
</html>