<?php
$id = $_GET["id"];
if ($id == "desktop") {
      $myFile = "login.jpg";
      $fh = fopen($myFile, 'r');
      $theData = fread($fh, 500000);
      fclose($fh);
      echo $theData;
}
 
else{
     $myFile1 = "follow.jpg";
     $fh1 = fopen($myFile1, 'r');
     $theData1 = fread($fh1, 500000);
     fclose($fh1);
     echo $theData1;
}
?>
