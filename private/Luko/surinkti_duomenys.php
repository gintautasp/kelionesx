<?php
$pavadinimas = $_POST['pavadinimas'];
$data = $_POST['data'];
$laikas = $_POST['laikas'];
$trukme = $_POST['trukme'];
$aprasymas = $_POST['aprasymas'];
if (!empty($pavadinimas) || !empty($data) || !empty($laikas) || !empty($trukme) || !empty($aprasymas)) {
 $host = "localhost";
    $dbUsername = "root";
    $dbPassword = "";
    $dbname = "surinkti_duomenys";
    //create connection
    $conn = new mysqli($host, $dbUsername, $dbPassword, $dbname);
    if (mysqli_connect_error()) {
     die('Connect Error('. mysqli_connect_errno().')'. mysqli_connect_error());
    } else {
     $INSERT = "INSERT Into register (pavadinimas, data, laikas, trukme, aprasymas) values(?, ?, ?, ?, ?)";
     //Prepare statement
     $stmt = $conn->prepare($SELECT);
     $stmt->bind_param("s", $pavadinimas);
     $stmt->execute();
     $stmt->bind_result($pavadinimas);
     $stmt->store_result();
     $stmt->store_result();
     $stmt->fetch();
     $rnum = $stmt->num_rows;
     if ($rnum==0) {
      $stmt->close();
      $stmt = $conn->prepare($INSERT);
      $stmt->bind_param("sssss", $pavadinimas, $data, $laikas, $trukme, $aprasymas);
      $stmt->execute();
      echo "Jūsų duomenys buvo iššsaugoti, ačiū!";
     } else {
      echo "Neteisingai užpildėte duomenis";
     }
     $stmt->close();
     $conn->close();
    }
} else {
 echo "Visi laukeliai turi būti užpildyti";
 die();
}
?>

