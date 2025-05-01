<?php
// Sample static data - replace with DB logic if needed
$petDetails = [
    1 => ["name" => "Buddy", "image" => "dog1.jpg", "age" => "2 years", "disability" => "None", "history" => "Vaccinated"],
    2 => ["name" => "Whiskers", "image" => "cat1.jpg", "age" => "1 year", "disability" => "Blind in one eye", "history" => "Needs daily drops"],
    3 => ["name" => "Tweety", "image" => "bird1.jpg", "age" => "6 months", "disability" => "None", "history" => "Healthy"],
];

$id = $_GET['id'];
$pet = $petDetails[$id];
?>

<img src="images/<?= $pet['image'] ?>" style="width: 100%;">
<h2><?= $pet['name'] ?> (<?= $pet['age'] ?>)</h2>
<p><strong>Disabilities:</strong> <?= $pet['disability'] ?></p>
<p><strong>Medical History:</strong> <?= $pet['history'] ?></p>

<a href="adopt-form.php?pet=<?= $id ?>">Adopt Me</a>
