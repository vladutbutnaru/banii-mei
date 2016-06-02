-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 09 Feb 2016 la 10:21
-- Server version: 5.6.17
-- PHP Version: 5.5.12

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
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AccountName` text NOT NULL,
  `IDUser` int(11) NOT NULL,
  `Currency` text NOT NULL,
  `Amount` double NOT NULL,
  `AccountType` int(11) NOT NULL,
  `AccountDescription` text NOT NULL,
  `Deleted` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Salvarea datelor din tabel `accounts`
--

INSERT INTO `accounts` (`ID`, `AccountName`, `IDUser`, `Currency`, `Amount`, `AccountType`, `AccountDescription`, `Deleted`) VALUES
(12, 'Portofelul meu', 5, 'RON', 6, 1, 'Numerar', 0),
(13, 'Cont economii', 5, 'RON', 125000, 2, 'Pentru viitorul copilului', 0),
(14, 'Salariu', 5, 'RON', 1215, 3, 'Venituri', 0),
(15, 'Portofelul meu', 1, 'RON', 4, 1, 'Numerarul din portofel', 0),
(16, 'Cont economii cash', 1, 'RON', 3900, 2, 'Cont economii de acasa', 0),
(17, 'Cont curent Banca Transilvania', 1, 'RON', 165, 3, 'Cont salariu Banca Transilvania', 0);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `CategoryName` text,
  `CategoryDescription` text,
  `DateCreated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Salvarea datelor din tabel `categories`
--

INSERT INTO `categories` (`id`, `CategoryName`, `CategoryDescription`, `DateCreated`) VALUES
(1, 'Produse din tutun', 'Produse din tutun precum tigari, trabucuri, cigarillos, tigari de foi, tutun la cutie, tutun de prizat', NULL),
(2, 'Legume', 'Legume', '2015-12-06 17:04:58'),
(4, 'Fructe', 'Fructe', '2015-12-06 00:00:00'),
(5, 'Telefoane', 'Telefoane', '2015-12-06 17:05:32'),
(8, 'Tablete', 'Tablete', '2015-12-06 17:05:57'),
(9, 'Smartwatch', 'Smartwatch', '2015-12-06 17:05:57'),
(12, 'Electronice', 'Electronice', '2015-12-06 17:06:19'),
(13, 'Electrocasnice', 'Electrocasnice', '2015-12-06 17:06:19'),
(16, 'Produse alimentare', 'Produse alimentare', '2015-12-06 17:06:44'),
(17, 'Produse cosmetice', 'Produse cosmetice', '2015-12-06 17:06:44'),
(20, 'Servicii', 'Servicii', '2015-12-06 17:15:28'),
(21, 'Auto & Moto', 'Automobile si motociclism', NULL),
(22, 'Tigari electronice', 'Produse asociate tigarilor electronice', '2015-12-06 17:16:29'),
(23, 'Produse textile', 'Haine, accesorii', NULL),
(24, 'Accesorii moda', 'Bratari, ceasuri, inele', '2015-12-06 17:16:56'),
(25, 'Chirie si acomodare', 'Chirii', '2015-12-06 17:17:40'),
(26, 'Educatie', 'Carti, manuale, taxe scolare', '2015-12-06 17:17:40'),
(27, 'Jucarii', 'Jucarii si accesorii copii', '2015-12-06 17:18:35'),
(28, 'Animale de companie', 'Mancare, jucarii, accesorii', '2015-12-06 17:20:32'),
(29, 'Benzina & Motorina', 'Combustibil auto', NULL),
(30, 'Bauturi alcoolice', 'Bauturi Alcoolice', '2015-12-06 19:51:36'),
(31, 'Bilete cinema', 'Bilete cinematograf', '2015-12-06 19:51:53');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `docummentationviews`
--

CREATE TABLE IF NOT EXISTS `docummentationviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `view` text COLLATE utf8_bin NOT NULL,
  `dateofview` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6 ;

--
-- Salvarea datelor din tabel `docummentationviews`
--

INSERT INTO `docummentationviews` (`id`, `view`, `dateofview`) VALUES
(1, 'View', '2015-12-14 18:56:57'),
(2, 'View', '2015-12-14 19:14:13'),
(3, 'View', '2015-12-14 19:54:17'),
(4, 'View', '2015-12-15 11:05:10'),
(5, 'View', '2015-12-15 20:49:30');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `earning_sources`
--

CREATE TABLE IF NOT EXISTS `earning_sources` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `EarningName` text,
  `EarningDescription` text,
  `EarningUser` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Salvarea datelor din tabel `earning_sources`
--

INSERT INTO `earning_sources` (`id`, `EarningName`, `EarningDescription`, `EarningUser`) VALUES
(2, 'Salarii', 'Salariile companiei mele', '1'),
(3, 'Servicii', '', '5'),
(4, 'Gasit', 'Am gasit undeva', '1'),
(5, 'Datorii', '', '1');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `LocationName` text,
  `LocationDescription` text,
  `LocationCity` text,
  `CreationDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Salvarea datelor din tabel `locations`
--

INSERT INTO `locations` (`id`, `LocationName`, `LocationDescription`, `LocationCity`, `CreationDate`) VALUES
(1, 'Kaufland Pacurari', 'Hypermarket Kaufland Soseaua Pacurari', 'Iasi', NULL),
(2, 'Auchan', 'Auchan Iasi', 'Iasi', NULL),
(3, 'Palas', 'Palas Iasi', 'Iasi', NULL),
(4, 'Kaufland Alexandru', 'Kaufland Alexandru', 'Iasi', NULL),
(5, 'Billa Gara', 'Billa Gara', 'Iasi', NULL),
(6, 'Billa Alexandru', 'Billa Alexandru', 'Iasi', NULL),
(7, 'Carrefour ERA', 'Carrefour ERA', 'Iasi', NULL),
(8, 'Carrefour Felicia', 'Carrefour Felicia', 'Iasi', NULL),
(9, 'Lidl Canta', 'Lidl Canta', 'Iasi', NULL),
(10, 'Emag', 'Emag.ro', 'Iasi', NULL),
(11, 'Evomag', 'Evomag.ro', 'Bucuresti', NULL),
(12, 'OLX', 'Olx.ro', 'Bucuresti', NULL),
(13, 'Mol petru pon', '', 'Iasi', NULL),
(14, 'McDonalds Iasi', '', 'Iasi', NULL),
(15, 'Pizzeria Domneasca', '', 'Iasi', NULL),
(16, 'Autospa', 'Spalatorie auto', 'Iasi', NULL);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `prelaunch_contact`
--

CREATE TABLE IF NOT EXISTS `prelaunch_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Email` text COLLATE utf8_bin NOT NULL,
  `DateRegistered` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=8 ;

--
-- Salvarea datelor din tabel `prelaunch_contact`
--

INSERT INTO `prelaunch_contact` (`id`, `Email`, `DateRegistered`) VALUES
(1, 'vlad2me@gmail.com', '2015-12-13 17:38:58'),
(3, '', '2015-12-14 19:56:39'),
(4, 'poponaru_sef1989@yahoo.com', '2015-12-15 11:06:05'),
(5, '', '2015-12-15 11:06:25'),
(6, '', '2015-12-15 11:06:47'),
(7, 'null', '2015-12-15 11:09:04');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `prices`
--

CREATE TABLE IF NOT EXISTS `prices` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ProductID` int(11) DEFAULT NULL,
  `LocationID` int(11) DEFAULT NULL,
  `TransactionID` int(11) DEFAULT NULL,
  `DateAdded` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Price` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Salvarea datelor din tabel `prices`
--

INSERT INTO `prices` (`id`, `ProductID`, `LocationID`, `TransactionID`, `DateAdded`, `Price`) VALUES
(1, 1, 1, 1, NULL, 123),
(2, 2, 1, 1, NULL, 414),
(3, 5, 1, 1, NULL, 141411),
(4, 5, 1, 1, NULL, 16.5),
(5, 18, 2, 1, '2015-12-07 11:14:47', 174),
(6, 19, 3, 1, '2015-12-07 12:01:03', 7),
(7, 20, 3, 1, '2015-12-07 16:54:03', 100),
(8, 9, 2, 1, '2015-12-07 16:55:24', 5),
(9, 5, 5, 1, '2015-12-07 19:30:49', 16.5),
(10, 22, 5, 1, '2015-12-07 19:30:49', 2.9),
(11, 23, 5, 1, '2015-12-07 19:30:49', 2.65),
(12, 24, 13, 1, '2015-12-08 17:53:50', 7),
(13, 25, 13, 1, '2015-12-08 17:53:50', 158.5),
(14, 9, 5, 1, '2015-12-08 18:26:41', 3),
(15, 26, 5, 1, '2015-12-08 18:26:41', 3),
(16, 27, 5, 1, '2015-12-08 18:26:41', 14),
(17, 28, 3, 1, '2015-12-09 13:34:50', 5),
(18, 29, 14, 1, '2015-12-09 13:36:38', 3.5),
(19, 30, 14, 1, '2015-12-09 13:36:38', 12),
(20, 31, 2, 1, '2015-12-10 10:35:19', 10),
(21, 33, 16, 1, '2015-12-10 13:59:32', 25),
(22, 33, 16, 1, '2015-12-10 14:32:28', 30);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ProductName` text,
  `ProductDescription` text,
  `ProductCategoryID` int(11) DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Salvarea datelor din tabel `products`
--

INSERT INTO `products` (`id`, `ProductName`, `ProductDescription`, `ProductCategoryID`, `CreationDate`) VALUES
(1, 'iPhone 5S', 'Telefon iPhone 5S', 1, '2015-12-05 13:49:45'),
(2, 'MacBook Pro late 2013 13 inch\n', 'Laptop MacBook Pro 13 inchi late 2013, i5, Intel Iris, 128 GB SDD', 2, '2015-12-05 13:50:44'),
(5, 'Sobranie Lila', 'Pachet de tigari Sobranie Lila 1 mg nicotina', 1, NULL),
(6, 'Strugurel Nivea Essential Care', 'Strugurel Nivea Essential Care', 17, NULL),
(7, 'Spray Old Spice Lagoon', 'Spray de corp', 17, NULL),
(8, 'E-Lichid American Stars', 'Lichid tigara electronica', 22, NULL),
(9, 'Winterfresh mints', 'Mentosane', 16, NULL),
(10, 'Servetele umede Nivea pure&natural', '', 17, '2015-12-06 19:50:20'),
(11, 'Dunhill Albastru', 'Tigari dunhill albastru', 1, NULL),
(12, 'Bere Becks doza', '', 30, NULL),
(13, 'Heineken 330 ml', 'sticla', 30, NULL),
(14, 'Bergenbier doza', '', 30, NULL),
(15, 'Dunhill Negru', 'tigari', 1, NULL),
(16, 'Frotto servetele', '', 17, NULL),
(17, 'Kent 8', 'albastru', 1, NULL),
(18, 'Aspire Nautilius', 'Tank atomizer', 22, NULL),
(19, 'Kfc', 'Kfc', 16, NULL),
(20, 'Parcare Palas cu discount', 'Parcare palas cu discount', 21, NULL),
(21, 'E-Lichid Liqua Q 30 ml', 'E-Lichid Liqua Q 30 ml', 22, NULL),
(22, 'Bere Grolsch', '', 30, NULL),
(23, 'Clementine', '', 4, NULL),
(24, 'Red Bull doza', 'Fara zahar', 16, NULL),
(25, 'Benzina', '', 29, NULL),
(26, 'Paine cu cartofi', '', 16, NULL),
(27, 'Piept de pui Agricola', '', 16, NULL),
(28, 'Parcare Spitalul Militar', '', 21, NULL),
(29, 'Cheeseburger', 'McDonalds', 16, NULL),
(30, 'Grand Royale', 'McDonalds', 16, NULL),
(31, 'Zi nastere', '', 20, NULL),
(32, 'Pizza prosciutto e funghi', 'De la Pizzeria Domneasca', 16, NULL),
(33, 'Spalat interior si exterior', '', 21, NULL),
(34, 'Paste barilla', '', 16, NULL);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `transactions`
--

CREATE TABLE IF NOT EXISTS `transactions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TransactionName` text NOT NULL,
  `TransactionDescription` text NOT NULL,
  `Amount` double NOT NULL,
  `TransactionType` int(11) NOT NULL,
  `IDAccount` int(11) NOT NULL,
  `IDProduct` text NOT NULL,
  `ISRecurrent` int(11) NOT NULL,
  `RecurrentInterval` int(11) DEFAULT NULL,
  `RecurrentInterval` int(11) DEFAULT NULL,
  `Currency` text NOT NULL,
  `TransactionTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `Deleted` int(11) NOT NULL,
  `IDLocation` int(11) DEFAULT NULL,
  
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_2` (`ID`),
  KEY `ID` (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Salvarea datelor din tabel `transactions`
--

INSERT INTO `transactions` (`ID`, `TransactionName`, `TransactionDescription`, `Amount`, `TransactionType`, `IDAccount`, `IDProduct`, `ISRecurrent`, `Currency`, `TransactionTime`, `Deleted`, `IDLocation`) VALUES
(2, 'Plata factura Orange', 'Plata abonamentului pe noiembrie', 235, 1, 1, '1', 0, 'RON', '2015-12-01 15:22:31', 0, NULL),
(3, 'Tigari', 'Cumparat Tigari', 16.5, 1, 11, '', 0, 'RON', '2015-12-06 14:45:48', 0, 1),
(4, 'Tigari', 'Cumparat Tigari', 16.5, 1, 11, ',5', 0, 'RON', '2015-12-06 14:46:14', 0, 1),
(5, 'asfd', 'asdf', 1, 1, 10, ',1,2,5', 0, 'RON', '2015-12-06 15:03:25', 0, 1),
(6, 'asfd', 'asdf', 1, 1, 10, ',1,2,5', 0, 'RON', '2015-12-06 15:03:46', 0, 1),
(7, 'asfd', 'asdf', 1, 1, 10, ',1,2,5', 0, 'RON', '2015-12-06 15:05:21', 0, 1),
(8, 'Platatest2', 'descrieretest2', 123, 1, 10, ',1,2,5', 0, 'RON', '2015-12-06 15:34:03', 0, 1),
(9, 'Platatest2', 'descrieretest2', 123, 1, 10, ',1,2,5', 0, 'RON', '2015-12-06 15:36:07', 0, 1),
(10, 'Platatest2', 'descrieretest2', 123, 1, 10, ',1,2,5', 0, 'RON', '2015-12-06 15:37:24', 0, 1),
(11, 'Tigari', 'Viciu', 16.5, 1, 12, ',5', 0, 'RON', '2015-12-06 16:34:32', 0, 1),
(12, 'asdf', 'asdf', 4, 1, 10, ',1,2', 0, 'RON', '2015-12-06 17:29:19', 0, 2),
(13, 'Salariu dec', '', 16.5, 2, 12, '3', 0, 'RON', '2015-12-06 19:16:38', 0, 0),
(14, 'Gasit in portofel', 'Am gasit in portofel 3 lei', 3, 2, 15, '4', 0, 'RON', '2015-12-06 19:29:57', 0, 0),
(15, 'asdf', 'asdf', 1, 1, 15, ',11,12', 0, 'RON', '2015-12-07 11:04:27', 0, 2),
(16, 'Aspire Nautilus', 'Tank atomizer', 174, 1, 15, ',18', 0, 'RON', '2015-12-07 11:14:43', 0, 2),
(17, 'Mancare KFC', '2 Bonuri + cash', 7, 1, 15, ',19', 0, 'RON', '2015-12-07 12:00:59', 0, 3),
(18, 'Datorie Cosmin', 'Ziua Andrei', 35, 2, 15, '5', 0, 'RON', '2015-12-07 13:11:16', 0, 0),
(19, 'Parcare Palas Decembrie', '', 100, 1, 17, ',20', 0, 'RON', '2015-12-07 16:53:57', 0, 3),
(20, 'Lichid golden ', '', 35, 1, 15, ',21', 0, 'RON', '2015-12-07 16:54:53', 0, 3),
(21, 'Guma orbit', 'Guma orbit', 5, 1, 15, ',9', 0, 'RON', '2015-12-07 16:55:22', 0, 2),
(22, 'Datorie guma', '', 2.5, 2, 15, '5', 0, 'RON', '2015-12-07 16:56:33', 0, 0),
(23, 'Cute', '', 33, 1, 12, ',5,22,23', 0, 'RON', '2015-12-07 19:30:10', 0, 5),
(24, 'Salariu dec', '', 130, 2, 14, '3', 0, 'RON', '2015-12-07 19:31:37', 0, 0),
(25, 'Plin benzina', 'Benzina plus redbull', 165.5, 1, 17, ',24,25', 0, 'RON', '2015-12-08 17:53:05', 0, 13),
(27, 'Salariu dec', '', 135, 2, 14, '3', 0, 'RON', '2015-12-08 18:23:00', 0, 0),
(28, 'Cina', '', 20, 1, 12, ',9,26,27', 0, 'RON', '2015-12-08 18:26:21', 0, 5),
(29, 'Parcare Spitalul Militar', '', 5, 1, 15, ',28', 0, 'RON', '2015-12-09 13:34:47', 0, 3),
(30, 'Mancare McDonalds', '1 bon + cash', 6.5, 1, 15, ',29,30', 0, 'RON', '2015-12-09 13:36:22', 0, 14),
(31, 'Ziua lui Alin', '', 10, 1, 15, ',31', 0, 'RON', '2015-12-10 10:35:14', 0, 2),
(32, 'Mancare Pizza', '', 25, 1, 15, ',32', 0, 'RON', '2015-12-10 11:36:19', 0, 15),
(33, 'Spalat auto', '', 25, 1, 15, ',33', 0, 'RON', '2015-12-10 13:59:25', 0, 16),
(34, 'Extra spalare', '', 30, 1, 15, ',33', 0, 'RON', '2015-12-10 14:32:21', 0, 16),
(35, 'Salariu dec', '', 300, 2, 14, '3', 0, 'RON', '2015-12-10 22:20:24', 0, 0),
(36, 'Sos Pesto barilla', '', 13, 1, 12, '', 0, 'RON', '2015-12-10 22:23:43', 0, 2),
(37, 'Sos Pesto barilla', '', 13, 1, 12, '', 0, 'RON', '2015-12-10 22:24:06', 0, 2);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
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
  `ProfileImagePath` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Table to hold the MyMoney users with their logins' AUTO_INCREMENT=6 ;

--
-- Salvarea datelor din tabel `users`
--

INSERT INTO `users` (`ID`, `FirstName`, `LastName`, `Password`, `DateOfBirth`, `Email`, `PhoneNumber`, `City`, `Country`, `Smoker`, `HasDriversLicence`, `HasCar`, `Married`, `NumberOfKids`, `PreferredCurrency`, `IsAdmin`, `UserType`, `AgreedWithProcessingTerms`, `IsPremium`, `NumberOfLogins`, `LastLogin`, `DateRegistered`, `ProfileImagePath`) VALUES
(1, 'Vlad', 'Butnaru', 'dev2015', '1994-11-09', 'vlad2me@gmail.com', '+40 0754 827 620', 'Iasi', 'Romania', 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, '2015-12-06 13:44:53', '2015-11-28 18:28:43', 'profile.png'),
(4, 'Doru', 'Butnaru', 'aaaa', '', 'db@gmail.com', '', '', '', 0, 0, 0, 0, NULL, NULL, 0, 1, 1, 0, 0, '2015-11-29 01:36:34', '2015-11-29 01:36:34', NULL),
(5, 'Carmen', 'Butnaru', 'duca1973', '31-05-1973', 'ducarmen73@gmail.com', '0788234708', 'Iasi', 'Romania', 1, 1, 1, 1, NULL, NULL, 0, 1, 1, 0, 0, '2015-12-06 14:28:51', '2015-12-06 14:25:53', 'profile-carmen.png');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
