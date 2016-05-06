-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2016 at 07:22 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cmpe275onlineordering`
--

-- --------------------------------------------------------

--
-- Table structure for table `menuitem`
--

CREATE TABLE IF NOT EXISTS `menuitem` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `unitprice` varchar(255) NOT NULL,
  `calories` varchar(255) NOT NULL,
  `preptime` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `picture` tinyblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menuitem`
--

INSERT INTO `menuitem` (`id`, `category`, `unitprice`, `calories`, `preptime`, `name`, `picture`) VALUES
(1, 'drink', '10', '100', '1', 'coke', 0x89504e470d0a1a0a0000000d4948445200000271000001ba0806000000674a10d2000000017352474200aece1ce90000000467414d410000b18f0bfc6105000000097048597300000ec300000ec301c76fa8640000333c49444154785eed9d799454f5b5a8f9e7adf7fec85aefad75dfbd199d23cad040d14c4210918012739d70eaa849d45c6f621c2e060788ad46710045c51071827e71c0892888188c806915d028a012073261663589f1de98f966ed57fb549de657a7f6a93ecdb8ab7fdfb7d617baea0c75aabadce7cbe9a9cfaf7ffd6b79f3cd37e5073ff881fcfdef7f4744444444c7ce9f3f5f6ebffd76e9f38b5ffc427ef4a31fc9f7bffffd6401),
(2, 'drink', '11', '111', '12', 'ice tea', 0x89504e470d0a1a0a0000000d4948445200000269000001b6080600000024f111b5000000017352474200aece1ce90000000467414d410000b18f0bfc6105000000097048597300000ec300000ec301c76fa864000034dd49444154785eed9d699894e59daffd72ae733e9c6fe7dbb9c693d9e2984c167bd0445444161150144481261a75d4b8c4b8c48520b646892222208ba261b415e3128240e28e0a342a8b38594ccce864217bd424c6996c936472fdcff3bc556ff356f5ef5f5403d2cf43dff775ddd355f5aeb5f07f6fab217380010000004052fcf9cf7f3637d25efbe19bf69517be69dd8f6fed97719bb82d00000000ec1e2d236d4dcfd7edd57fff),
(11, 'desert', '10', '400', '15', 'chocolate fudge', 0x89504e470d0a1a0a0000000d4948445200000269000001b6080600000024f111b5000000017352474200aece1ce90000000467414d410000b18f0bfc6105000000097048597300000ec300000ec301c76fa864000034dd49444154785eed9d699894e59daffd72ae733e9c6fe7dbb9c693d9e2984c167bd0445444161150144481261a75d4b8c4b8c48520b646892222208ba261b415e3128240e28e0a342a8b38594ccce864217bd424c6996c936472fdcff3bc556ff356f5ef5f5403d2cf43dff775ddd355f5aeb5f07f6fab217380010000004052fcf9cf7f3637d25efbe19bf69517be69dd8f6fed97719bb82d00000000ec1e2d236d4dcfd7edd57fff),
(21, 'appetizer', '12', '100', '12', 'spring rolls', 0x89504e470d0a1a0a0000000d4948445200000269000001b6080600000024f111b5000000017352474200aece1ce90000000467414d410000b18f0bfc6105000000097048597300000ec300000ec301c76fa864000034dd49444154785eed9d699894e59daffd72ae733e9c6fe7dbb9c693d9e2984c167bd0445444161150144481261a75d4b8c4b8c48520b646892222208ba261b415e3128240e28e0a342a8b38594ccce864217bd424c6996c936472fdcff3bc556ff356f5ef5f5403d2cf43dff775ddd355f5aeb5f07f6fab217380010000004052fcf9cf7f3637d25efbe19bf69517be69dd8f6fed97719bb82d00000000ec1e2d236d4dcfd7edd57fff),
(31, 'main course', '5', '300', '10', 'brown rice', 0x89504e470d0a1a0a0000000d4948445200000271000001ba0806000000674a10d2000000017352474200aece1ce90000000467414d410000b18f0bfc6105000000097048597300000ec300000ec301c76fa8640000333c49444154785eed9d799454f5b5a8f9e7adf7fec85aefad75dfbd199d23cad040d14c4210918012739d70eaa849d45c6f621c2e060788ad46710045c51071827e71c0892888188c806915d028a012073261663589f1de98f966ed57fb549de657a7f6a93ecdb8ab7fdfb7d617baea0c75aabadce7cbe9a9cfaf7ffd6b79f3cd37e5073ff881fcfdef7f4744444444c7ce9f3f5f6ebffd76e9f38b5ffc427ef4a31fc9f7bffffd6401);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `userid` int(11) NOT NULL,
  `menuid` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`userid`, `menuid`, `orderid`, `quantity`, `status`) VALUES
(10, 1, 101, 1, 'unplaced'),
(10, 11, 101, 1, 'unplaced'),
(11, 21, 102, 1, 'unplaced');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE IF NOT EXISTS `schedule` (
  `chefid` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `busystarttime` int(11) NOT NULL,
  `busyendtime` int(11) NOT NULL,
  `date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`chefid`, `orderid`, `busystarttime`, `busyendtime`, `date`) VALUES
(1, 101, 540, 600, '2016-05-03'),
(1, 102, 650, 800, '2016-05-03'),
(1, 103, 900, 910, '2016-05-03'),
(1, 104, 910, 920, '2016-05-03'),
(1, 101, 1000, 1020, '2016-05-05'),
(1, 999, 490, 600, '2016-05-11'),
(1, 105, 650, 700, '2016-05-11');

-- --------------------------------------------------------

--
-- Table structure for table `tempuser`
--

CREATE TABLE IF NOT EXISTS `tempuser` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usercredentials`
--

CREATE TABLE IF NOT EXISTS `usercredentials` (
  `user_id` int(5) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `address` varchar(75) NOT NULL,
  `phone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usercredentials`
--

INSERT INTO `usercredentials` (`user_id`, `email`, `password`, `fullname`, `address`, `phone`) VALUES
(1, 'sj@gmail.com', 'abcd', 'shagun juneja', 'abcde abcde', '12345');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menuitem`
--
ALTER TABLE `menuitem`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`userid`,`menuid`,`orderid`);

--
-- Indexes for table `usercredentials`
--
ALTER TABLE `usercredentials`
  ADD PRIMARY KEY (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
