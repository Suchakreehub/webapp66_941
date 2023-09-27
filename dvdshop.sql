-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2023 at 12:58 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dvdshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `actors`
--

CREATE TABLE `actors` (
  `actor_id` int(11) NOT NULL,
  `actor_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `actors`
--

INSERT INTO `actors` (`actor_id`, `actor_name`) VALUES
(100, 'เท่ง เถิดเทิง'),
(101, 'จาตุรงค์ มกจ๊ก');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `memid` int(3) NOT NULL,
  `memname` varchar(20) NOT NULL,
  `memlastname` varchar(30) NOT NULL,
  `memaddress` varchar(50) NOT NULL,
  `memtele` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`memid`, `memname`, `memlastname`, `memaddress`, `memtele`) VALUES
(100, 'nakarin', 'pichaichuang', 'minburi', '11111'),
(101, 'Chanin​', 'imjinda​ ', 'bkkASD', '0943178795');

-- --------------------------------------------------------

--
-- Table structure for table `dvd`
--

CREATE TABLE `dvd` (
  `dvdid` int(3) NOT NULL,
  `dvdname` varchar(20) NOT NULL,
  `dvdstudio` varchar(30) NOT NULL,
  `dvdgenre` varchar(15) NOT NULL,
  `dvdprice` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dvd`
--

INSERT INTO `dvd` (`dvdid`, `dvdname`, `dvdstudio`, `dvdgenre`, `dvdprice`) VALUES
(100, 'หอแต๋วแตก', 'พระนครฟิลม์', 'ตลก', 50),
(101, 'หลวงพี่เท่ง', 'พระนครฟิลม์', 'ตลกศาสนา', 80),
(102, '7 ประจัญบาน', '	สหมงคลฟิล์ม อินเตอร์เนชั่นแนล', ' บู๊ ตลก ', 100);

-- --------------------------------------------------------

--
-- Table structure for table `movie_actor`
--

CREATE TABLE `movie_actor` (
  `movie_actor_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL,
  `dvdid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movie_actor`
--

INSERT INTO `movie_actor` (`movie_actor_id`, `actor_id`, `dvdid`) VALUES
(100, 100, 101),
(101, 101, 100),
(102, 101, 101),
(103, 100, 102);

-- --------------------------------------------------------

--
-- Table structure for table `sellhistory`
--

CREATE TABLE `sellhistory` (
  `sellid` int(3) NOT NULL,
  `dvdid` int(3) NOT NULL,
  `memid` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sellhistory`
--

INSERT INTO `sellhistory` (`sellid`, `dvdid`, `memid`) VALUES
(100, 100, 100),
(101, 100, 101);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`actor_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`memid`);

--
-- Indexes for table `dvd`
--
ALTER TABLE `dvd`
  ADD PRIMARY KEY (`dvdid`);

--
-- Indexes for table `movie_actor`
--
ALTER TABLE `movie_actor`
  ADD PRIMARY KEY (`movie_actor_id`),
  ADD KEY `actor_id` (`actor_id`),
  ADD KEY `dvdid` (`dvdid`);

--
-- Indexes for table `sellhistory`
--
ALTER TABLE `sellhistory`
  ADD PRIMARY KEY (`sellid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actors`
--
ALTER TABLE `actors`
  MODIFY `actor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `movie_actor`
--
ALTER TABLE `movie_actor`
  MODIFY `movie_actor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `movie_actor`
--
ALTER TABLE `movie_actor`
  ADD CONSTRAINT `movie_actor_ibfk_1` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`actor_id`),
  ADD CONSTRAINT `movie_actor_ibfk_2` FOREIGN KEY (`dvdid`) REFERENCES `dvd` (`dvdid`);

--
-- Constraints for table `sellhistory`
--
ALTER TABLE `sellhistory`
  ADD CONSTRAINT `test` FOREIGN KEY (`dvdid`) REFERENCES `dvd` (`dvdid`),
  ADD CONSTRAINT `test1` FOREIGN KEY (`memid`) REFERENCES `customer` (`memid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
