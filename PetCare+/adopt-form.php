<!DOCTYPE html>
<html>
<head>
    <title>Adoption Request</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f6fc;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .form-container {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 500px;
        }

        .form-container h2 {
            margin-bottom: 20px;
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        textarea {
            resize: vertical;
            min-height: 80px;
        }

        button {
            background-color: #4da6ff;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background-color: #3399ff;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Adoption Request</h2>
    <form action="send-mail.php" method="POST">
        <input type="hidden" name="pet_id" value="<?= $_GET['pet'] ?>">

        <label for="name">Your Name:</label>
        <input type="text" name="name" id="name" required>

        <label for="email">Email:</label>
        <input type="email" name="email" id="email" required>

        <label for="phone">Phone:</label>
        <input type="text" name="phone" id="phone" required>

        <label for="reason">Why do you want to adopt?</label>
        <textarea name="reason" id="reason" required></textarea>

        <button type="submit">Send Request</button>
    </form>
</div>

</body>
</html>
