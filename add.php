<?php
require ("db.php");
$obrazek = basename($_FILES["obrazek"]["name"]);
move_uploaded_file($_FILES["obrazek"]["tmp_name"], "Obrazki/$obrazek");
$imie = $_POST["imie"];
$nazwisko = $_POST["nazwisko"];

$sql = "INSERT INTO konsultanci(`Id`, `Imie`, `Nazwisko`, `Zdjecie`) VALUES (NULL,'$imie','$nazwisko','$obrazek')";
$conn->query($sql);
$conn->close();
header("location: Konsultanci.php");

?>
