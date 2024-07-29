-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2024 at 10:09 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `seat_number` int(11) DEFAULT NULL,
  `boarding_point` varchar(255) DEFAULT NULL,
  `dropping_point` varchar(255) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `customer_phone` varchar(20) DEFAULT NULL,
  `booking_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `bus_id`, `seat_number`, `boarding_point`, `dropping_point`, `customer_name`, `customer_email`, `customer_phone`, `booking_date`) VALUES
(1, 5, 2, NULL, NULL, 'charles', 'charlesluguda6@gmail.com', '0752903509', '2024-07-29 19:26:19'),
(2, 5, 5, 'majengo', 'kituo', 'zuhairy', 'charlesluguda6@gmail.com', '0752903509', '2024-07-29 19:36:50'),
(3, 5, 5, NULL, NULL, 'zuhairy', 'charlesluguda6@gmail.com', '0752903509', '2024-07-29 19:53:56');

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

CREATE TABLE `buses` (
  `bus_id` int(11) NOT NULL,
  `route_id` int(11) DEFAULT NULL,
  `bus_name` varchar(255) NOT NULL,
  `bus_type` varchar(50) DEFAULT NULL,
  `total_seats` int(11) DEFAULT NULL,
  `available_seats` int(11) DEFAULT NULL,
  `operator_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buses`
--

INSERT INTO `buses` (`bus_id`, `route_id`, `bus_name`, `bus_type`, `total_seats`, `available_seats`, `operator_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Luxury Express', 'AC', 50, 50, 'Safari Line', '2024-07-29 19:09:18', '2024-07-29 19:23:50'),
(2, 1, 'Comfort Cruiser', 'Non-AC', 45, 45, 'City Bus Services', '2024-07-29 19:09:18', '2024-07-29 19:23:50'),
(3, 2, 'Royal Ride', 'AC', 55, 55, 'Royal Travels', '2024-07-29 19:09:18', '2024-07-29 19:23:50'),
(4, 2, 'Economy Express', 'Non-AC', 50, 50, 'Budget Line', '2024-07-29 19:09:18', '2024-07-29 19:23:50'),
(5, 3, 'Premium Journey', 'AC', 48, 45, 'Prime Buses', '2024-07-29 19:09:18', '2024-07-29 19:53:56'),
(6, 3, 'Standard Shuttle', 'Non-AC', 52, 52, 'Local Transport', '2024-07-29 19:09:18', '2024-07-29 19:23:50'),
(7, 1, 'Arusha Shuttle', 'Non-AC', 40, 40, 'Arusha Transport', '2024-07-29 19:09:18', '2024-07-29 19:23:50');

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `route_id` int(11) NOT NULL,
  `from_location` varchar(255) NOT NULL,
  `to_location` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`route_id`, `from_location`, `to_location`, `created_at`, `updated_at`) VALUES
(1, 'Arusha', 'Mwanza', '2024-07-29 19:03:17', '2024-07-29 19:03:17'),
(2, 'Arusha', 'Dar es Salaam', '2024-07-29 19:03:17', '2024-07-29 19:03:17'),
(3, 'Arusha', 'Mbeya', '2024-07-29 19:03:17', '2024-07-29 19:03:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `bus_id` (`bus_id`);

--
-- Indexes for table `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`bus_id`),
  ADD KEY `route_id` (`route_id`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`route_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `buses`
--
ALTER TABLE `buses`
  MODIFY `bus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`bus_id`);

--
-- Constraints for table `buses`
--
ALTER TABLE `buses`
  ADD CONSTRAINT `buses_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
