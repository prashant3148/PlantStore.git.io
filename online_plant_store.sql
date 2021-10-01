-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 30, 2021 at 01:47 PM
-- Server version: 8.0.21
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_plant_store`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllInfo` ()  BEGIN
    SELECT product_id, product_name, product_price, product_image, product_description, product_stock FROM product;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `audit_users`
--

CREATE TABLE `audit_users` (
  `user_id` int NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `action_performed` varchar(400) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `audit_users`
--

INSERT INTO `audit_users` (`user_id`, `user_name`, `action_performed`, `date_added`) VALUES
(2, 'piyush', 'Inserted a new user', '2021-01-19 19:14:38'),
(3, 'raj', 'Inserted a new user', '2021-02-04 23:44:02'),
(4, 'abcd', 'Inserted a new user', '2021-02-05 13:28:54');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_id` int UNSIGNED NOT NULL,
  `city_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `city_name`) VALUES
(1, 'Mumbai'),
(2, 'Delhi'),
(3, 'Chennai'),
(4, 'Bangalore'),
(5, 'Varanasi'),
(6, 'Kolkata');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `company_name`, `company_image`) VALUES
(1, 'Agricutural', '1.jpeg'),
(2, 'Lettuce', 'Lettuce.jpeg'),
(3, 'Tata Flower', 'Flower Seeds.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` int NOT NULL,
  `country_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `country_name`) VALUES
(1, 'India'),
(2, 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `month`
--

CREATE TABLE `month` (
  `month_id` int NOT NULL,
  `month_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `month`
--

INSERT INTO `month` (`month_id`, `month_name`) VALUES
(1, 'January'),
(2, 'February'),
(3, 'March'),
(4, 'April'),
(5, 'May'),
(6, 'June'),
(7, 'July'),
(8, 'August'),
(9, 'September'),
(10, 'October'),
(11, 'November'),
(12, 'December');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int NOT NULL,
  `order_user_id` varchar(255) NOT NULL,
  `order_date` varchar(255) NOT NULL,
  `order_amount` varchar(255) NOT NULL,
  `order_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`order_id`, `order_user_id`, `order_date`, `order_amount`, `order_status`) VALUES
(1, '2', '10 January,2020 05:32:32 PM', '200', 'Confirmed'),
(2, '2', '10 January,2020 05:33:08 PM', '200', 'Confirmed'),
(3, '2', '10 January,2020 05:34:04 PM', '1170', 'Confirmed'),
(4, '2', '10 January,2020 05:38:26 PM', '1100', 'Confirmed'),
(5, '2', '10 January,2020 05:48:36 PM', '4540', 'Confirmed'),
(6, '2', '10 January,2020 05:52:49 PM', '7140', 'Confirmed'),
(7, '2', '10 January,2020 05:57:06 PM', '4640', 'Confirmed'),
(8, '2', '10 January,2020 06:49:22 PM', '5840', 'Confirmed'),
(9, '2', '15 January,2020 05:19:29 PM', '12000', 'Confirmed'),
(10, '2', '17 January,2020 02:27:35 PM', '200', 'Confirmed'),
(11, '2', '19 January,2020 07:09:29 PM', '200', 'Confirmed'),
(18, '11', '14 January,2021 07:05:33 PM', '450', 'Confirmed'),
(19, '11', '14 January,2021 07:10:15 PM', '200', 'Confirmed'),
(20, '10', '15 January,2021 07:08:22 AM', '800', 'Confirmed'),
(21, '11', '18 January,2021 05:58:24 AM', '0', 'Confirmed'),
(22, '14', '19 January,2021 12:30:31 PM', '200', 'Confirmed'),
(23, '14', '19 January,2021 12:37:04 PM', '850', 'Confirmed'),
(24, '11', '19 January,2021 02:26:44 PM', '200', 'Confirmed'),
(25, '11', '20 January,2021 06:47:52 AM', '220', 'Confirmed'),
(26, '18', '05 February,2021 08:59:56 AM', '-250', 'Confirmed');

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `oi_id` int NOT NULL,
  `oi_order_id` int NOT NULL,
  `oi_product_id` int NOT NULL,
  `oi_price_per_unit` varchar(255) NOT NULL,
  `oi_cart_quantity` varchar(255) NOT NULL,
  `oi_total` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`oi_id`, `oi_order_id`, `oi_product_id`, `oi_price_per_unit`, `oi_cart_quantity`, `oi_total`) VALUES
(2, 13, 1, '200', '1', '200'),
(3, 13, 4, '1170', '1', '1170'),
(4, 13, 5, '1170', '1', '1170'),
(8, 1, 3, '1170', '1', '1170'),
(9, 2, 4, '1170', '1', '1170'),
(10, 3, 3, '1170', '1', '1170'),
(11, 4, 2, '1100', '1', '1100'),
(12, 5, 2, '1100', '2', '1100'),
(13, 5, 4, '1170', '2', '1170'),
(14, 6, 3, '1170', '1', '1170'),
(17, 6, 7, '1200', '1', '1200'),
(18, 6, 8, '1200', '1', '1200'),
(19, 6, 8, '1200', '1', '1200'),
(20, 6, 4, '1170', '1', '1170'),
(21, 6, 8, '1200', '1', '1200'),
(22, 7, 6, '1170', '1', '1170'),
(23, 7, 7, '1200', '1', '1200'),
(25, 7, 4, '1170', '1', '1170'),
(26, 7, 2, '1100', '1', '1100'),
(27, 8, 2, '1100', '1', '1100'),
(28, 8, 6, '1170', '1', '1170'),
(29, 8, 3, '1170', '1', '1170'),
(30, 8, 1, '1200', '1', '1200'),
(31, 8, 8, '1200', '1', '1200'),
(35, 9, 1, '12000', '1', '12000'),
(36, 10, 1, '200', '1', '200'),
(37, 11, 1, '200', '1', '200'),
(38, 12, 1, '200', '1', '200'),
(40, 14, 1, '200', '1', '200'),
(41, 15, 1, '200', '1', '200'),
(42, 16, 9, '400', '1', '400'),
(43, 17, 3, '500', '1', '500'),
(44, 18, 2, '450', '1', '450'),
(45, 19, 1, '200', '1', '200'),
(46, 20, 2, '450', '1', '450'),
(47, 20, 7, '350', '1', '350'),
(49, 22, 1, '200', '1', '200'),
(50, 23, 1, '200', '1', '200'),
(51, 23, 1, '200', '1', '200'),
(52, 23, 2, '450', '1', '450'),
(53, 24, 1, '200', '1', '200'),
(54, 25, 6, '220', '1', '220'),
(55, 26, 4, '250', '-1', '250');

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `os_id` int NOT NULL,
  `os_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`os_id`, `os_title`) VALUES
(1, 'Confirmed'),
(2, 'Processing'),
(3, 'Packed'),
(4, 'Dispatched');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type_id` int NOT NULL,
  `product_company_id` int NOT NULL,
  `product_price` varchar(255) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `product_stock` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_type_id`, `product_company_id`, `product_price`, `product_image`, `product_description`, `product_stock`) VALUES
(1, 'Vegetable Plants', 2, 1, '200', 'zukur seeds.jpeg', 'It is a vegetable plant found in regions of red soil.', '12'),
(2, 'Native Plant', 1, 1, '450', 'native plant.png', 'Plant', '95'),
(3, 'Ecom', 4, 2, '500', 'ecom.jpeg', 'Plant', '200'),
(4, 'Bog Plant', 4, 1, '250', 'bog plant.jpg', 'Plant', '90'),
(5, 'Orange Star', 1, 3, '300', 'orange-star plant.jpg', 'Plant', '16'),
(6, 'Star Plant', 2, 1, '220', 'Ornamental Grass.jpg', 'Plant', '17'),
(7, 'Aqarium', 2, 3, '350', 'aqarium plant.jpg', 'Plant', '98'),
(8, 'Outdoors', 1, 2, '250', 'outdoors plant.jpg', 'Plant', '100'),
(9, 'Indoor House', 3, 2, '400', 'indoor-house-plants-.jpg', 'Plant', '10'),
(10, 'Ornamental Grass', 3, 3, '180', 'Ornamental Grass.jpg', 'Plant', '12');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int NOT NULL,
  `role_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role_name`) VALUES
(1, 'Admin'),
(2, 'Customer');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `state_id` int NOT NULL,
  `state_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`state_id`, `state_name`) VALUES
(1, 'Maharastra'),
(2, 'Gujrat'),
(3, 'Bihar'),
(4, 'Uttar Pradesh'),
(5, 'Delhi'),
(6, 'Haryana');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `type_id` int NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `type_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`type_id`, `type_name`, `type_image`) VALUES
(1, 'Flower', 'flower seeds.jpeg'),
(2, 'Vegetable', 'vegetable.jpeg'),
(3, 'Grain', 'grain seeds.jpeg'),
(4, 'Organic Seeds\r\n', '3.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `user_level_id` varchar(255) DEFAULT NULL,
  `user_username` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_add1` varchar(255) NOT NULL,
  `user_add2` varchar(255) NOT NULL,
  `user_city` varchar(255) NOT NULL,
  `user_state` varchar(255) NOT NULL,
  `user_country` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_mobile` varchar(255) NOT NULL,
  `user_gender` varchar(255) NOT NULL,
  `user_dob` varchar(255) NOT NULL,
  `user_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_level_id`, `user_username`, `user_password`, `user_name`, `user_add1`, `user_add2`, `user_city`, `user_state`, `user_country`, `user_email`, `user_mobile`, `user_gender`, `user_dob`, `user_image`) VALUES
(2, '2', 'customer', 'test', 'Amit Kumar', 'House no : 768', 'Sector 2B', 'asdf', 'asdf', 'asdfsadf', 'amit@gmail.com', '5774688448', '', '26 December,2015', 'p2.jpg'),
(8, '2', 'cook', 'test', 'Suman Singh', 'House no : 767', 'Sector 2A', '1', '2', '1', 'suman@gmail.com', '987654367546', '', '13 January,1961', 'p3.jpg'),
(9, '2', 'raju', 'test', 'Arun Kumar', 'House no : 768', 'Sector 2A', '1', '1', '1', 'raju@gmail.com', '9876553809', '', '12 january, 2013', 'p4.jpg'),
(10, '2', 'parneet', 'test', 'parneet', 'New Delhi', 'India', '2', '2', '1', 'parneet@gmail.com', '976433886543', '', '18 January,1968', 'p5.jpg'),
(11, '2', 'rishu', 'test', 'Rishu Raj', 'Sector 120', 'Circel Road', '2', '5', '1', 'coolduderishuraj@gmail.com', '9771968292', '', '05 August,2000', 'amit.png'),
(14, '2', 'parool', 'test', 'parul', 'deefe', 'dfdfd', '6', '2', '2', 'nfjhfh@gmail.com', '759786', '', '24 March,1999', ''),
(16, '2', 'piyush', 'test', 'piyush', 'gyftdc', 'hgftd', '2', '5', '1', 'piyush@gmail.com', '7642689754', '', '15 March,2000', ''),
(17, '2', 'raj', 'test', 'raj', 'abc', 'xyz', '2', '5', '1', 'raj@gmail.comi', '6457885678', '', '7 March,2000', ''),
(18, '2', 'abcd', 'abc', 'abcd', 'soladevanahalli', 'bangalore', '2', '5', '1', 'abcd@gmail.com', '54546777', '', '5 August,2000', 'Rishu_Raj - Copy.jpg');

--
-- Triggers `user`
--
DELIMITER $$
CREATE TRIGGER `before_user_insert` BEFORE INSERT ON `user` FOR EACH ROW BEGIN

    INSERT INTO audit_users

    SET action_performed  = 'Inserted a new user',

    user_name       =  new.user_username;


END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_users`
--
ALTER TABLE `audit_users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `month`
--
ALTER TABLE `month`
  ADD PRIMARY KEY (`month_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`oi_id`),
  ADD KEY `fk_order_item_product` (`oi_product_id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`os_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_product_type_id` (`product_type_id`),
  ADD KEY `fk_product_company_id` (`product_company_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_users`
--
ALTER TABLE `audit_users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `month`
--
ALTER TABLE `month`
  MODIFY `month_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `oi_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `os_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `state_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `type_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `fk_order_item_product` FOREIGN KEY (`oi_product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_company_id` FOREIGN KEY (`product_company_id`) REFERENCES `company` (`company_id`),
  ADD CONSTRAINT `fk_product_type_id` FOREIGN KEY (`product_type_id`) REFERENCES `type` (`type_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
