<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>bus booking system</title>
    <link rel="stylesheet" href="./assets/css/style.css">
</head>
<body>
<?php include 'includes/header.php'; ?>
<?php include 'includes/db.php'; ?>

<main>
    <h2>Search for Routes</h2>
    <form action="search.php" method="GET">
        <label for="from_location">From:</label>
        <input type="text" id="from_location" name="from_location" required>
        <label for="to_location">To:</label>
        <input type="text" id="to_location" name="to_location" required>
        <label for="departure_time">Departure Time:</label>
        <input type="datetime-local" id="departure_time" name="departure_time" required>
        <button type="submit">Search</button>
    </form>
</main>

<?php include 'includes/footer.php'; ?>

</body>
</html>