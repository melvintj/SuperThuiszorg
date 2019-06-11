<?php>

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
                     <th class="alignLeft">Voornaam:</th>
                     <th class="alignLeft"><input style="border-radius: 10px" placeholder="" type="text" tabindex="1" required autofocus></th>
                  </tr>
               </fieldset>
               <fieldset>
                  <tr>
                     <th class="alignLeft">Achternaam:</th>
                     <th class="alignLeft"><input style="border-radius: 10px" placeholder="" type="text" tabindex="2" required></th>
                  </tr>
               </fieldset>
               <fieldset>
                  <tr>
                     <th class="alignLeft">E-mail:</th>
                     <th class="alignLeft"><input style="border-radius: 10px" placeholder="" type="email" tabindex="3" required></th>
                  </tr>
               </fieldset>
               <fieldset>
                  <tr>
                     <th class="alignLeft">Telnr.:</th>
                     <th class="alignLeft"><input style="border-radius: 10px" placeholder="" type="tel" tabindex="4"></th>
                  </tr>
               </fieldset>
               <fieldset>
                  <tr>
                     <th class="alignLeft">
                        Website url:
                     </th>
                     <th class="alignLeft">
                        <input style="border-radius: 10px" placeholder="" type="url" tabindex="4">
                     </th>
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