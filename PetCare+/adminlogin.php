<?php
session_start();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    if ($username === 'admin' && $password === 'admin123') {
        $_SESSION['admin'] = true;
        header('Location: orderhistory.php');
        exit;
    } else {
        $error = "Invalid credentials!";
    }
}


?>
 

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Login | PetConnect</title>
  <link rel="stylesheet" href="Shopping.css">
  <style>
    body {
      background: #f0f4f8;
      font-family: 'Segoe UI', sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .login-container {
      background: white;
      padding: 40px;
      border-radius: 15px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 400px;
      text-align: center;
    }

    .login-container h1 {
      margin-bottom: 25px;
      color: #333;
    }

    input[type="text"],
    input[type="password"] {
      width: 100%;
      padding: 12px;
      margin: 10px 0;
      border: 1px solid #ccc;
      border-radius: 8px;
    }

    button {
      background-color: #4CAF50;
      color: white;
      padding: 12px 25px;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      width: 100%;
      font-size: 16px;
      margin-top: 10px;
      transition: background 0.3s;
    }

    button:hover {
      background-color: #45a049;
    }

    .error {
      color: red;
      margin-top: 15px;
    }

    .footer-text {
      margin-top: 20px;
      font-size: 12px;
      color: #888;
    }
  </style>
</head>
<body>



<div class="login-container">
  <h1>🔐 Admin Login</h1>
  <form method="post">
    <input type="text" name="username" placeholder="Admin Username" required>
    <input type="password" name="password" placeholder="Password" required>
    <button type="submit">Login</button>
  </form>

  <?php if (isset($error)): ?>
    <div class="error"><?= $error ?></div>
  <?php endif; ?>

  <div class="footer-text">
    Access restricted to administrators only.
  </div>
</div>

</body>
</html>
