<?php include 'includes/header.php'; ?>
<?php include 'includes/db.php'; ?>

<?php
if (isset($_GET['from_location']) && isset($_GET['to_location']) && isset($_GET['departure_time'])) {
    $from_location = $_GET['from_location'];
    $to_location = $_GET['to_location'];
    $departure_time = $_GET['departure_time'];

    $sql = "SELECT buses.bus_id, buses.bus_name, buses.bus_type, buses.total_seats, buses.available_seats, buses.operator_name
            FROM buses
            JOIN routes ON buses.route_id = routes.route_id
            WHERE routes.from_location = ? AND routes.to_location = ?";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $from_location, $to_location);
    $stmt->execute();
    $result = $stmt->get_result();
}
?>

<main>
    <h2>Available Buses</h2>
    <?php if ($result && $result->num_rows > 0): ?>
        <table>
            <thead>
                <tr>
                    <th>Bus Name</th>
                    <th>Bus Type</th>
                    <th>Total Seats</th>
                    <th>Available Seats</th>
                    <th>Operator Name</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <?php while($row = $result->fetch_assoc()): ?>
                    <tr>
                        <td><?php echo $row['bus_name']; ?></td>
                        <td><?php echo $row['bus_type']; ?></td>
                        <td><?php echo $row['total_seats']; ?></td>
                        <td><?php echo $row['available_seats']; ?></td>
                        <td><?php echo $row['operator_name']; ?></td>
                        <td><a href="view_seats.php?bus_id=<?php echo $row['bus_id']; ?>">View Seats</a></td>
                    </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
    <?php else: ?>
        <p>No buses available for the selected route and time.</p>
    <?php endif; ?>
</main>

<?php
$conn->close();
include 'includes/footer.php';
?>
