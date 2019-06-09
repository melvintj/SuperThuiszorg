<?php
Class UserClass
{
    
    // connect to mysql database 
    public function DBConnect()
    {
        
        $dbhost = "localhost"; // set the hostname
        $dbname = "superthuiszorgdb"; // set the database name
        $dbuser = "root"; // set the mysql username
        $dbpass = ""; // set the mysql password
        
        
        try {
            $dbConnection = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);
            $dbConnection->exec("set names utf8");
            $dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $dbConnection;
            
        }
        catch (PDOException $e) {
            echo 'Connection failed: ' . $e->getMessage();
        }
        
        
        
    }
    // logic and validation for user registration page
    public function userRegistration($email, $password)
    {
        
        try {
            $dbConnection = $this->DBConnect();
            $emailValidation         = $dbConnection->prepare('SELECT COUNT(*) FROM `user` WHERE `Email` = ?');
            $emailValidation->bindParam(1, $email, PDO::PARAM_STR);
            $result = $emailValidation->execute();

                $stmt = $dbConnection->prepare("CALL REGISTER_USER_PROCEDURE(?, ?)");
                $stmt->bindParam(1, $email, PDO::PARAM_STR); 
                $stmt->bindParam(2, $password, PDO::PARAM_STR); 
                $stmt->execute();

                return true;
        }
        catch (PDOException $e) {
            return false;
        }
        
    }
    
    // logic and validation for user login page
    public function userLogin($email, $password)
    {
        
        try {
            $dbConnection  = $this->DBConnect();
            $stmt          = $dbConnection->prepare('SELECT u.Email, p.Password
FROM user u, portal p, userportal up
WHERE  up.UserID = u.UserID AND up.PasswordID = p.PasswordID AND u.Email = ? AND p.Password = ?');
//            $hash_password = hash('sha256', $password);
            $stmt->bindParam(1, $email, PDO::PARAM_STR); 
            $stmt->bindParam(2, $password, PDO::PARAM_STR); 
            $stmt->execute();
            $Count = $stmt->rowCount();
            echo $Count;
            $data  = $stmt->fetch(PDO::FETCH_OBJ);
            if ($Count == 1) {
                session_start();
                $_SESSION['uid']   = $data->UID; // Storing user session value
                $_SESSION['uname'] = $data->USERNAME; // Storing user session value
                $dbConnection      = null;
                return true;
                
            } else {
                $dbConnection = null;
                return false;
                
            }
            
        }
        catch (PDOException $e) {
            echo 'Connection failed: ' . $e->getMessage();
        }
        
    }
    
}
?>