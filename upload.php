<?php
session_start();
require 'db.php';
if (!isset($_SESSION['user_id'])) header("Location: index.php");

$sender_id = $_SESSION['user_id'];
$sender_role = $_SESSION['role'];
$pet_id = $_POST['pet_id'];
$message = $_POST['message'];
$file_path = null;

if (isset($_FILES['file']) && $_FILES['file']['error'] == 0) {
    $target_dir = "uploads/";
    $file_name = basename($_FILES["file"]["name"]);
    $file_path = $target_dir . time() . "_" . $file_name;
    $file_type = strtolower(pathinfo($file_path, PATHINFO_EXTENSION));

    // Only allow specific file types
    $allowed_types = ['pdf', 'jpg', 'jpeg', 'png'];
    if (!in_array($file_type, $allowed_types)) {
        die("Invalid file type.");
    }

    move_uploaded_file($_FILES["file"]["tmp_name"], $file_path);
}

$stmt = $conn->prepare("INSERT INTO chat_messages (pet_id, sender_id, sender_role, message, file_path) VALUES (?, ?, ?, ?, ?)");
$stmt->bind_param("iisss", $pet_id, $sender_id, $sender_role, $message, $file_path);
$stmt->execute();
header("Location: chat.php?pet_id=$pet_id");
?>