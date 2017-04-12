-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2017 at 03:08 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `priceshareddb`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `catID` int(11) NOT NULL,
  `catName` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categorydetail`
--

CREATE TABLE `categorydetail` (
  `catDeID` int(11) NOT NULL,
  `catID` int(11) NOT NULL,
  `catDeName` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cusID` int(11) NOT NULL,
  `cusName` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cusStatus` int(11) NOT NULL COMMENT '[admin 1, normal 0]',
  `cusUser` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cusPass` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cusEmail` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cusID`, `cusName`, `cusStatus`, `cusUser`, `cusPass`, `cusEmail`) VALUES
(1, 'kuy', 0, 'ooo', '81dc9bdb52d04dc2036d', 'k@gmail.com'),
(2, 's', 0, 'test', '81dc9bdb52d04dc2036d', 's@gmail.com'),
(3, 'ad', 0, 'admin', '21232f297a57a5a743894ae4a801fc3', 'admin@gmail.com'),
(4, 'sad', 0, 't', '81dc9bdb52d04dc2036dbd8313ed055', 'g@gmail.com'),
(5, 'sad', 0, 't', '81dc9bdb52d04dc2036dbd8313ed055', 'g@gmail.com'),
(6, 'www', 0, 'www', '4eae35f1b35977a0ebd8086c259d4c9', 'www'),
(7, 'w5', 0, 'w5', '236a1e1bc4bcd315d6bad55fee5923c', 'w5');

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `imageID` int(11) NOT NULL,
  `proID` int(11) NOT NULL,
  `imagePath` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `imageDes` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `proID` int(11) NOT NULL,
  `proName` varchar(20) NOT NULL,
  `catDeID` int(11) NOT NULL,
  `proDes` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `proDisplay` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `productdetail`
--

CREATE TABLE `productdetail` (
  `proDeID` int(11) NOT NULL,
  `proID` int(11) NOT NULL,
  `proDePrice` double NOT NULL,
  `proDeDes` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `supID` int(11) NOT NULL,
  `cusID` int(11) NOT NULL,
  `proDeScore` float NOT NULL,
  `proDeDate` date NOT NULL,
  `proDeStatus` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supID` int(11) NOT NULL,
  `supName` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplierdetail`
--

CREATE TABLE `supplierdetail` (
  `supDeID` int(11) NOT NULL,
  `supID` int(11) NOT NULL,
  `supDeLa` double NOT NULL,
  `supDeLong` double NOT NULL,
  `supDeDes` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`catID`);

--
-- Indexes for table `categorydetail`
--
ALTER TABLE `categorydetail`
  ADD PRIMARY KEY (`catDeID`),
  ADD KEY `catID_FK` (`catID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cusID`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`imageID`),
  ADD KEY `proID_FK` (`proID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`proID`),
  ADD KEY `catDeID_FK` (`catDeID`);

--
-- Indexes for table `productdetail`
--
ALTER TABLE `productdetail`
  ADD PRIMARY KEY (`proDeID`),
  ADD KEY `proID_FKs` (`proID`),
  ADD KEY `supID_FKs` (`supID`),
  ADD KEY `cusID_FKs` (`cusID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supID`);

--
-- Indexes for table `supplierdetail`
--
ALTER TABLE `supplierdetail`
  ADD PRIMARY KEY (`supDeID`),
  ADD KEY `supID_FK` (`supID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `catID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `categorydetail`
--
ALTER TABLE `categorydetail`
  MODIFY `catDeID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cusID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `imageID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `proID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `productdetail`
--
ALTER TABLE `productdetail`
  MODIFY `proDeID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `supplierdetail`
--
ALTER TABLE `supplierdetail`
  MODIFY `supDeID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `categorydetail`
--
ALTER TABLE `categorydetail`
  ADD CONSTRAINT `catID_FK` FOREIGN KEY (`catID`) REFERENCES `category` (`catID`);

--
-- Constraints for table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `proID_FK` FOREIGN KEY (`proID`) REFERENCES `product` (`proID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `catDeID_FK` FOREIGN KEY (`catDeID`) REFERENCES `categorydetail` (`catDeID`);

--
-- Constraints for table `productdetail`
--
ALTER TABLE `productdetail`
  ADD CONSTRAINT `cusID_FKs` FOREIGN KEY (`cusID`) REFERENCES `customer` (`cusID`),
  ADD CONSTRAINT `supID_FKs` FOREIGN KEY (`supID`) REFERENCES `supplier` (`supID`);

--
-- Constraints for table `supplierdetail`
--
ALTER TABLE `supplierdetail`
  ADD CONSTRAINT `supID_FK` FOREIGN KEY (`supID`) REFERENCES `supplier` (`supID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
