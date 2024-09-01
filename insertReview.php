<?php
require("session.php");
require("db.php");
$idKonsult = $_POST["idKons"];
$nick = $_SESSION["login"];
$ocena = $_POST["ocena"];
$tresc = $_POST["tresc"];

$sql = "INSERT INTO recenzje (idKonsultanta, nick, ocena, tresc) VALUES ($idKonsult, '$nick', $ocena, '$tresc')";
$conn->query($sql);
$conn->close();
header("location: details.php?id={$idKonsult}");