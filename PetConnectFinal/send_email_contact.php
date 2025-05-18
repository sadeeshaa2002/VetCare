<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'vendor/autoload.php';

// Get form data
$name = $_POST['name'];
$email = $_POST['email'];
$subject = $_POST['subject'];
$message = $_POST['message'];

$mail = new PHPMailer(true);

try {
    // Server settings
    $mail->isSMTP();
    $mail->Host = 'smtp.gmail.com';
    $mail->SMTPAuth = true;

    // ✅ Use your Gmail + app password (not Gmail login password)
    $mail->Username = 'sadeeshaaa25@gmail.com';
    $mail->Password = 'sytn oera ufxd onhg ';

    $mail->SMTPSecure = 'tls';
    $mail->Port = 587;

    // Sender and receiver
    $mail->setFrom($email, $name); // Sender (user's email)
    $mail->addAddress('vet_email@gmail.com'); // ✅ Receiver (vet's email)

    // Content
    $mail->isHTML(true);
    $mail->Subject = $subject;
    $mail->Body = "<strong>Name:</strong> $name<br>
                   <strong>Email:</strong> $email<br>
                   <strong>Subject:</strong> $subject<br>
                   <strong>Message:</strong><br>$message";

    $mail->send();
    echo "Message has been sent successfully.";

} catch (Exception $e) {
    echo "Email could not be sent. Error: {$mail->ErrorInfo}";
}
?>
