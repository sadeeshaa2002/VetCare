<!-- adopt.php -->
<?php
$pets = [
    ["image" => "dog1.jpg", "name" => "Buddy", "age" => "2 years", "id" => 1],
    ["image" => "cat1.jpg", "name" => "Whiskers", "age" => "1 year", "id" => 2],
    ["image" => "bird1.jpg", "name" => "Tweety", "age" => "6 months", "id" => 3],
    // Add up to 9
];
?>

<div class="pet-gallery">
    <?php foreach ($pets as $pet): ?>
        <div class="pet-card">
            <img src="images/<?= $pet['image'] ?>" alt="<?= $pet['name'] ?>">
            <h3><?= $pet['name'] ?> (<?= $pet['age'] ?>)</h3>
            <a href="pet-profile.php?id=<?= $pet['id'] ?>">View Profile</a>
        </div>
    <?php endforeach; ?>
</div>
