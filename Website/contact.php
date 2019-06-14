<?php>


if (isset($_POST['name']) && isset($_POST['email'])) {

 $name = $_POST['name'];
 $email = $_POST['email'];
 $to = 'vincent.loeve88@gmail.com';
 $subject = "contact formulier";
 $body = '<html>

    <body>

     <h2>Title</h2>

     <br>

     <p>Name:<br>'.$name.'</p>

     <p>Email:<br>'.$email.'</p>



    </body>

   </html>';



//headers

$headers  = "From: ".$name." <".$email.">\r\n";

$headers .= "Reply-To: ".$email."\r\n";

$headers .= "MIME-Version: 1.0\r\n";

$headers .= "Content-type: text/html; charset-utf-8";



//send

$send = mail($to, $subject, $body, $headers);

if ($send) {

 echo '<br>';

 echo "Verzending succesvol. Bedankt voor uw bericht.";

} else {

 echo 'Helaas er ging iets mis, controleer uw gegevens.';

}

}

?>

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
        <a class="active" href="contact.php">Contact</a>
        <a href="inloggen.php">Inloggen</a>
        <a href="aanmelden.php">Aanmelden</a>
    </div>
       <h1>Super Thuiszorg Contactformulier</h1>
      <div class="container">
         <form action="#">
            
             <h2>Als u contact met ons op wilt nemen kunt u het onderstaande formulier invullen. Wij proberen u bericht binnen 5 werkdagen te beantwoorden.</h2>
             <table>
               <fieldset>
                  <tr>
                     <th class="alignLeft">Voor en Achternaam:</th>
                     <th class="alignLeft">
                        <input style="border-radius: 10px" placeholder="Voornaam" type="text" name="name" tabindex="1" required autofocus></th>
                  </tr>
               </fieldset>
               
               <fieldset>
                  <tr>
                     <th class="alignLeft">E-mail:</th>
                     <th class="alignLeft"><input style="border-radius: 10px" placeholder="Uw E-mailadres" type="email" name="email" tabindex="3" required></th>
                  </tr>
               </fieldset>
             
               <fieldset>
                  <tr>
                     <th>
                     </th>
                  </tr>
               </fieldset>
            </table>
            <fieldset>
               <textarea placeholder="Bericht" class="messageField" tabindex="5" required></textarea>
            </fieldset>
            <button type="submit" class="submit">Verzenden</button>
            <br>
         </form>
      </div>
      <p class="contact">
         <img class="logoBottem" src="Afbeeldingen/logo.jpg" alt="Super Thuiszorg logo"><br><br><br>
         SUPERTHUISZORG<br><br>
         ADRES: <br>
         Hogeschoollaan 1<br>
         4818 CR<br>
         Breda<br><br>
         TELEFOON: +3118855388<br>
         E-MAIL: info@superthuiszorg.nl<br>
         KvK: 123456789<br>
      </p>
      <div class="copyright">
         <p>
            © Copyright by Super Thuiszorg!
         </p>
      </div>
   </body>
</html>