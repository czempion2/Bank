<?php
require("session.php");
require("db.php");

$idKonsultanta = $_REQUEST["idKonsultanta"];
$idUzytkownika = $_SESSION["id"];

// Sprawdzenie, czy konsultant jest już w ulubionych
$sql = "SELECT Id FROM ulubieni WHERE IdKonsultanta = ? AND idUzytkownika = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ii", $idKonsultanta, $idUzytkownika);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows == 1) {
    $row = $result->fetch_assoc();
    $id = $row['Id'];
    $sql = "DELETE FROM ulubieni WHERE Id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);
} else {
    $sql = "INSERT INTO ulubieni (IdKonsultanta, IdUzytkownika) VALUES (?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ii", $idKonsultanta, $idUzytkownika);
}

if ($stmt->execute() !== TRUE) {
    echo "Error: " . $sql . "<br>" . $conn->error;
} else {
    echo "sukces";
}

$conn->close();
?>
