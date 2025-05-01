<?php
$to = "vetemail@example.com"; // Replace with vet's email
$subject = "Pet Adoption Request";

$body = "Pet ID: " . $_POST['pet_id'] . "\n";
$body .= "Name: " . $_POST['name'] . "\n";
$body .= "Email: " . $_POST['email'] . "\n";
$body .= "Phone: " . $_POST['phone'] . "\n";
$body .= "Reason: " . $_POST['reason'];

$headers = "From: " . $_POST['email'];

if (mail($to, $subject, $body, $headers)) {
    echo "Adoption request sent!";
} else {
    echo "Failed to send request.";
}
?>
