<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="Shopping.css?v=1.1">
  <title>Pet Shop</title>
</head>
<body>
  <!-- Navigation Bar -->
  <?php include "nav.php"; ?>

  <?php
  session_start();
  include 'dbshop.php'; // or 'dbconnection.php' if you fixed it properly

  $result = $conn->query("SELECT * FROM products");
  ?>

  <h1>Pet Shop</h1>
  <a href="shopcart.php">View Cart</a>
  <a href="adminlogin.php"> / Order History</a>
  <hr>

  <?php while($row = $result->fetch_assoc()): ?>
      <div class="product-card">
    <h2><?= $row['name'] ?></h2>
    <p>Price: $<?= $row['price'] ?></p>
    <form method="post" action="shopcart.php">
        <input type="hidden" name="id" value="<?= $row['id'] ?>">
        <input type="hidden" name="name" value="<?= $row['name'] ?>">
        <input type="hidden" name="price" value="<?= $row['price'] ?>">
        <input type="number" name="qty" value="1" min="1">
        <button type="submit" name="add_to_cart">Add to Cart</button>
    </form>
</div>

  <?php endwhile; ?>
</body>
</html>
