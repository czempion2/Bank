<?php
 include("session.php");
 require("db.php");
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Strona bankowa</title>
    <link rel="stylesheet" href="Styles/styl.css">
</head>
<body>

    <nav>
    <div style="grid-area:zero;">
            <a href="index.php"> Główna</a> 
        </div>
        <div style="grid-area:one;">
            <a href="Wplata.php"> Wpłać pieniądze </a> 
        </div>
        <div style="grid-area:two;">
            <a href="Przelew.php"> Wyślij przelew </a> 
        </div>
        <div style="grid-area:three;">
            <a href="Ulubione.php"> Kontakt </a> 
        </div>
        <div style="grid-area:four;">
            <a href="Kursy.php"> Zapisz się na kurs</a> 
        </div>
        <div style="grid-area:five;">
        <a href="Historia.php" style="">Historia</a>
        </div>
        <div style="grid-area:six;">
        <a href="logout.php" style="">Wyloguj</a>
        </div>
    </nav>
    <section>
        Nasi konsultanci: <br>
         <?php 
          require ("db.php");

          $sql = "SELECT * FROM konsultanci";
          $result = $conn -> query($sql);

          if ($result->num_rows > 0) {
            echo "<table>";
            while ($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td><img src='Obrazki/{$row['Zdjecie']}' class='konsulImg' style='height:200px; width:250px;'></td>";
                echo "<td><a href='details.php?Id={$row['Id']}'>{$row['Imie']} {$row['Nazwisko']} </a></td>";
                echo "</tr>";
            }
            echo "</table>";
        } else {
            echo "Nie znaleziono żadnych dzbanów.";
        }
         ?>
    </section>
    <footer>
        Stronę wykonał: <i>Andrzej Stefaniuk i Rafał Szymorowski </i>
    </footer>

</body>
</html>