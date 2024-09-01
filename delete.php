<?php
require ("db.php");
require("session.php");
$idKonsult = $_POST["idKons"];
$sql = "DELETE FROM konsultanci WHERE id=$idKonsult";
$conn->query($sql);
$conn->close();
header("location: Konsultanci.php");
?>
