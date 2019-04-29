-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2018 at 05:29 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `busbooking`
--

-- --------------------------------------------------------

--
-- Table structure for table `availability`
--

CREATE TABLE `availability` (
  `id` int(10) UNSIGNED NOT NULL,
  `bus` int(10) UNSIGNED DEFAULT NULL,
  `route` int(10) UNSIGNED DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `amount` varchar(40) DEFAULT NULL,
  `status` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `availability`
--

INSERT INTO `availability` (`id`, `bus`, `route`, `date`, `time`, `amount`, `status`) VALUES
(1, 1, 1, '2018-10-15', '13:00:00', '1', 'available'),
(2, 1, 2, '2018-10-22', '20:00:00', '2', 'available'),
(3, 2, 1, '2018-10-15', '13:00:00', '1', 'available'),
(4, 4, 3, '2018-10-15', '23:00:00', '3', 'available');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_number` int(10) UNSIGNED DEFAULT NULL,
  `fullname` int(10) UNSIGNED DEFAULT NULL,
  `phone` int(10) UNSIGNED DEFAULT NULL,
  `bus` int(10) UNSIGNED DEFAULT NULL,
  `seat` int(10) UNSIGNED DEFAULT NULL,
  `date` int(10) UNSIGNED DEFAULT '1',
  `time` int(10) UNSIGNED DEFAULT NULL,
  `luggage` varchar(40) DEFAULT NULL,
  `amount` varchar(40) DEFAULT NULL,
  `date_booked` date DEFAULT NULL,
  `field11` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `id_number`, `fullname`, `phone`, `bus`, `seat`, `date`, `time`, `luggage`, `amount`, `date_booked`, `field11`) VALUES
(9, 6, 6, 6, 4, 1, 4, 4, NULL, '4', '2018-10-15', NULL),
(10, 7, 7, 7, 1, 1, 1, 1, NULL, '1', '2018-10-15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

CREATE TABLE `buses` (
  `id` int(10) UNSIGNED NOT NULL,
  `number` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `buses`
--

INSERT INTO `buses` (`id`, `number`) VALUES
(1, 'KBX 8381'),
(2, 'KBZ 8283'),
(3, 'KDE 5982'),
(4, 'KAG 232');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `fullname` varchar(40) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `id_number` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `fullname`, `phone`, `id_number`) VALUES
(6, 'Nurul Aina binti Abu Bakar', '01126590725', '123'),
(7, 'aida', '12', '124');

-- --------------------------------------------------------

--
-- Table structure for table `membership_grouppermissions`
--

CREATE TABLE `membership_grouppermissions` (
  `permissionID` int(10) UNSIGNED NOT NULL,
  `groupID` int(11) DEFAULT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `allowInsert` tinyint(4) DEFAULT NULL,
  `allowView` tinyint(4) NOT NULL DEFAULT '0',
  `allowEdit` tinyint(4) NOT NULL DEFAULT '0',
  `allowDelete` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `membership_grouppermissions`
--

INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES
(1, 2, 'buses', 1, 3, 3, 3),
(2, 2, 'seats', 1, 3, 3, 3),
(3, 2, 'availability', 1, 3, 3, 3),
(4, 2, 'bookings', 1, 3, 3, 3),
(5, 2, 'routes', 1, 3, 3, 3),
(6, 2, 'customers', 1, 3, 3, 3),
(19, 3, 'buses', 0, 3, 0, 0),
(20, 3, 'seats', 0, 3, 0, 0),
(21, 3, 'availability', 0, 3, 0, 0),
(22, 3, 'bookings', 1, 1, 1, 1),
(23, 3, 'routes', 0, 3, 0, 0),
(24, 3, 'customers', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `membership_groups`
--

CREATE TABLE `membership_groups` (
  `groupID` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `description` text,
  `allowSignup` tinyint(4) DEFAULT NULL,
  `needsApproval` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `membership_groups`
--

INSERT INTO `membership_groups` (`groupID`, `name`, `description`, `allowSignup`, `needsApproval`) VALUES
(1, 'anonymous', 'Anonymous group created automatically on 2018-05-20', 0, 0),
(2, 'Admins', 'Admin group created automatically on 2018-05-20', 0, 1),
(3, 'customers', 'contains all customers', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `membership_userpermissions`
--

CREATE TABLE `membership_userpermissions` (
  `permissionID` int(10) UNSIGNED NOT NULL,
  `memberID` varchar(20) NOT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `allowInsert` tinyint(4) DEFAULT NULL,
  `allowView` tinyint(4) NOT NULL DEFAULT '0',
  `allowEdit` tinyint(4) NOT NULL DEFAULT '0',
  `allowDelete` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `membership_userpermissions`
--

INSERT INTO `membership_userpermissions` (`permissionID`, `memberID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES
(1, 'faizul hanif', 'buses', 1, 3, 3, 3),
(2, 'faizul hanif', 'seats', 1, 3, 3, 3),
(3, 'faizul hanif', 'availability', 1, 3, 3, 3),
(4, 'faizul hanif', 'bookings', 1, 3, 3, 3),
(5, 'faizul hanif', 'routes', 0, 3, 3, 3),
(6, 'faizul hanif', 'customers', 1, 3, 3, 3),
(13, 'syahril', 'buses', 1, 3, 3, 3),
(14, 'syahril', 'seats', 1, 3, 3, 3),
(15, 'syahril', 'availability', 1, 3, 3, 3),
(16, 'syahril', 'bookings', 1, 3, 3, 3),
(17, 'syahril', 'routes', 1, 3, 3, 3),
(18, 'syahril', 'customers', 1, 3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `membership_userrecords`
--

CREATE TABLE `membership_userrecords` (
  `recID` bigint(20) UNSIGNED NOT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `pkValue` varchar(255) DEFAULT NULL,
  `memberID` varchar(20) DEFAULT NULL,
  `dateAdded` bigint(20) UNSIGNED DEFAULT NULL,
  `dateUpdated` bigint(20) UNSIGNED DEFAULT NULL,
  `groupID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `membership_userrecords`
--

INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES
(1, 'buses', '1', 'admin', 1526809520, 1539613840, 2),
(2, 'seats', '1', 'admin', 1526809541, 1526809541, 2),
(3, 'seats', '2', 'admin', 1526809550, 1526809550, 2),
(4, 'seats', '3', 'admin', 1526809559, 1526809559, 2),
(5, 'seats', '4', 'admin', 1526809568, 1526809568, 2),
(6, 'seats', '5', 'admin', 1526809577, 1526809577, 2),
(7, 'seats', '6', 'admin', 1526809587, 1526809587, 2),
(8, 'seats', '7', 'admin', 1526809597, 1526809597, 2),
(9, 'seats', '8', 'admin', 1526809605, 1526809605, 2),
(10, 'seats', '9', 'admin', 1526809615, 1526809615, 2),
(11, 'seats', '10', 'admin', 1526809623, 1526809623, 2),
(12, 'routes', '1', 'admin', 1526809669, 1526809669, 2),
(13, 'routes', '2', 'admin', 1526809686, 1539614241, 2),
(14, 'availability', '1', 'admin', 1526809809, 1539616753, 2),
(15, 'availability', '2', 'admin', 1526809852, 1539614268, 2),
(20, 'buses', '2', 'admin', 1526820828, 1526820828, 2),
(21, 'availability', '3', 'admin', 1526820876, 1539616736, 2),
(30, 'buses', '4', 'admin', 1539600818, 1539612881, 2),
(32, 'routes', '3', 'admin', 1539612569, 1539616544, 2),
(33, 'availability', '4', 'admin', 1539612666, 1539612666, 2),
(34, 'seats', '11', 'admin', 1539613171, 1539613171, 2),
(35, 'seats', '12', 'admin', 1539613213, 1539613213, 2),
(36, 'customers', '6', 'aina', 1539614418, 1539614421, 3),
(37, 'bookings', '9', 'aina', 1539614449, 1539614449, 3),
(38, 'customers', '7', 'admin', 1539616651, 1539616653, 2),
(39, 'bookings', '10', 'admin', 1539616666, 1539616693, 2);

-- --------------------------------------------------------

--
-- Table structure for table `membership_users`
--

CREATE TABLE `membership_users` (
  `memberID` varchar(20) NOT NULL,
  `passMD5` varchar(40) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `signupDate` date DEFAULT NULL,
  `groupID` int(10) UNSIGNED DEFAULT NULL,
  `isBanned` tinyint(4) DEFAULT NULL,
  `isApproved` tinyint(4) DEFAULT NULL,
  `custom1` text,
  `custom2` text,
  `custom3` text,
  `custom4` text,
  `comments` text,
  `pass_reset_key` varchar(100) DEFAULT NULL,
  `pass_reset_expiry` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `membership_users`
--

INSERT INTO `membership_users` (`memberID`, `passMD5`, `email`, `signupDate`, `groupID`, `isBanned`, `isApproved`, `custom1`, `custom2`, `custom3`, `custom4`, `comments`, `pass_reset_key`, `pass_reset_expiry`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@admin.com', '2018-05-20', 2, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2018-05-20\nRecord updated automatically on 2018-05-20', NULL, NULL),
('aina', '827ccb0eea8a706c4c34a16891f84e7b', 'aina@gmail.com', '2018-10-15', 3, 0, 1, '', '', '', '', 'member signed up through the registration form.', NULL, NULL),
('alif', '81dc9bdb52d04dc20036dbd8313ed055', 'baju@gmail.com', '2018-10-15', 2, 0, 1, '', '', '', '', '', NULL, NULL),
('axer', '8df244b8a5f9e1c780abc0d84fbdd1e3', 'a@gmail.com', '2018-10-15', 3, 0, 1, '', '', '', '', 'member signed up through the registration form.', NULL, NULL),
('faizul hanif', '81dc9bdb52d04dc20036dbd8313ed055', 'faizul@gmail.com', '2018-10-15', 3, 0, 1, '', '', '', '', 'member signed up through the registration form.', NULL, NULL),
('guest', NULL, NULL, '2018-05-20', 1, 0, 1, NULL, NULL, NULL, NULL, 'Anonymous member created automatically on 2018-05-20', NULL, NULL),
('kaddy', '827ccb0eea8a706c4c34a16891f84e7b', 'kaddy@gmail.com', '2018-05-21', 3, 0, 1, '', '', '', '', 'member signed up through the registration form.', NULL, NULL),
('kevoh', '827ccb0eea8a706c4c34a16891f84e7b', 'kevo@gmail.com', '2018-05-20', 3, 0, 1, '', '', '', '', 'member signed up through the registration form.', NULL, NULL),
('syahril', '81dc9bdb52d04dc20036dbd8313ed055', 'syahril@gmail.com', '2018-10-15', 3, 0, 1, '', '', '', '', 'member signed up through the registration form.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `time` varchar(40) DEFAULT NULL,
  `amount` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`id`, `name`, `time`, `amount`) VALUES
(1, 'Chavakali-Nairobi', 'day', '1000'),
(2, 'Kedah - Johor Baharu', 'night', 'RM70.00'),
(3, 'Kedah - Kuala Lumpur', 'night', '50.00');

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`id`, `name`) VALUES
(1, 'A1'),
(2, 'A2'),
(3, 'A3'),
(4, 'A4'),
(5, 'A5'),
(6, 'A6'),
(7, 'A7'),
(8, 'A8'),
(9, 'A9'),
(10, 'A10'),
(11, 'A11'),
(12, 'A12'),
(13, 'A13'),
(14, 'A14'),
(15, 'A15'),
(16, 'A16'),
(17, 'A17'),
(18, 'A18'),
(19, 'A19'),
(20, 'A20'),
(21, 'A21'),
(22, 'A22'),
(23, 'A23'),
(24, 'A24'),
(25, 'A25'),
(26, 'A26'),
(27, 'A27'),
(28, 'A28'),
(29, 'A29'),
(30, 'A30'),
(31, 'A32'),
(32, 'A32'),
(33, 'A33'),
(34, 'A34'),
(35, 'A35'),
(36, 'A36'),
(37, 'A37'),
(38, 'A38'),
(39, 'A39'),
(40, 'A40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `availability`
--
ALTER TABLE `availability`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bus` (`bus`),
  ADD KEY `route` (`route`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_number` (`id_number`),
  ADD KEY `bus` (`bus`),
  ADD KEY `seat` (`seat`);

--
-- Indexes for table `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `membership_grouppermissions`
--
ALTER TABLE `membership_grouppermissions`
  ADD PRIMARY KEY (`permissionID`);

--
-- Indexes for table `membership_groups`
--
ALTER TABLE `membership_groups`
  ADD PRIMARY KEY (`groupID`);

--
-- Indexes for table `membership_userpermissions`
--
ALTER TABLE `membership_userpermissions`
  ADD PRIMARY KEY (`permissionID`);

--
-- Indexes for table `membership_userrecords`
--
ALTER TABLE `membership_userrecords`
  ADD PRIMARY KEY (`recID`),
  ADD UNIQUE KEY `tableName_pkValue` (`tableName`,`pkValue`),
  ADD KEY `pkValue` (`pkValue`),
  ADD KEY `tableName` (`tableName`),
  ADD KEY `memberID` (`memberID`),
  ADD KEY `groupID` (`groupID`);

--
-- Indexes for table `membership_users`
--
ALTER TABLE `membership_users`
  ADD PRIMARY KEY (`memberID`),
  ADD KEY `groupID` (`groupID`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `availability`
--
ALTER TABLE `availability`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `buses`
--
ALTER TABLE `buses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `membership_grouppermissions`
--
ALTER TABLE `membership_grouppermissions`
  MODIFY `permissionID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `membership_groups`
--
ALTER TABLE `membership_groups`
  MODIFY `groupID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `membership_userpermissions`
--
ALTER TABLE `membership_userpermissions`
  MODIFY `permissionID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `membership_userrecords`
--
ALTER TABLE `membership_userrecords`
  MODIFY `recID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `seats`
--
ALTER TABLE `seats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
