<?php
 include("session.php");
 require("db.php");

$kwota = $_POST["kwota"];
$komentarz = $_POST["kom"];

if($kwota > 0)
{
    $x = $_SESSION["login"];
    $sql = "SELECT id FROM uzytkownicy WHERE Login = '$x';";
    $result1 = $conn->query($sql);
    while($row = $result1->fetch_object())
    {
        $y = $row->id;
    }

    $sql2 = "SELECT saldo FROM operacje WHERE Id_klienta = $y;";
    $result = $conn->query($sql2);
    $Limit2 = $result->num_rows; // Liczba wierszy w wyniku zapytania
    $Limit1 = $Limit2 - 1;

    $y = intval($y);
    $Limit1 = intval($Limit1);
    $Limit2 = intval($Limit2);

    if ($Limit1 >= 0 && $Limit2 > 0) {
        $sqlXD = "SELECT saldo FROM operacje WHERE Id_klienta = $y LIMIT $Limit1, $Limit2;";
        $result = $conn->query($sqlXD);
        while($row = $result->fetch_object())
        {
            $saldo = $row->saldo;
        }
        $saldo = $saldo + $kwota;
        $sql3 = "INSERT INTO operacje(`Id_klienta`, `Od_kogo`, `Kwota`, `Saldo`, `Komentarz`) VALUES ($y, '$x', $kwota, $saldo, '$komentarz')";
        $conn->query($sql3);
        header('Location: index.php');
    } else {
        echo "Brak operacji dla tego klienta.";
    }
}
else {
    echo "
    <script>
    alert('Nieładnie tak!');
    window.location.href = 'Wplata.php';
    </script>
    ";
}
$conn->close();
?>
