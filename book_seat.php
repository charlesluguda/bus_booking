<?php include 'includes/db.php'; ?>

<?php
if (isset($_POST['bus_id']) && isset($_POST['seat_number']) && isset($_POST['customer_name']) && isset($_POST['customer_email']) && isset($_POST['customer_phone'])) {
    $bus_id = $_POST['bus_id'];
    $seat_number = $_POST['seat_number'];
    $customer_name = $_POST['customer_name'];
    $customer_email = $_POST['customer_email'];
    $customer_phone = $_POST['customer_phone'];

    // Insert booking informations
    $sql = "INSERT INTO bookings (bus_id, seat_number, customer_name, customer_email, customer_phone) VALUES (?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("iisss", $bus_id, $seat_number, $customer_name, $customer_email, $customer_phone);
    $stmt->execute();

    // To update avilable seats
    $sql = "UPDATE buses SET available_seats = available_seats - 1 WHERE bus_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $bus_id);
    $stmt->execute();

    //Successfully message..........
    echo "Seat booked successfully!";
    echo "<br><a href='index.php'>Back to Home</a>";
} else {
    echo "Error: Invalid data.";
}
?>

<?php $conn->close(); ?>
