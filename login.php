<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="Styles/style2.css">
</head>
<body>
<?php
require('db.php');
session_start();

if (isset($_POST["login"])) {
    $login = $_POST["login"];
    $haslo = $_POST["haslo"];

    $sql = "SELECT id FROM uzytkownicy WHERE login = ? AND haslo = ?";
    $stmt = $conn->prepare($sql);
    $hashedPassword = md5($haslo);
    $stmt->bind_param("ss", $login, $hashedPassword);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows == 1) {
        $row = $result->fetch_assoc();
        $_SESSION["login"] = $login;
        $_SESSION["id"] = $row["id"]; // Ustawienie zmiennej sesji id

        header("Location: index.php");
        exit;
    } else {
        echo "<div class='form'>
                <h3>Nieprawidłowy login lub hasło.</h3><br/>
                <p class='link'>Ponów próbę <a href='login.php'>logowania</a>.</p>
              </div>";
    }
} else {
?>
    <form class="form" method="post" name="login">
        <h1 class="login-title">Logowanie</h1>
        <input type="text" class="login-input" name="login" placeholder="Login" autofocus="true"/>
        <input type="password" class="login-input" name="haslo" placeholder="Hasło"/>
        <input type="submit" value="Zaloguj" name="submit" class="login-button"/>
        <p class="link"><a href="registration.php">Zarejestruj się</a></p>
    </form>
<?php
}
?>

</body>
</html>