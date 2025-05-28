<?php
$botToken = "7938632874:AAGgqd2wwJN4CdtDVhN9qxKV8cKCfNi7OnY"; // Your bot token
$chatId = "7870540977"; // Vet's chat ID
$message = "Hi Vet! A new adopter is interested in a pet. Please check the system.";

$url = "https://api.telegram.org/bot$botToken/sendMessage";

// Prepare data
$data = [
    'chat_id' => $chatId,
    'text' => $message
];

// Send message using cURL
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$response = curl_exec($ch);
curl_close($ch);

// Optionally show result
echo $response;
?>
