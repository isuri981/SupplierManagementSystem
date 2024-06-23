-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2024 at 06:57 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `suppliermanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_ID` int(11) NOT NULL,
  `Supplier_ID` int(11) DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Created_At` timestamp NOT NULL DEFAULT current_timestamp(),
  `Updated_At` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_ID`, `Supplier_ID`, `Name`, `Description`, `Price`, `Quantity`, `Created_At`, `Updated_At`) VALUES
(5, 1, 'Fridge', 'High-quality fridge', 5000.00, 10, '2024-04-15 15:31:38', '2024-04-24 05:44:12'),
(6, 1, 'Washing machine', 'Economical ', 1600.00, 8, '2024-04-15 15:31:38', '2024-04-23 06:06:44'),
(7, 2, 'Laptops', 'Multi-functional ', 9936.00, 12, '2024-04-15 15:31:38', '2024-04-23 06:08:27'),
(8, 3, 'T-shirts', 'Branded', 474.25, 25, '2024-04-15 15:31:38', '2024-04-23 06:09:39'),
(9, 12, 'Power bank', 'High quality', 60.00, 6, '2024-04-23 06:12:06', '2024-04-23 06:12:06'),
(10, 15, 'Perfume', 'Luxury Brands', 74.00, 2, '2024-04-23 06:14:23', '2024-04-23 06:14:23'),
(15, 10, 'cat', 'fff', 67.00, 56, '2024-04-24 05:40:17', '2024-04-24 05:40:17');

--
-- Triggers `product`
--
DELIMITER $$
CREATE TRIGGER `product_audit_trigger` AFTER INSERT ON `product` FOR EACH ROW BEGIN
    INSERT INTO `product_audit` (`Product_ID`, `Action`)
    VALUES (NEW.Product_ID, 'INSERT');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `product_audit_trigger_delete` AFTER DELETE ON `product` FOR EACH ROW BEGIN
    INSERT INTO `product_audit` (`Product_ID`, `Action`)
    VALUES (OLD.Product_ID, 'DELETE');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `product_audit_trigger_update` AFTER UPDATE ON `product` FOR EACH ROW BEGIN
    INSERT INTO `product_audit` (`Product_ID`, `Action`)
    VALUES (NEW.Product_ID, 'UPDATE');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `product_audit`
--

CREATE TABLE `product_audit` (
  `Audit_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Action` varchar(50) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_audit`
--

INSERT INTO `product_audit` (`Audit_ID`, `Product_ID`, `Action`, `Timestamp`) VALUES
(1, 6, 'UPDATE', '2024-04-22 16:21:41'),
(2, 5, 'UPDATE', '2024-04-23 06:03:24'),
(3, 5, 'UPDATE', '2024-04-23 06:03:51'),
(4, 5, 'UPDATE', '2024-04-23 06:04:41'),
(5, 6, 'UPDATE', '2024-04-23 06:06:44'),
(6, 7, 'UPDATE', '2024-04-23 06:08:27'),
(7, 8, 'UPDATE', '2024-04-23 06:09:39'),
(8, 9, 'INSERT', '2024-04-23 06:12:06'),
(9, 10, 'INSERT', '2024-04-23 06:14:23'),
(10, 15, 'INSERT', '2024-04-24 05:40:17'),
(11, 5, 'UPDATE', '2024-04-24 05:44:07'),
(12, 5, 'UPDATE', '2024-04-24 05:44:12');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order`
--

CREATE TABLE `purchase_order` (
  `Order_ID` int(11) NOT NULL,
  `Supplier_ID` int(11) DEFAULT NULL,
  `Order_Date` timestamp NOT NULL DEFAULT current_timestamp(),
  `Total_Amount` decimal(10,2) NOT NULL,
  `Status` varchar(50) NOT NULL,
  `Created_At` timestamp NOT NULL DEFAULT current_timestamp(),
  `Updated_At` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchase_order`
--

INSERT INTO `purchase_order` (`Order_ID`, `Supplier_ID`, `Order_Date`, `Total_Amount`, `Status`, `Created_At`, `Updated_At`) VALUES
(1, 1, '2024-04-15 15:31:38', 1099.00, 'Delivered', '2024-04-15 15:31:38', '2024-04-15 15:31:38'),
(5, 3, '2024-04-23 06:22:39', 2200.00, 'Delivered', '2024-04-23 06:22:39', '2024-04-23 06:22:39'),
(6, 10, '2024-04-23 06:23:27', 4357.00, 'Delivered', '2024-04-23 06:23:27', '2024-04-23 06:23:27'),
(7, 9, '2024-04-23 06:23:59', 65000.00, 'Delivered', '2024-04-23 06:23:59', '2024-04-23 06:23:59'),
(8, 3, '2024-04-23 06:24:34', 5000.00, 'Delivered', '2024-04-23 06:24:34', '2024-04-23 06:24:34');

--
-- Triggers `purchase_order`
--
DELIMITER $$
CREATE TRIGGER `purchase_order_audit_trigger_delete` AFTER DELETE ON `purchase_order` FOR EACH ROW BEGIN
    INSERT INTO `purchase_order_audit` (`Order_ID`, `Action`)
    VALUES (OLD.Order_ID, 'DELETE');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `purchase_order_audit_trigger_update` AFTER UPDATE ON `purchase_order` FOR EACH ROW BEGIN
    INSERT INTO `purchase_order_audit` (`Order_ID`, `Action`)
    VALUES (NEW.Order_ID, 'UPDATE');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_audit`
--

CREATE TABLE `purchase_order_audit` (
  `Audit_ID` int(11) NOT NULL,
  `Order_ID` int(11) NOT NULL,
  `Action` varchar(50) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchase_order_audit`
--

INSERT INTO `purchase_order_audit` (`Audit_ID`, `Order_ID`, `Action`, `Timestamp`) VALUES
(1, 2, 'DELETE', '2024-04-22 16:27:13');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `Supplier_ID` int(11) NOT NULL,
  `Supplier_Name` varchar(100) NOT NULL,
  `Contact_Person` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone_Number` varchar(20) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `Postal_Code` varchar(20) DEFAULT NULL,
  `Created_At` timestamp NOT NULL DEFAULT current_timestamp(),
  `Updated_At` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Deleted_At` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`Supplier_ID`, `Supplier_Name`, `Contact_Person`, `Email`, `Phone_Number`, `Address`, `City`, `Country`, `Postal_Code`, `Created_At`, `Updated_At`, `Deleted_At`) VALUES
(1, 'ABC Electronics', 'John Doe', 'john@example.com', '123-456-7890', '123 Main Street', 'Washington', 'USA', '12345', '2024-03-30 17:30:03', '2024-04-23 05:45:42', NULL),
(2, 'XYZ Technologies', 'Jane Smith', 'jane@example.com', '987-654-3210', '456 Elm Street', 'London', 'UK', '54323', '2024-03-30 17:30:03', '2024-04-23 05:46:40', NULL),
(3, 'Clothing Brands', 'Sam Johnson', 'sam@example.com', '456-789-0123', '789 Oak Street', 'Ottawa', 'Canada', '67890', '2024-03-30 17:30:03', '2024-04-23 05:48:02', NULL),
(9, 'Apple Asia', 'Michael Brown', 'michael@example.com', '111-222-3333', '321 Maple Avenue', 'Vienna', 'Australia', '13579', '2024-03-30 17:30:03', '2024-04-23 05:49:16', NULL),
(10, 'Cosmetics', 'Emily Wilson', 'emily@example.com', '555-666-7777', '987 Pine Road', 'Berlin', 'Germany', '24680', '2024-03-30 17:30:03', '2024-04-23 05:50:28', NULL),
(11, 'Midlands', 'David Lee', 'david@example.com', '999-888-7777', '741 Birch Lane', 'Paris', 'France', '98765', '2024-03-30 17:30:03', '2024-04-23 05:52:30', NULL),
(12, 'Mobile shops', 'Sophia Rodriguez', 'sophia@example.com', '777-888-9999', '852 Cedar Street', 'Madrid', 'Spain', '01234', '2024-03-30 17:30:03', '2024-04-23 05:53:21', NULL),
(13, 'Kids Toys', 'Daniel Martinez', 'daniel@example.com', '444-333-2222', '369 Oak Avenue', 'Rome', 'Italy', '56789', '2024-03-30 17:30:03', '2024-04-23 05:55:27', NULL),
(14, 'Vehicle', 'Olivia Taylor', 'olivia@example.com', '666-555-4444', '456 Walnut Drive', 'Tokyo', 'Japan', '10101', '2024-03-30 17:30:03', '2024-04-23 05:56:23', NULL),
(15, 'Spa Ceylon', 'William Moore', 'william@example.com', '081-333-4444', '963 KCC', 'Kandy', 'SriLanka', '2002', '2024-03-30 17:30:03', '2024-04-23 05:59:43', NULL);

--
-- Triggers `supplier`
--
DELIMITER $$
CREATE TRIGGER `supplier_audit_trigger_update` AFTER UPDATE ON `supplier` FOR EACH ROW BEGIN
    INSERT INTO `supplier_audit` (`Supplier_ID`, `Action`)
    VALUES (NEW.Supplier_ID, 'UPDATE');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_audit`
--

CREATE TABLE `supplier_audit` (
  `Audit_ID` int(11) NOT NULL,
  `Supplier_ID` int(11) NOT NULL,
  `Action` varchar(50) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier_audit`
--

INSERT INTO `supplier_audit` (`Audit_ID`, `Supplier_ID`, `Action`, `Timestamp`) VALUES
(1, 15, 'UPDATE', '2024-04-22 16:23:17'),
(2, 2, 'UPDATE', '2024-04-22 18:18:50'),
(3, 1, 'UPDATE', '2024-04-23 05:45:42'),
(4, 2, 'UPDATE', '2024-04-23 05:46:40'),
(5, 3, 'UPDATE', '2024-04-23 05:48:02'),
(6, 9, 'UPDATE', '2024-04-23 05:49:16'),
(7, 10, 'UPDATE', '2024-04-23 05:50:28'),
(8, 11, 'UPDATE', '2024-04-23 05:52:30'),
(9, 12, 'UPDATE', '2024-04-23 05:53:21'),
(10, 13, 'UPDATE', '2024-04-23 05:55:04'),
(11, 13, 'UPDATE', '2024-04-23 05:55:27'),
(12, 14, 'UPDATE', '2024-04-23 05:56:23'),
(13, 15, 'UPDATE', '2024-04-23 05:58:20'),
(14, 15, 'UPDATE', '2024-04-23 05:59:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `role` varchar(255) DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `role`) VALUES
(1, 'isuri', '926735cf63e246adf29e97173c16ea0a3652987d38412d77e3b8348b41695250', 'isurisamaranayaka98@gmail.com', 'admin'),
(2, 'kumari', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'kumari@gmail.com', 'user'),
(4, 'rawee', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'rawee@gmail.com', 'user'),
(8, 'nimal', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'nimal@gmail.com', 'user');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `users_audit_trigger` AFTER UPDATE ON `users` FOR EACH ROW BEGIN
    INSERT INTO users_audit (user_id, action) VALUES (NEW.id, 'update');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users_audit`
--

CREATE TABLE `users_audit` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` varchar(50) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_audit`
--

INSERT INTO `users_audit` (`id`, `user_id`, `action`, `timestamp`) VALUES
(2, 4, 'update', '2024-04-19 08:50:12'),
(3, 2, 'update', '2024-04-19 08:50:31'),
(4, 4, 'update', '2024-04-19 08:50:47'),
(5, 1, 'update', '2024-04-23 06:15:54'),
(6, 2, 'update', '2024-04-23 06:16:17'),
(7, 1, 'update', '2024-04-24 03:37:13'),
(8, 2, 'update', '2024-04-24 03:37:21'),
(9, 2, 'update', '2024-04-24 03:51:45'),
(10, 2, 'update', '2024-04-24 03:51:50'),
(11, 4, 'update', '2024-04-24 03:54:10'),
(12, 8, 'update', '2024-04-24 03:54:12'),
(14, 1, 'update', '2024-04-24 04:17:39'),
(15, 1, 'update', '2024-04-24 04:17:43'),
(16, 1, 'update', '2024-04-24 04:17:44'),
(17, 1, 'update', '2024-04-24 04:17:45'),
(18, 1, 'update', '2024-04-24 04:17:48'),
(19, 1, 'update', '2024-04-24 04:17:52'),
(20, 1, 'update', '2024-04-24 04:17:53'),
(21, 1, 'update', '2024-04-24 04:17:57'),
(22, 1, 'update', '2024-04-24 04:18:10'),
(23, 2, 'update', '2024-04-24 04:20:27'),
(24, 4, 'update', '2024-04-24 04:20:30'),
(25, 8, 'update', '2024-04-24 04:20:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_ID`),
  ADD KEY `Supplier_ID` (`Supplier_ID`);

--
-- Indexes for table `product_audit`
--
ALTER TABLE `product_audit`
  ADD PRIMARY KEY (`Audit_ID`);

--
-- Indexes for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD PRIMARY KEY (`Order_ID`),
  ADD KEY `Supplier_ID` (`Supplier_ID`);

--
-- Indexes for table `purchase_order_audit`
--
ALTER TABLE `purchase_order_audit`
  ADD PRIMARY KEY (`Audit_ID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`Supplier_ID`);

--
-- Indexes for table `supplier_audit`
--
ALTER TABLE `supplier_audit`
  ADD PRIMARY KEY (`Audit_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_audit`
--
ALTER TABLE `users_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `Product_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `product_audit`
--
ALTER TABLE `product_audit`
  MODIFY `Audit_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `purchase_order`
--
ALTER TABLE `purchase_order`
  MODIFY `Order_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `purchase_order_audit`
--
ALTER TABLE `purchase_order_audit`
  MODIFY `Audit_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `Supplier_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `supplier_audit`
--
ALTER TABLE `supplier_audit`
  MODIFY `Audit_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users_audit`
--
ALTER TABLE `users_audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Supplier_ID`) REFERENCES `supplier` (`Supplier_ID`);

--
-- Constraints for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD CONSTRAINT `purchase_order_ibfk_1` FOREIGN KEY (`Supplier_ID`) REFERENCES `supplier` (`Supplier_ID`);

--
-- Constraints for table `users_audit`
--
ALTER TABLE `users_audit`
  ADD CONSTRAINT `fk_users_audit_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
