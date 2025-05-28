
<style>
.pet-gallery {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
    gap: 20px;
    padding: 20px;
}

.pet-card {
    border: 1px solid #ccc;
    border-radius: 10px;
    overflow: hidden;
    text-align: center;
    background: #f9f9f9;
    padding: 10px;
}

.pet-card img {
    width: 100%;
    height: 200px;
    object-fit: cover;
    border-radius: 10px;
}

.view-button {
    display: inline-block;
    margin-top: 10px;
    padding: 8px 15px;
    background-color: #007BFF;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    font-weight: bold;
}
.view-button:hover {
    background-color: #ADD8E6
;
}
</style>

<?php
$pets = [
    ["image" => "dog1.jpg", "name" => "Buddy", "age" => "2 years", "id" => 1],
    ["image" => "cat1.jpg", "name" => "Whiskers", "age" => "1 year", "id" => 2],
    ["image" => "bird1.jpg", "name" => "Tweety", "age" => "6 months", "id" => 3],
    ["image" => "dog2.jpeg", "name" => "Bruno", "age" => "4 years", "id" => 4],
    ["image" => "cat2.jpg", "name" => "Fifi", "age" => "3 year", "id" => 5],
    ["image" => "bird2.jpg", "name" => "Lu Lu", "age" => "4 months", "id" => 6],
    ["image" => "dog3.jpg", "name" => "Kojo", "age" => "5 years", "id" => 7],
    ["image" => "cat3.jpg", "name" => "Mikey", "age" => "1 year", "id" => 8],
    ["image" => "bird3.jpg", "name" => "Nola", "age" => "7 months", "id" => 9],
];
?>

<div class="pet-gallery">
    <?php foreach ($pets as $pet): ?>
        <div class="pet-card">
            <img src="images/<?= $pet['image'] ?>" alt="<?= $pet['name'] ?>">
            <h3><?= $pet['name'] ?> (<?= $pet['age'] ?>)</h3>
            <a href="pet-profile.php?id=<?= $pet['id'] ?>" class="view-button">View Profile</a>
        </div>
    <?php endforeach; ?>
</div>
