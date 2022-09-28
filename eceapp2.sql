-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 26, 2022 at 03:22 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eceapp2`
--

-- --------------------------------------------------------

--
-- Table structure for table `accidentReports`
--

CREATE TABLE `accidentReports` (
  `childID` int(10) NOT NULL,
  `childName` varchar(50) NOT NULL,
  `classID` int(10) NOT NULL,
  `accidentReport` text NOT NULL,
  `teacherName` varchar(50) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `adminID` int(10) NOT NULL,
  `adminName` varchar(50) NOT NULL,
  `adminEmail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`adminID`, `adminName`, `adminEmail`) VALUES
(1, 'Cherry Proust', ''),
(2, 'Selena Abbott', '');

-- --------------------------------------------------------

--
-- Table structure for table `children`
--

CREATE TABLE `children` (
  `childID` int(11) NOT NULL,
  `childName` varchar(50) NOT NULL,
  `childAge` int(2) NOT NULL,
  `classID` int(2) NOT NULL,
  `className` varchar(30) NOT NULL,
  `parentName` varchar(50) NOT NULL,
  `parentEmail` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `children`
--

INSERT INTO `children` (`childID`, `childName`, `childAge`, `classID`, `className`, `parentName`, `parentEmail`) VALUES
(1, 'Samuel Jones', 3, 3, '', '', '0'),
(2, 'Casey Klein', 4, 3, '', '', '0'),
(3, 'Danny Young', 2, 2, '', '', '0'),
(4, 'Sheila Kent', 4, 3, '', '', '0'),
(5, 'Brandon Henry', 2, 2, '', '', '0'),
(6, 'Perry Klein', 1, 1, '', '', '0'),
(7, 'Kelly Jones', 2, 1, '', '', '0');

-- --------------------------------------------------------

--
-- Table structure for table `classCategories`
--

CREATE TABLE `classCategories` (
  `categoryID` int(2) NOT NULL,
  `categoryName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `classCategories`
--

INSERT INTO `classCategories` (`categoryID`, `categoryName`) VALUES
(1, 'Babies'),
(2, 'Toddlers'),
(3, 'Preschool');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `classID` int(2) NOT NULL,
  `classCategoryID` int(2) NOT NULL,
  `className` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`classID`, `classCategoryID`, `className`) VALUES
(1, 1, 'Babies Room '),
(2, 2, 'Toddlers Room'),
(3, 3, 'Preschool Room');

-- --------------------------------------------------------

--
-- Table structure for table `dailyMeals`
--

CREATE TABLE `dailyMeals` (
  `childID` int(2) NOT NULL,
  `mealTypeID` int(2) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dailyMeals`
--

INSERT INTO `dailyMeals` (`childID`, `mealTypeID`, `description`) VALUES
(1, 1, 'Milk, oats, banana'),
(1, 2, 'egg sandwich, orange juice'),
(1, 3, 'apples & pears'),
(2, 1, 'egg, milk'),
(2, 2, 'spaghetti'),
(2, 3, 'scones, apple juice'),
(3, 1, 'porridge'),
(3, 2, 'peanut butter & jelly sandwich'),
(3, 3, 'biscuits and lemon juice');

-- --------------------------------------------------------

--
-- Table structure for table `mealTypes`
--

CREATE TABLE `mealTypes` (
  `mealTypeID` int(2) NOT NULL,
  `mealNAME` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mealTypes`
--

INSERT INTO `mealTypes` (`mealTypeID`, `mealNAME`) VALUES
(1, 'Morning Tea'),
(2, 'Lunch'),
(3, 'Afternoon Tea');

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

CREATE TABLE `parents` (
  `parentID` int(11) NOT NULL,
  `parentName` varchar(30) NOT NULL,
  `childID` int(11) NOT NULL,
  `parentPhone` varchar(30) NOT NULL,
  `parentEmail` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parents`
--

INSERT INTO `parents` (`parentID`, `parentName`, `childID`, `parentPhone`, `parentEmail`) VALUES
(1, 'Paul Jones', 1, '0210 111 1111', 'pauljones@gmail.com'),
(2, 'Nancy Klein', 2, '09 780 0000', 'nklein@gmail.com'),
(3, 'Cynthia Young', 3, '021 012 3333', 'cynyou@yahoo.com'),
(4, 'John Kent', 4, '0', 'jknt@gmail.com'),
(5, 'Cliff Henry', 5, '0', 'cliffh2002@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `sleepLogs`
--

CREATE TABLE `sleepLogs` (
  `childID` int(10) NOT NULL,
  `childName` varchar(50) NOT NULL,
  `classID` int(2) NOT NULL,
  `teacherName` varchar(30) NOT NULL,
  `sleepLog` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `teacherID` int(2) NOT NULL,
  `teacherName` varchar(50) NOT NULL,
  `classID` int(2) NOT NULL,
  `teacherEmail` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`teacherID`, `teacherName`, `classID`, `teacherEmail`) VALUES
(1, '', 1, ''),
(2, '', 1, ''),
(3, '', 2, ''),
(4, '', 2, ''),
(5, '', 3, ''),
(6, '', 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `username`
--

CREATE TABLE `username` (
  `password` varchar(30) NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accidentReports`
--
ALTER TABLE `accidentReports`
  ADD PRIMARY KEY (`childID`),
  ADD UNIQUE KEY `classID` (`classID`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`adminID`);

--
-- Indexes for table `children`
--
ALTER TABLE `children`
  ADD PRIMARY KEY (`childID`),
  ADD KEY `child id` (`childID`);

--
-- Indexes for table `classCategories`
--
ALTER TABLE `classCategories`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`classID`);

--
-- Indexes for table `mealTypes`
--
ALTER TABLE `mealTypes`
  ADD PRIMARY KEY (`mealTypeID`);

--
-- Indexes for table `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`parentID`),
  ADD UNIQUE KEY `parentName` (`parentName`),
  ADD KEY `child Id` (`childID`);

--
-- Indexes for table `sleepLogs`
--
ALTER TABLE `sleepLogs`
  ADD PRIMARY KEY (`childID`),
  ADD UNIQUE KEY `classID` (`classID`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacherID`),
  ADD KEY `classID` (`classID`);

--
-- Indexes for table `username`
--
ALTER TABLE `username`
  ADD PRIMARY KEY (`password`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `adminID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `children`
--
ALTER TABLE `children`
  MODIFY `childID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `classCategories`
--
ALTER TABLE `classCategories`
  MODIFY `categoryID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `classID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mealTypes`
--
ALTER TABLE `mealTypes`
  MODIFY `mealTypeID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `parents`
--
ALTER TABLE `parents`
  MODIFY `parentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacherID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accidentReports`
--
ALTER TABLE `accidentReports`
  ADD CONSTRAINT `accidentreports_ibfk_1` FOREIGN KEY (`childID`) REFERENCES `children` (`childID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `accidentreports_ibfk_2` FOREIGN KEY (`classID`) REFERENCES `classes` (`classID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`adminID`) REFERENCES `teachers` (`teacherID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`classID`) REFERENCES `teachers` (`teacherID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `parents`
--
ALTER TABLE `parents`
  ADD CONSTRAINT `parents_ibfk_1` FOREIGN KEY (`childID`) REFERENCES `CHILD` (`child Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `parents_ibfk_2` FOREIGN KEY (`parentID`) REFERENCES `children` (`childID`) ON DELETE CASCADE;

--
-- Constraints for table `sleepLogs`
--
ALTER TABLE `sleepLogs`
  ADD CONSTRAINT `sleeplogs_ibfk_1` FOREIGN KEY (`childID`) REFERENCES `children` (`childID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sleeplogs_ibfk_2` FOREIGN KEY (`classID`) REFERENCES `classes` (`classID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`teacherID`) REFERENCES `children` (`childID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `username`
--
ALTER TABLE `username`
  ADD CONSTRAINT `username_ibfk_1` FOREIGN KEY (`username`) REFERENCES `parents` (`parentName`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
