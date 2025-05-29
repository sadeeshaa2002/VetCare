<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'vendor/autoload.php';

// Form data
$pet_id = $_POST['pet_id'];
$name = $_POST['name'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$reason = $_POST['reason'];

// Email content
$mail = new PHPMailer(true);

try {
    // Server settings
    $mail->isSMTP();
    $mail->Host = 'smtp.gmail.com';            // Use Gmail SMTP
    $mail->SMTPAuth = true;
    $mail->Username = 'sadeeshaaa25@gmail.com';   // ✅ Your Gmail
    $mail->Password = 'sytn oera ufxd onhg ';     // ✅ App password (not Gmail password)
    $mail->SMTPSecure = 'tls';
    $mail->Port = 587;

    // Sender & receiver
    $mail->setFrom($email, $name);
    $mail->addAddress('sadeeshaaa25@gmail.com'); // ✅ Vet's email

    // Content
    $mail->isHTML(false);
    $mail->Subject = 'Pet Adoption Request';
    $mail->Body = "Pet ID: $pet_id\nName: $name\nEmail: $email\nPhone: $phone\nReason: $reason";

    $mail->send();
    echo "Adoption request sent via email.<br>";

} catch (Exception $e) {
    echo "Email could not be sent. Error: {$mail->ErrorInfo}<br>";
}

// ✅ Telegram Bot Notification
$token = "7938632874:AAGgqd2wwJN4CdtDVhN9qxKV8cKCfNi7OnY";  // Your bot token
$chat_id = "7870540977";  // Vet's chat ID

$telegramMessage = "🐾 New Adoption Request!\nPet ID: $pet_id\nName: $name\nPhone: $phone\nReason: $reason";

file_get_contents("https://api.telegram.org/bot$token/sendMessage?chat_id=$chat_id&text=" . urlencode($telegramMessage));
?>
