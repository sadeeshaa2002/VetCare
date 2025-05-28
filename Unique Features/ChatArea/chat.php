<?php
session_start();
require 'db.php';

if (!isset($_SESSION['user_id'])) header("Location: index.php");

$pet_id = intval($_GET['pet_id']);
$user_id = $_SESSION['user_id'];
$role = $_SESSION['role'];

// Fetch pet
$pet_result = $conn->query("SELECT * FROM pets WHERE pet_id = $pet_id");
$pet = $pet_result->fetch_assoc();

// Handle new text message
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['message'])) {
    $message = htmlspecialchars($_POST['message']);
    $stmt = $conn->prepare("INSERT INTO chat_messages (pet_id, sender_id, sender_role, message) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("iiss", $pet_id, $user_id, $role, $message);
    $stmt->execute();
}

// Handle file upload
if (isset($_FILES['file']) && $_FILES['file']['error'] == 0) {
    $filename = basename($_FILES['file']['name']);
    $ext = strtolower(pathinfo($filename, PATHINFO_EXTENSION));
    $allowed_types = ['pdf', 'doc', 'docx', 'jpg', 'jpeg', 'png'];

    if (in_array($ext, $allowed_types)) {
        $target = "uploads/" . time() . "_" . $filename;
        if (move_uploaded_file($_FILES['file']['tmp_name'], $target)) {
            $msg = "[File] <a href='" . htmlspecialchars($target, ENT_QUOTES) . "' target='_blank'>" . htmlspecialchars($filename, ENT_QUOTES) . "</a>";
            $stmt = $conn->prepare("INSERT INTO chat_messages (pet_id, sender_id, sender_role, message) VALUES (?, ?, ?, ?)");
            $stmt->bind_param("iiss", $pet_id, $user_id, $role, $msg);
            $stmt->execute();
        }
    } else {
        echo "<script>alert('Invalid file type!');</script>";
    }
}

// Fetch messages
$msgs = $conn->query("SELECT * FROM chat_messages WHERE pet_id = $pet_id ORDER BY timestamp ASC");
?>
<!DOCTYPE html>
<html>
<head>
    <title>Chat - <?= htmlspecialchars($pet['name']) ?></title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: #f1f3f6;
            margin: 0;
            padding: 20px;
        }
        .chat-box {
            max-width: 800px;
            margin: auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.06);
            padding: 20px;
        }
        .chat-header {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #333;
        }
        .messages {
            display: flex;
            flex-direction: column;
            height: 300px;
            overflow-y: auto;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background: #fafafa;
        }
        .message {
            margin-bottom: 12px;
            padding: 8px 12px;
            border-radius: 8px;
            max-width: 70%;
            display: inline-block;
        }
        .vet {
            background: #e8f0fe;
            align-self: flex-start;
        }
        .owner {
            background: #d1f5d3;
            align-self: flex-end;
            text-align: right;
            margin-left: auto;
        }
        .form-box {
            margin-top: 20px;
        }
        input[type=text] {
            padding: 10px;
            width: 70%;
            border-radius: 6px;
            border: 1px solid #ccc;
        }
        input[type=file] {
            margin-top: 10px;
        }
        button {
            padding: 10px 20px;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            margin-left: 10px;
            cursor: pointer;
        }
        button:hover {
            background: #0056b3;
        }
        .back {
            display: inline-block;
            margin-bottom: 10px;
            text-decoration: none;
            color: #555;
        }
    </style>
</head>
<body>
<div class="chat-box">
    <a class="back" href="dashboard.php">&larr; Back to Dashboard</a>
    <div class="chat-header">Chat about <?= htmlspecialchars($pet['name']) ?></div>
    <div class="messages">
        <?php while ($row = $msgs->fetch_assoc()): ?>
            <?php
                $isFile = str_contains($row['message'], '[File]');
                $safe_msg = $isFile ? $row['message'] : nl2br(htmlspecialchars($row['message']));
                $class = ($row['sender_role'] === 'vet') ? 'vet' : 'owner';
                echo "<div class='message $class'>$safe_msg<div style='font-size: 12px; color: #888;'>" . date('Y-m-d H:i', strtotime($row['timestamp'])) . "</div></div>";
            ?>
        <?php endwhile; ?>
    </div>
    <div class="form-box">
        <form method="POST">
            <input type="text" name="message" placeholder="Type your message..." required>
            <button type="submit">Send</button>
        </form>
        <form method="POST" enctype="multipart/form-data">
            <input type="file" name="file" required>
            <button type="submit">Upload File</button>
        </form>
    </div>
</div>
<script>
    const msgBox = document.querySelector('.messages');
    msgBox.scrollTop = msgBox.scrollHeight;
</script>
</body>
</html>
