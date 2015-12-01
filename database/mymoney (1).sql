-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2015 at 07:10 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mymoney`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
`ID` int(11) NOT NULL,
  `AccountName` text NOT NULL,
  `IDUser` int(11) NOT NULL,
  `Currency` text NOT NULL,
  `Amount` double NOT NULL,
  `AccountType` int(11) NOT NULL,
  `AccountDescription` text NOT NULL,
  `Deleted` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`ID`, `AccountName`, `IDUser`, `Currency`, `Amount`, `AccountType`, `AccountDescription`, `Deleted`) VALUES
(1, 'Cont economii', 1, 'RON', 3250, 2, 'Cont in lei pentru economii', 0),
(2, 'Cont salariu', 1, 'RON', 800, 3, 'Cont salariu', 0),
(10, 'Cont economii 2', 1, 'RON', 10000, 2, 'Pensia privata pilonul III', 1),
(11, 'TestCash', 1, 'RON', 4, 1, 'TetsCashDdescr', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE IF NOT EXISTS `transactions` (
`ID` int(11) NOT NULL,
  `TransactionName` text NOT NULL,
  `TransactionDescription` text NOT NULL,
  `Amount` double NOT NULL,
  `TransactionType` int(11) NOT NULL,
  `IDAccount` int(11) NOT NULL,
  `IDProduct` int(11) NOT NULL,
  `ISRecurrent` int(11) NOT NULL,
  `Currency` text NOT NULL,
  `TransactionTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `Deleted` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`ID`, `TransactionName`, `TransactionDescription`, `Amount`, `TransactionType`, `IDAccount`, `IDProduct`, `ISRecurrent`, `Currency`, `TransactionTime`, `Deleted`) VALUES
(2, 'Plata factura Orange', 'Plata abonamentului pe noiembrie', 235, 1, 1, 1, 0, 'RON', '2015-12-01 15:22:31', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`ID` int(11) NOT NULL,
  `FirstName` text,
  `LastName` text,
  `Password` text,
  `DateOfBirth` text,
  `Email` text,
  `PhoneNumber` text NOT NULL,
  `City` text NOT NULL,
  `Country` text NOT NULL,
  `Smoker` int(11) NOT NULL,
  `HasDriversLicence` int(11) NOT NULL,
  `HasCar` int(11) NOT NULL,
  `Married` int(11) NOT NULL,
  `NumberOfKids` int(11) DEFAULT NULL,
  `PreferredCurrency` int(11) DEFAULT NULL,
  `IsAdmin` int(11) DEFAULT NULL,
  `UserType` int(11) DEFAULT NULL,
  `AgreedWithProcessingTerms` int(11) DEFAULT NULL,
  `IsPremium` int(11) DEFAULT NULL,
  `NumberOfLogins` int(11) NOT NULL,
  `LastLogin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DateRegistered` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Table to hold the MyMoney users with their logins';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `FirstName`, `LastName`, `Password`, `DateOfBirth`, `Email`, `PhoneNumber`, `City`, `Country`, `Smoker`, `HasDriversLicence`, `HasCar`, `Married`, `NumberOfKids`, `PreferredCurrency`, `IsAdmin`, `UserType`, `AgreedWithProcessingTerms`, `IsPremium`, `NumberOfLogins`, `LastLogin`, `DateRegistered`) VALUES
(1, 'Vlad', 'Butnaru', 'dev2015', '1994-11-09', 'vlad2me@gmail.com', '+40 0754 827 620', 'Iasi', 'Romania', 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, '2015-11-28 18:28:43', '2015-11-28 18:28:43'),
(4, 'Doru', 'Butnaru', 'aaaa', '', 'db@gmail.com', '', '', '', 0, 0, 0, 0, NULL, NULL, 0, 1, 1, 0, 0, '2015-11-29 01:36:34', '2015-11-29 01:36:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
 ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `ID_2` (`ID`), ADD KEY `ID` (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
