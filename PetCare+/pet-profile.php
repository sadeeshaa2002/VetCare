<?php
$petDetails = [
    1 => ["name" => "Buddy", "image" => "dog1.jpg", "age" => "2 years", "disability" => "None", "history" => "Vaccinated, dewormed"],
    2 => ["name" => "Whiskers", "image" => "cat1.jpg", "age" => "1 year", "disability" => "Blind in one eye", "history" => "Needs daily eye drops"],
    3 => ["name" => "Tweety", "image" => "bird1.jpg", "age" => "6 months", "disability" => "None", "history" => "Healthy, active"],
    4 => ["name" => "Bruno", "image" => "dog2.jpeg", "age" => "4 years", "disability" => "Missing tail", "history" => "Recovered from injury, neutered"],
    5 => ["name" => "Fifi", "image" => "cat2.jpg", "age" => "3 year", "disability" => "None", "history" => "Vaccinated, calm temperament"],
    6 => ["name" => "Lu Lu", "image" => "bird2.jpg", "age" => "4 months", "disability" => "Slight limp on right leg", "history" => "Needs low perches, friendly"],
    7 => ["name" => "Kojo", "image" => "dog3.jpg", "age" => "5 years", "disability" => "Arthritis in hind legs", "history" => "Needs soft bedding, joint support"],
    8 => ["name" => "Mikey", "image" => "cat3.jpg", "age" => "1 year", "disability" => "None", "history" => "Vaccinated, playful"],
    9 => ["name" => "Nola", "image" => "bird3.jpg", "age" => "7 months", "disability" => "Feather loss on neck", "history" => "Recovering, vet monitored"],
];

$id = $_GET['id'];
$pet = $petDetails[$id];
?>


<!DOCTYPE html>
<html>
<head>
    <title><?php echo $pet['name']; ?> - Pet Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        .pet-container {
            max-width: 600px;
            margin: 0 auto;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .pet-container img {
            width: 300px;
            height: auto;
            border-radius: 10px;
        }
        .adopt-button {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 15px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }
        .adopt-button:hover {
            background-color: #45a049;
        }

        .chat-box {
    border: 1px solid #ddd;
    padding: 10px;
    background: #f9f9f9;
    border-radius: 8px;
}
.chat-box p {
    margin: 5px 0;
}
.chat-box strong {
    color: #0a66c2;
}

    </style>
</head>
<body>

<div class="pet-container">
<img src="images/<?php echo $pet['image']; ?>" alt="<?php echo $pet['name']; ?>" class="pet-image">

    <h2><?php echo $pet['name']; ?> (<?php echo $pet['age']; ?>)</h2>
    <p><strong>Disabilities:</strong> <?php echo $pet['disability']; ?></p>
    <p><strong>Medical History:</strong> <?php echo $pet['history']; ?></p>
    <a href="adopt-form.php?pet=<?php echo $pet['name']; ?>" class="adopt-button">Adopt Me</a>
</div>

<h2>Chat with Vet</h2>
<div style="border: 1px solid #ccc; padding: 10px; max-height: 300px; overflow-y: scroll;">
    <?php
    $petId = $_GET['id'];
    $conn = new mysqli("localhost", "root", "", "adopt me");
    $result = $conn->query("SELECT * FROM pet_chat WHERE pet_id = $petId ORDER BY timestamp ASC");

    while($row = $result->fetch_assoc()) {
        echo "<p><strong>{$row['sender_type']}:</strong> {$row['message']} <small style='color:gray;'>[{$row['timestamp']}]</small></p>";
    }
    ?>
</div>

<form action="send-chat.php" method="POST" style="margin-top: 10px;">
    <input type="hidden" name="pet_id" value="<?= $petId ?>">
    <input type="hidden" name="sender_type" value="adopter"> <!-- Change to 'vet' if vet logs in -->
    <textarea name="message" required placeholder="Type your message..." style="width: 100%;"></textarea><br>
    <button type="submit">Send</button>
</form>

</body>
</html>