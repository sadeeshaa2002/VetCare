<?php
session_start();
if (!isset($_SESSION['admin']) || $_SESSION['admin'] !== true) {
    header("Location: adminlogin.php");
    exit;
}
include 'dbshop.php'; // Your database connection

// Fetch all orders
$orders_result = $conn->query("SELECT * FROM orders ORDER BY order_date DESC");
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Order History</title>
  <link rel="stylesheet" href="Shopping.css?v=1.1">
</head>
<body>

<?php include "nav.php"; ?>

<h1>📜 Order History</h1>
<a href="Shopping.php">← Back to Shop</a>
<hr>

<?php while ($order = $orders_result->fetch_assoc()): ?>
  <div class="order-box" style="margin-bottom: 30px;">
    <h3>🆔 Order #<?= $order['id'] ?></h3>
    <p><strong>Customer:</strong> <?= $order['customer_name'] ?> (<?= $order['customer_email'] ?>)</p>
    <p><strong>Date:</strong> <?= $order['order_date'] ?></p>

    <?php
    $order_id = $order['id'];
    $items_result = $conn->query("SELECT * FROM order_items WHERE order_id = $order_id");
    ?>

    <table border="1" cellpadding="10" cellspacing="0" style="width:100%;">
      <tr>
        <th>Product</th>
        <th>Price</th>
        <th>Qty</th>
        <th>Subtotal</th>
      </tr>
      <?php $total = 0; ?>
      <?php while ($item = $items_result->fetch_assoc()): ?>
        <tr>
          <td><?= $item['name'] ?></td>
          <td>$<?= $item['price'] ?></td>
          <td><?= $item['quantity'] ?></td>
          <td>$<?= $item['price'] * $item['quantity'] ?></td>
        </tr>
        <?php $total += $item['price'] * $item['quantity']; ?>
      <?php endwhile; ?>
      <tr>
        <td colspan="3" style="text-align:right;"><strong>Total:</strong></td>
        <td><strong>$<?= $total ?></strong></td>
      </tr>
    </table>
  </div>
<?php endwhile; ?>

</body>
</html>
