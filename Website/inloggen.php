<?php
// Initialize the session
session_start();
 
// Check if the user is already logged in, if yes then redirect him to welcome page
if(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true){
    header("location: welcome.php");
    exit;
}
 
// Include config file
require_once "config.php";
 
// Define variables and initialize with empty values
$username = $password = "";
$username_err = $password_err = "";
 
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
 
    // Check if username is empty
    if(empty(trim($_POST["username"]))){
        $username_err = "Vul uw gebruikernaam in.";
    } else{
        $username = trim($_POST["username"]);
    }
    
    // Check if password is empty
    if(empty(trim($_POST["password"]))){
        $password_err = "Vul uw wachtwoord in.";
    } else{
        $password = trim($_POST["password"]);
    }
    
    // Validate credentials
    if(empty($username_err) && empty($password_err)){
        // Prepare a select statement
        $sql = "SELECT UserID, Username, Password FROM user WHERE Username = :username";
        
        if($stmt = $pdo->prepare($sql)){
            // Bind variables to the prepared statement as parameters
            $stmt->bindParam(":username", $param_username, PDO::PARAM_STR);
            
            // Set parameters
            $param_username = trim($_POST["username"]);
            
            // Attempt to execute the prepared statement
            if($stmt->execute()){
                // Check if username exists, if yes then verify password
                if($stmt->rowCount() == 1){
                    if($row = $stmt->fetch()){
                        $id = $row["UserID"];
                        $username = $row["Username"];
                        $hashed_password = $row["Password"]; //   $hashed_password
                        if($hashed_password == $password){
                            // Password is correct, so start a new session
                            session_start();
                            
                            // Store data in session variables
                            $_SESSION["loggedin"] = true;
                            $_SESSION["UserID"] = $id;
                            $_SESSION["username"] = $username;                            
                            
                            // Redirect user to welcome page
                            header("location: welcome.php");
                        } else{
                            // Display an error message if password is not valid
                            $password_err = "Het wachtwoord wat u opgeeft klopt niet.";
                        }
                    }
                } else{
                    // Display an error message if username doesn't exist
                    $username_err = "Geen account gevonden met deze gebruikersnaam.";
                }
            } else{
                echo "Er gaat iets mis, controleer uw gegevens en probeer het opnieuw.";
            }
        }
        
        // Close statement
        unset($stmt);
    }
    
    // Close connection
    unset($pdo);
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
      <br>
      <div class="container">
        <h2>Inloggen</h2>
        <p>Geef uw uw gebruikersnaam en wachtwoord op en druk op inloggen.</p>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <div class="form-group <?php echo (!empty($username_err)) ? 'has-error' : ''; ?>">
                <label>Gebruikersnaam</label>
                <input type="text" name="username" class="form-control" value="<?php echo $username; ?>">
                <span class="help-block"><?php echo $username_err; ?></span>
            </div>    
            <div class="form-group <?php echo (!empty($password_err)) ? 'has-error' : ''; ?>">
                <label>Wachtwoord</label>
                <input type="password" name="password" class="form-control">
                <span class="help-block"><?php echo $password_err; ?></span>
            </div>
            <div class="button">
                <input style= "color: #0068AC;background-color: #81EBFF;border-radius: 10px;width:240px;height:40px;font-weight:bold;font-size:24px;" type="submit" class="button" value="INLOGGEN">
            </div>
            <p>Heeft u nog geen account? <a href="aanmelden.php">Meld u zich hier aan.</a>.</p>
        </form>
    </div>
       <br><br><br><br>   
       <div class="copyright">
         <p>
            © Copyright by Super Thuiszorg!
         </p>
      </div>
   </body>
</html>