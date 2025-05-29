<?php
session_start();
require 'db.php';
if (!isset($_SESSION['user_id'])) header("Location: index.php");

$role = $_SESSION['role'];
$user_id = $_SESSION['user_id'];

// ✅ Show all pets to everyone
$query = "SELECT * FROM pets";
$pets = $conn->query($query);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Vet Dashboard</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: #f5f8ff;
            margin: 0;
            padding: 20px;
        }
        h2 {
            color: #222;
            margin-bottom: 20px;
        }
        .pet-list {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 16px;
        }
        .pet-card {
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.05);
            transition: transform 0.2s ease;
        }
        .pet-card:hover {
            transform: translateY(-5px);
        }
        .pet-card h3 {
            margin: 0 0 10px;
            color: #333;
        }
        .chat-link {
            display: inline-block;
            margin-top: 10px;
            text-decoration: none;
            background: #007bff;
            color: #fff;
            padding: 8px 16px;
            border-radius: 8px;
        }
        .chat-link:hover {
            background: #0056b3;
        }
        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .logout {
            text-decoration: none;
            color: #e74c3c;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="topbar">
        <h2>Welcome, <?= ucfirst($role) ?></h2>
        <a class="logout" href="logout.php">Logout</a>
    </div>

    <div class="pet-list">
        <?php while($pet = $pets->fetch_assoc()): ?>
            <div class="pet-card">
                <h3><?= htmlspecialchars($pet['name']) ?></h3>
                <a class="chat-link" href="chat.php?pet_id=<?= $pet['pet_id'] ?>">Chat with <?= ($role === 'vet') ? 'Adopter' : 'Vet' ?></a>
            </div>
        <?php endwhile; ?>
    </div>
