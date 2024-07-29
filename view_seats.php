<?php include 'includes/header.php'; ?>
<?php include 'includes/db.php'; ?>

<?php
if (isset($_GET['bus_id'])) {
    $bus_id = $_GET['bus_id'];

    // Fetch bus details
    $sql = "SELECT * FROM buses WHERE bus_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $bus_id);
    $stmt->execute();
    $bus_result = $stmt->get_result();
    $bus = $bus_result->fetch_assoc();

    // Fetch booked seats
    $sql = "SELECT seat_number FROM bookings WHERE bus_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $bus_id);
    $stmt->execute();
    $booked_seats_result = $stmt->get_result();

    $booked_seats = [];
    while ($row = $booked_seats_result->fetch_assoc()) {
        $booked_seats[] = $row['seat_number'];
    }
}
?>

<main>
    <h2>Available Seats for <?php echo $bus['bus_name']; ?></h2>
    <form action="book_seat.php" method="POST">
        <input type="hidden" name="bus_id" value="<?php echo $bus_id; ?>">
        <label for="seat_number">Select Seat:</label>
        <select id="seat_number" name="seat_number" required>
            <?php for ($i = 1; $i <= $bus['total_seats']; $i++): ?>
                <?php if (!in_array($i, $booked_seats)): ?>
                    <option value="<?php echo $i; ?>"><?php echo $i; ?></option>
                <?php endif; ?>
            <?php endfor; ?>
        </select>
        <h3>Customer Information</h3>
        <label for="customer_name">Name:</label>
        <input type="text" id="customer_name" name="customer_name" required>
        <label for="customer_email">Email:</label>
        <input type="email" id="customer_email" name="customer_email" required>
        <label for="customer_phone">Phone:</label>
        <input type="text" id="customer_phone" name="customer_phone" required>
        <label for="boarding_point">Boarding Point:</label>
        <input type="text" id="boarding_point" name="boarding_point" required>
        <label for="dropping_point">Dropping Point:</label>
        <input type="text" id="dropping_point" name="dropping_point" required>
        <button type="submit">Book Seat</button>
    </form>
</main>

<?php include 'includes/footer.php'; ?>
