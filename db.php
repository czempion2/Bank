<?php
 $conn = new mysqli("localhost", "root", "", "bank");
 if ($conn->connect_error) {
 exit("Connection failed: " . $conn->connect_error);
 }

?>