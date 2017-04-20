-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2017 at 07:52 AM
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
  `catID` int(11) UNSIGNED ZEROFILL NOT NULL,
  `catName` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`catID`, `catName`) VALUES
(00000000001, 'Technology'),
(00000000002, 'Fashion'),
(00000000003, 'Food'),
(00000000004, 'GAME&TOY');

-- --------------------------------------------------------

--
-- Table structure for table `categorydetail`
--

CREATE TABLE `categorydetail` (
  `catDeID` int(11) UNSIGNED ZEROFILL NOT NULL,
  `catID` int(11) UNSIGNED ZEROFILL NOT NULL,
  `catDeName` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categorydetail`
--

INSERT INTO `categorydetail` (`catDeID`, `catID`, `catDeName`) VALUES
(00000000001, 00000000001, 'Phone'),
(00000000002, 00000000002, 'Shoes'),
(00000000003, 00000000001, 'Accessory'),
(00000000004, 00000000003, 'Beverage');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cusID` int(11) UNSIGNED ZEROFILL NOT NULL,
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
(00000000001, 'kuy', 0, 'ooo', '81dc9bdb52d04dc2036d', 'k@gmail.com'),
(00000000002, 's', 0, 'test', '81dc9bdb52d04dc2036d', 's@gmail.com'),
(00000000004, 'sad', 0, 't', '81dc9bdb52d04dc2036dbd8313ed055', 'g@gmail.com'),
(00000000005, 'sad', 0, 't', '81dc9bdb52d04dc2036dbd8313ed055', 'g@gmail.com'),
(00000000006, 'www', 0, 'www', '4eae35f1b35977a0ebd8086c259d4c9', 'www'),
(00000000007, 'w5', 0, 'w5', '236a1e1bc4bcd315d6bad55fee5923c', 'w5'),
(00000000009, 'admi', 0, 'admi', '60eb0f73e33ce3ffd4e51d974447db53', 'admi'),
(00000000010, 'admin', 0, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(00000000011, '', 0, '', 'd41d8cd98f00b204e9800998ecf8427e', ''),
(00000000012, '', 0, '', 'd41d8cd98f00b204e9800998ecf8427e', '');

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `imageID` int(11) UNSIGNED ZEROFILL NOT NULL,
  `proID` int(11) UNSIGNED ZEROFILL NOT NULL,
  `imagePath` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `imageDes` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `proID` int(11) UNSIGNED ZEROFILL NOT NULL,
  `proName` varchar(20) NOT NULL,
  `catDeID` int(11) UNSIGNED ZEROFILL NOT NULL,
  `proDes` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `proDisplay` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`proID`, `proName`, `catDeID`, `proDes`, `proDisplay`) VALUES
(00000000001, 'IPHONE7', 00000000001, 'ไอโฟน7 ขนาดความจุ 64GB รองรับ wifi ac', 'img/iphone7.png'),
(00000000002, 'Thai Denmark', 00000000004, 'นมโค', 'img/thai_denmark.JPEG');

-- --------------------------------------------------------

--
-- Table structure for table `productdetail`
--

CREATE TABLE `productdetail` (
  `proDeID` int(11) UNSIGNED ZEROFILL NOT NULL,
  `proID` int(11) UNSIGNED ZEROFILL NOT NULL,
  `proDePrice` double NOT NULL,
  `proDeDes` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `supDeID` int(11) UNSIGNED ZEROFILL NOT NULL,
  `cusID` int(11) UNSIGNED ZEROFILL NOT NULL,
  `proDeScore` float NOT NULL DEFAULT '0',
  `proDeDate` date NOT NULL,
  `proDeStatus` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productdetail`
--

INSERT INTO `productdetail` (`proDeID`, `proID`, `proDePrice`, `proDeDes`, `supDeID`, `cusID`, `proDeScore`, `proDeDate`, `proDeStatus`) VALUES
(00000000001, 00000000001, 27000, 'ลดราคาจาก 32000 เหลือ 27000', 00000000001, 00000000010, 5, '2017-04-15', 0),
(00000000002, 00000000002, 10, 'ราคาดั่งเดิม', 00000000001, 00000000010, 5, '2017-04-17', 0),
(00000000003, 00000000002, 9, 'ลด 1บาท', 00000000001, 00000000010, 5, '2017-04-18', 0),
(00000000004, 00000000001, 31000, 'ราคาล่าสุด', 00000000001, 00000000010, 5, '2017-04-19', 0);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supID` int(11) UNSIGNED ZEROFILL NOT NULL,
  `supName` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supID`, `supName`) VALUES
(00000000001, 'Central Group'),
(00000000002, 'CPALL');

-- --------------------------------------------------------

--
-- Table structure for table `supplierdetail`
--

CREATE TABLE `supplierdetail` (
  `supDeID` int(11) UNSIGNED ZEROFILL NOT NULL,
  `supID` int(11) UNSIGNED ZEROFILL NOT NULL,
  `supDeLa` double NOT NULL,
  `supDeLong` double NOT NULL,
  `supDeDes` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplierdetail`
--

INSERT INTO `supplierdetail` (`supDeID`, `supID`, `supDeLa`, `supDeLong`, `supDeDes`) VALUES
(00000000001, 00000000002, 13.719936, 100.453077, '7-11 มหาวิทยาลัยสยาม');

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
  ADD KEY `cusID_FKs` (`cusID`),
  ADD KEY `supDeID_FKs` (`supDeID`);

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
  MODIFY `catID` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `categorydetail`
--
ALTER TABLE `categorydetail`
  MODIFY `catDeID` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cusID` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `imageID` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `proID` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `productdetail`
--
ALTER TABLE `productdetail`
  MODIFY `proDeID` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supID` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `supplierdetail`
--
ALTER TABLE `supplierdetail`
  MODIFY `supDeID` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
  ADD CONSTRAINT `proID_FKs` FOREIGN KEY (`proID`) REFERENCES `product` (`proID`),
  ADD CONSTRAINT `supDeID_FKs` FOREIGN KEY (`supDeID`) REFERENCES `supplierdetail` (`supDeID`);

--
-- Constraints for table `supplierdetail`
--
ALTER TABLE `supplierdetail`
  ADD CONSTRAINT `supID_FK` FOREIGN KEY (`supID`) REFERENCES `supplier` (`supID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
