<?php
// Include config file
require_once "config.php";

// Define variables and initialize with empty values
$username = $password = $confirm_password = "";
$username_err = $password_err = $confirm_password_err = "";

// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){

    // Validate username
    if(empty(trim($_POST["username"]))){
        $username_err = "Geef uw gebruikersnaam op.";
    } else{
        // Prepare a select statement
        $sql = "SELECT Username FROM user WHERE Username = :username";

        if($stmt = $pdo->prepare($sql)){
            // Bind variables to the prepared statement as parameters
            $stmt->bindParam(":username", $param_username, PDO::PARAM_STR);

            // Set parameters
            $param_username = trim($_POST["username"]);

            // Attempt to execute the prepared statement
            if($stmt->execute()){
                if($stmt->rowCount() == 1){
                    $username_err = "Deze gebruikersnaam is al in gebruik.";
                } else{
                    $username = trim($_POST["username"]);
                }
            } else{
                echo "Er gaat iets verkeerd, probeer het nog eens.";
            }
        }

        // Close statement
        unset($stmt);
    }

    // Validate password
    if(empty(trim($_POST["password"]))){
        $password_err = "Geef uw wachtwoord op.";     
    } elseif(strlen(trim($_POST["password"])) < 6){
        $password_err = "Het wachtwoord moet ten minste 6 karakters bevatten.";
    } else{
        $password = trim($_POST["password"]);
    }

    // Validate confirm password
    if(empty(trim($_POST["confirm_password"]))){
        $confirm_password_err = "Bevestig uw wachtwoord.";     
    } else{
        $confirm_password = trim($_POST["confirm_password"]);
        if(empty($password_err) && ($password != $confirm_password)){
            $confirm_password_err = "Wachtwoorden komen niet overeen.";
        }
    }

    // Check input errors before inserting in database
    if(empty($username_err) && empty($password_err) && empty($confirm_password_err)){

        // Prepare an insert statement
        $sql = "INSERT INTO user (Username, Password) VALUES (:username, :password)";

        if($stmt = $pdo->prepare($sql)){
            // Bind variables to the prepared statement as parameters
            $stmt->bindParam(":username", $param_username, PDO::PARAM_STR);
            $stmt->bindParam(":password", $param_password, PDO::PARAM_STR);

            // Set parameters
            $param_username = $username;
            //$param_password = password_hash($password, PASSWORD_DEFAULT); // Creates a password hash
            $param_password = $password; // Unhashed password TEMPORARY

            // Attempt to execute the prepared statement
            if($stmt->execute()){
                // Redirect to login page
                header("location: inloggen.php");
            } else{
                echo "Er gaat iets verkeerd probeer het nog een keer.";
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
            <a href="inloggen.php">Inloggen</a>
            <a class="active" href="aanmelden.php">Aanmelden</a>
        </div>
        
        <h1>Aanmelden</h1>

        <div class="container">
            
                <p>Voor het aanmelden van onze dienstverlening moet u een account aanmaken.</p>
                <form action="" method="post">
                    <div class="form-group <?php echo (!empty($username_err)) ? 'has-error' : ''; ?>">
                        <label>Gebruikersnaam</label>
                        <input type="text" name="username" class="form-control" value="<?php echo $username; ?>">
                        <span class="help-block"><?php echo $username_err; ?></span>
                    </div>
                    <div class="form-group <?php echo (!empty($password_err)) ? 'has-error' : ''; ?>">
                        <label>Wachtwoord</label>
                        <input type="password" name="password" class="form-control" value="<?php echo $password; ?>">
                        <span class="help-block"><?php echo $password_err; ?></span>
                    </div>
                    <div class="form-group <?php echo (!empty($confirm_password_err)) ? 'has-error' : ''; ?>">
                        <label>Bevestig Wachtwoord</label>
                        <input type="password" name="confirm_password" class="form-control" value="<?php echo $confirm_password; ?>">
                        <span class="help-block"><?php echo $confirm_password_err; ?></span>
                    </div>
                    <div class="button">
                        <input style= "color: #0068AC;background-color: #81EBFF;border-radius: 10px;width:240px;height:40px;font-weight:bold;font-size:24px;" type="submit" class="button" value="AANMELDEN">
<!--                        <input type="reset" class="btn btn-default" value="Reset">-->
                    </div>
                    <p>Heeft u al een account? <a href="inloggen.php">Log hier in</a>.</p>
                </form>
            
        </div>
        &nbsp;Bij het aanmaken van een account gaat u akkoord met onze <a href="#">Terms & Privacy</a>
        <br>
        <div class="copyright">
            <p>
                © Copyright by Super Thuiszorg!
            </p>
        </div>
    </body>

    </html>