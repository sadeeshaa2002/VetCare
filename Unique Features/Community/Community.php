<?php include 'dbconnection.php'; ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Join Pet Care Community</title>
    <link rel="stylesheet" href="Comunity.css">
</head>
<body>
<header>
    
</header>

<div class="form-container">
    <h2>🐾 Join Our Community 🐾</h2>
    <form action="Community.php" method="post">
        <div class="form-group">
            <label for="name">Full Name:</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="email">Email Address:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="phone">Phone Number:</label>
            <input type="tel" id="phone" name="phone" required>
        </div>
        <div class="form-group">
            <label for="pet_type">Pet Type:</label>
            <select id="pet_type" name="pet_type" required>
                <option value="Dog">Dog</option>
                <option value="Cat">Cat</option>
                <option value="Bird">Bird</option>
                <option value="Rabbit">Rabbit</option>
                <option value="Other">Other</option>
            </select>
        </div>
        <div class="form-group">
            <label for="message">Your Message:</label>
            <textarea id="message" name="message" rows="4" required></textarea>
        </div>
        <input type="submit" name="submit_btn" value="Submit">
    </form>

    <?php
    if (isset($_POST['submit_btn'])) {
        // Get data from form
        $full_name = mysqli_real_escape_string($con, $_POST['name']);
        $email = mysqli_real_escape_string($con, $_POST['email']);
        $phone_number = mysqli_real_escape_string($con, $_POST['phone']);
        $pet_type = mysqli_real_escape_string($con, $_POST['pet_type']);
        $message = mysqli_real_escape_string($con, $_POST['message']);

        // Insert into DB
        $query = "INSERT INTO community_members (full_name, email, phone_number, pet_type, message)
                  VALUES ('$full_name', '$email', '$phone_number', '$pet_type', '$message')";
        $data = mysqli_query($con, $query);

        if ($data) {
            echo '<script>alert("✅ Data saved successfully!");</script>';
            echo '<div class="success">Thank you for joining our community!</div>';
        } else {
            echo '<script>alert("❌ Something went wrong. Please try again.");</script>';
        }
    }
    ?>
</div>

</body>
</html>
