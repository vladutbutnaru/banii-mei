-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 18 Iul 2016 la 13:04
-- Versiune server: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `baniimei`
--

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
`ID` int(11) NOT NULL,
  `AccountName` text NOT NULL,
  `IDUser` int(11) NOT NULL,
  `Currency` int(11) NOT NULL,
  `Amount` double NOT NULL,
  `AccountType` int(11) NOT NULL,
  `AccountDescription` text NOT NULL,
  `Deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
`id` int(11) unsigned NOT NULL,
  `CategoryName` text,
  `CategoryDescription` text,
  `DateCreated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `cities`
--

CREATE TABLE IF NOT EXISTS `cities` (
`ID` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Country` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
`ID` int(11) NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `currencies`
--

CREATE TABLE IF NOT EXISTS `currencies` (
`ID` int(11) NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `docummentationviews`
--

CREATE TABLE IF NOT EXISTS `docummentationviews` (
`id` int(11) NOT NULL,
  `view` text COLLATE utf8_bin NOT NULL,
  `dateofview` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `earning_sources`
--

CREATE TABLE IF NOT EXISTS `earning_sources` (
`id` int(11) unsigned NOT NULL,
  `EarningName` text,
  `EarningDescription` text,
  `EarningUser` text,
  `Deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `history`
--

CREATE TABLE IF NOT EXISTS `history` (
`ID` int(11) NOT NULL,
  `Title` text NOT NULL,
  `Text` text NOT NULL,
  `UserID` int(11) NOT NULL,
  `EventTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
`id` int(11) unsigned NOT NULL,
  `LocationName` text,
  `LocationDescription` text,
  `LocationCity` int(11) DEFAULT NULL,
  `LocationCountry` int(11) NOT NULL,
  `LocationLong` text NOT NULL,
  `LocationLat` text NOT NULL,
  `CreationDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `prelaunch_contact`
--

CREATE TABLE IF NOT EXISTS `prelaunch_contact` (
`id` int(11) NOT NULL,
  `Email` text COLLATE utf8_bin NOT NULL,
  `DateRegistered` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `prices`
--

CREATE TABLE IF NOT EXISTS `prices` (
`id` int(11) unsigned NOT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `LocationID` int(11) DEFAULT NULL,
  `TransactionID` int(11) DEFAULT NULL,
  `DateAdded` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `products`
--

CREATE TABLE IF NOT EXISTS `products` (
`id` int(11) unsigned NOT NULL,
  `ProductName` text,
  `ProductDescription` text,
  `ProductCategoryID` int(11) DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `recurring_transactions`
--

CREATE TABLE IF NOT EXISTS `recurring_transactions` (
`id` int(11) NOT NULL,
  `transaction_name` text NOT NULL,
  `transaction_description` text NOT NULL,
  `transaction_startdate` date NOT NULL,
  `transaction_enddate` date NOT NULL,
  `numberofdays` int(11) NOT NULL,
  `numberofrepetitions` int(11) NOT NULL,
  `amount` double NOT NULL,
  `Currency` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `transaction_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `transactions`
--

CREATE TABLE IF NOT EXISTS `transactions` (
`ID` int(11) NOT NULL,
  `TransactionName` text NOT NULL,
  `TransactionDescription` text NOT NULL,
  `Amount` double NOT NULL,
  `TransactionType` int(11) NOT NULL,
  `IDAccount` int(11) NOT NULL,
  `IDProduct` text NOT NULL,
  `ISRecurrent` int(11) NOT NULL,
  `Currency` int(11) NOT NULL,
  `TransactionTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `Deleted` int(11) NOT NULL,
  `IDLocation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `users`
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
  `DateRegistered` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ProfileImagePath` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Table to hold the MyMoney users with their logins';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `docummentationviews`
--
ALTER TABLE `docummentationviews`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `earning_sources`
--
ALTER TABLE `earning_sources`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prelaunch_contact`
--
ALTER TABLE `prelaunch_contact`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prices`
--
ALTER TABLE `prices`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recurring_transactions`
--
ALTER TABLE `recurring_transactions`
 ADD PRIMARY KEY (`id`);

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
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `docummentationviews`
--
ALTER TABLE `docummentationviews`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `earning_sources`
--
ALTER TABLE `earning_sources`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prelaunch_contact`
--
ALTER TABLE `prelaunch_contact`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prices`
--
ALTER TABLE `prices`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `recurring_transactions`
--
ALTER TABLE `recurring_transactions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
