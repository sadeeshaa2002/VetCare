<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer/Exception.php';
require 'PHPMailer/PHPMailer.php';
require 'PHPMailer/SMTP.php';

$mail = new PHPMailer(true);

try {
    // Server settings
    $mail->isSMTP();
    $mail->Host       = 'smtp.gmail.com';
    $mail->SMTPAuth   = true;
    $mail->Username   = 'sadeeshaaa25@gmail.com';        // Your Gmail
    $mail->Password   = 'sytn oera ufxd onhg' ;           // Your Gmail App Password
    $mail->SMTPSecure = 'tls';
    $mail->Port       = 587;

    // Recipients
    $mail->setFrom($_POST['email'], $_POST['name']);
    $mail->addAddress('sadeeshaaa25@gmail.com');        // Vet's email

    // Content
    $mail->Subject = 'Pet Adoption Request';
    $mail->Body    = "Pet ID: " . $_POST['pet_id'] . "\n" .
                     "Name: " . $_POST['name'] . "\n" .
                     "Email: " . $_POST['email'] . "\n" .
                     "Phone: " . $_POST['phone'] . "\n" .
                     "Reason: " . $_POST['reason'];

    $mail->send();
    echo "Email sent successfully.";

    // Telegram notification
    $token = "YOUR_BOT_TOKEN";
    $chat_id = "YOUR_CHAT_ID";
    $message = "New adoption request:\n" . $mail->Body;
    file_get_contents("https://api.telegram.org/bot$token/sendMessage?chat_id=$chat_id&text=" . urlencode($message));

} catch (Exception $e) {
    echo "Mailer Error: {$mail->ErrorInfo}";
}
?>
