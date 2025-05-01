<form action="send-mail.php" method="POST">
    <input type="hidden" name="pet_id" value="<?= $_GET['pet'] ?>">
    <label>Your Name: <input type="text" name="name" required></label><br>
    <label>Email: <input type="email" name="email" required></label><br>
    <label>Phone: <input type="text" name="phone" required></label><br>
    <label>Why do you want to adopt? <textarea name="reason" required></textarea></label><br>
    <button type="submit">Send Request</button>
</form>
