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

if (!isset($_SESSION['cart'])) {
    $_SESSION['cart'] = [];
}

// Add to cart
if (isset($_POST['add_to_cart'])) {
    $item = [
        'id' => $_POST['id'],
        'name' => $_POST['name'],
        'price' => $_POST['price'],
        'qty' => $_POST['qty']
    ];
    $_SESSION['cart'][] = $item;
    header("Location: shopcart.php");
    exit;
}

// Remove item
if (isset($_GET['remove'])) {
    unset($_SESSION['cart'][$_GET['remove']]);
    $_SESSION['cart'] = array_values($_SESSION['cart']);
    header("Location: shopcart.php");
    exit;
}
?>

<h1>Your Cart</h1>
<a href="Shopping.php">Continue Shopping</a>
<hr>

<?php
$total = 0;
if (!empty($_SESSION['cart'])):
?>
    <table border="1" cellpadding="10">
        <tr>
            <th>Name</th><th>Price</th><th>Qty</th><th>Total</th><th>Action</th>
        </tr>
        <?php foreach($_SESSION['cart'] as $index => $item): ?>
            <tr>
                <td><?= $item['name'] ?></td>
                <td>$<?= $item['price'] ?></td>
                <td><?= $item['qty'] ?></td>
                <td>$<?= $item['price'] * $item['qty'] ?></td>
                <td><a href="?remove=<?= $index ?>">Remove</a></td>
            </tr>
            <?php $total += $item['price'] * $item['qty']; ?>
        <?php endforeach; ?>
    </table>
    <h3>Total: $<?= $total ?></h3>

    <form method="post" action="checkoutshop.php">
        <h3>Checkout Details</h3>
        <input type="text" name="name" placeholder="Your Name" required><br><br>
        <input type="email" name="email" placeholder="Your Email" required><br><br>
        <button type="submit" name="checkout">Place Order</button>
    </form>

<?php else: ?>
    <p>Your cart is empty.</p>
<?php endif; ?>
