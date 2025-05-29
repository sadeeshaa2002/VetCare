<?php
$conn = new mysqli("localhost", "root", "", "vet_chat_db");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>