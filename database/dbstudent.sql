-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2023 at 11:14 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbstudent`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_student`
--

CREATE TABLE `tbl_student` (
  `ID` int(11) NOT NULL,
  `STUDENT_NO` decimal(50,0) DEFAULT NULL,
  `FULL_NAME` varchar(255) DEFAULT NULL,
  `DATE_OF_BIRTH` date DEFAULT NULL,
  `NIC_NAME` varchar(255) DEFAULT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `CLASS_ROOM_NO` varchar(255) DEFAULT NULL,
  `LEVEL_NAME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_student`
--

INSERT INTO `tbl_student` (`ID`, `STUDENT_NO`, `FULL_NAME`, `DATE_OF_BIRTH`, `NIC_NAME`, `ADDRESS`, `CLASS_ROOM_NO`, `LEVEL_NAME`) VALUES
(1, '1', 'ທ້າວ ຝ ', '1998-12-28', 'tt', 'tt', 'tt', 'ອານຸບານ 1'),
(7, '2', 'ນາງ ກ', '1999-12-28', 'Ming', 'Khoksivilay', 'ອານຸບານ 1/1', 'ອານຸບານ 1'),
(8, '3', 'ນາງ ຂ', '2000-12-28', 'Ming', 'Khoksivilay', 'ອານຸບານ 1/1', 'ອານຸບານ 1'),
(9, '4', 'ນາງ ຄ', '2001-12-28', 'Ming', 'Khoksivilay', 'ອານຸບານ 1/1', 'ອານຸບານ 1'),
(10, '4', 'ທ້າວ ສ', '1998-12-20', 'gg', 'gg', 'gg', 'ອານຸບານ 1'),
(26, '123', 'ທ້າວ ມ', '2009-10-02', 'tes', 'tes', 'tes', 'ອານຸບານ 2'),
(27, '123', 'ນາງ ພ', '2008-10-12', 'tes', 'tes', 'tes', 'ອານຸບານ 2'),
(28, '123', 'ທ້າວ ວ', '2007-10-12', 'tes', 'tes', 'tes', 'ອານຸບານ 3'),
(29, '123', 'ທ້າວ ອ', '2012-10-12', 'tes', 'tes', 'tes', 'ອານຸບານ 3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_student`
--
ALTER TABLE `tbl_student`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_student`
--
ALTER TABLE `tbl_student`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
