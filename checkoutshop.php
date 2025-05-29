<?php
session_start();
include 'dbshop.php'; // DB connection

if (isset($_POST['checkout'])) {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $cart = $_SESSION['cart'];

    // Save order
    $stmt = $conn->prepare("INSERT INTO orders (customer_name, customer_email) VALUES (?, ?)");
    $stmt->bind_param("ss", $name, $email);
    $stmt->execute();
    $order_id = $stmt->insert_id;

    // Save each item
    foreach ($cart as $item) {
        $stmt = $conn->prepare("INSERT INTO order_items (order_id, product_id, name, price, quantity) VALUES (?, ?, ?, ?, ?)");
        $stmt->bind_param("iisdi", $order_id, $item['id'], $item['name'], $item['price'], $item['qty']);
        $stmt->execute();
    }

    $_SESSION['cart'] = []; // Clear cart
    echo "<h1>Thank you, $name!</h1>";
    echo "<p>Your order has been placed and confirmation sent to $email.</p>";
    echo '<a href="Shopping.php">Shop More</a>';
} else {
    header("Location: Shopping.php");
}
?>
