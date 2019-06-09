<?php

if(empty($_SESSION['uid']))
{
$url='portal.php';
header("Location: $url");
}
else{

}

?>