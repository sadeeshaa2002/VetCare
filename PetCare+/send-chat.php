<?php
$conn = new mysqli("localhost", "root", "", "your_database");

$pet_id = $_POST['pet_id'];
$sender_type = $_POST['sender_type'];
$message = $_POST['message'];

$stmt = $conn->prepare("INSERT INTO pet_chat (pet_id, sender_type, message) VALUES (?, ?, ?)");
$stmt->bind_param("iss", $pet_id, $sender_type, $message);
$stmt->execute();

header("Location: pet-profile.php?pet=" . $pet_id);
exit;
?>
