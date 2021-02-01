-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2021 at 01:56 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uzduotis_keliones`
--

-- --------------------------------------------------------

--
-- Table structure for table `keliones`
--

CREATE TABLE `keliones` (
  `id` int(11) NOT NULL,
  `pav` varchar(255) NOT NULL,
  `data` varchar(255) NOT NULL,
  `laikas` varchar(255) NOT NULL,
  `trukme` varchar(255) NOT NULL,
  `aprasymas` varchar(255) NOT NULL,
  `flag_ivykusi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `keliones`
--

INSERT INTO `keliones` (`id`, `pav`, `data`, `laikas`, `trukme`, `aprasymas`, `flag_ivykusi`) VALUES
(1, 'Kaunas', 'test', 'test', 'test', 'testas KNS', 1),
(2, 'Vilnius', 'test', 'test', 'test', 'testas VLN', 1),
(3, 'Kaunas', 'test2', 'test2', 'test2', 'testas KNS2', 1),
(4, 'Vilnius', 'test2', 'test2', 'test2', 'testas VLN2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `keliones_budai`
--

CREATE TABLE `keliones_budai` (
  `id` int(11) NOT NULL,
  `pav` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `keliones_budai`
--

INSERT INTO `keliones_budai` (`id`, `pav`) VALUES
(1, 'pesti2366'),
(2, 'dviraciu++'),
(3, 'asdf3'),
(4, '123'),
(5, '5543'),
(7, 'hrssssss');

-- --------------------------------------------------------

--
-- Table structure for table `keliones_marsruto_atkarpos`
--

CREATE TABLE `keliones_marsruto_atkarpos` (
  `id` int(11) NOT NULL,
  `id_marsruto_atkarpos` int(11) NOT NULL,
  `id_keliones` int(11) NOT NULL,
  `id_keliones_budo` int(11) NOT NULL,
  `aprasymas` varchar(255) NOT NULL,
  `data_laikas` datetime NOT NULL,
  `trukme` time NOT NULL,
  `atkrapos_numeris` int(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `keliones_marsruto_atkarpos`
--

INSERT INTO `keliones_marsruto_atkarpos` (`id`, `id_marsruto_atkarpos`, `id_keliones`, `id_keliones_budo`, `aprasymas`, `data_laikas`, `trukme`, `atkrapos_numeris`) VALUES
(3, 1, 1, 1, 'pirmas marsrutas - santaka', '2021-01-27 10:07:55', '01:00:00', 1),
(4, 2, 1, 1, 'antras marsrutas - baznycia', '2021-01-27 11:07:55', '01:00:00', 2),
(6, 1, 1, 4, 'testas', '2021-01-08 14:20:08', '12:00:00', 0),
(8, 1, 1, 1, 'aaaaaaaaaaaaa', '1991-01-04 14:20:08', '00:00:10', 0),
(9, 1, 1, 1, 'asdf123', '1991-01-04 14:20:08', '00:00:10', 1),
(10, 1, 1, 1, 'testxasdf', '1991-01-04 14:20:08', '12:00:00', 1),
(11, 1, 1, 5, '123321', '1991-01-04 14:20:08', '00:00:10', 1),
(12, 1, 1, 5, '321111', '1991-01-04 14:20:08', '00:00:10', 1),
(13, 1, 1, 5, '321111', '1991-01-04 14:20:08', '00:00:10', 1),
(14, 1, 1, 5, '321111', '1991-01-04 14:20:08', '00:00:10', 1),
(15, 1, 1, 1, '123321', '1991-01-04 14:20:08', '12:00:00', 1),
(16, 1, 1, 1, '123321', '1991-01-04 14:20:08', '12:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lankymasis_punkte`
--

CREATE TABLE `lankymasis_punkte` (
  `id` int(11) NOT NULL,
  `id_punkto` int(11) NOT NULL,
  `id_keliones` int(11) NOT NULL,
  `data_laikas` datetime NOT NULL,
  `trukme` time NOT NULL,
  `aprasymas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lankymasis_punkte`
--

INSERT INTO `lankymasis_punkte` (`id`, `id_punkto`, `id_keliones`, `data_laikas`, `trukme`, `aprasymas`) VALUES
(1, 1, 1, '2021-01-04 14:20:08', '14:20:08', 'aplankiau kebabine, bet visur tik majonezas.'),
(2, 2, 2, '2021-01-04 14:20:08', '14:20:08', 'spėjau pamatyt kol kalnas nenuslinko.'),
(7, 1, 1, '2021-01-08 14:20:08', '12:00:00', 'test'),
(8, 1, 1, '2021-01-08 14:20:08', '12:00:00', 'test'),
(9, 1, 1, '2021-01-08 14:20:08', '12:00:00', 'test'),
(10, 1, 1, '2021-01-08 14:20:08', '12:00:00', 'test12345'),
(11, 1, 1, '2021-01-08 14:20:08', '12:00:00', 'test123456'),
(12, 1, 1, '2021-01-08 14:20:08', '12:00:00', 'test123456'),
(13, 1, 1, '2021-01-08 14:20:08', '12:00:00', 'testasx'),
(14, 1, 1, '2021-01-08 14:20:08', '12:00:00', 'testasx'),
(15, 1, 1, '2021-01-08 14:20:08', '12:00:00', 'testasx'),
(16, 1, 1, '2021-01-08 14:20:08', '12:00:00', 'testasx'),
(17, 1, 1, '2021-01-08 14:20:08', '12:00:00', 'testasx'),
(18, 1, 1, '2021-01-08 14:20:08', '12:00:00', 'test1234567'),
(19, 1, 1, '2021-01-08 14:20:08', '12:00:00', 'test1234567'),
(20, 1, 1, '2021-01-08 14:20:08', '12:00:00', 'test1234567'),
(21, 1, 1, '2021-01-08 14:20:08', '12:00:00', 'test1234567'),
(22, 1, 1, '1991-01-04 14:20:08', '00:00:10', 'asdf'),
(23, 1, 1, '1991-01-04 14:20:08', '00:00:10', 'asdf'),
(24, 1, 1, '1991-01-04 14:20:08', '00:00:10', 'testasd'),
(25, 1, 1, '1991-01-04 14:20:08', '00:00:10', 'testasd'),
(26, 1, 1, '1991-01-04 14:20:08', '12:00:00', 'test'),
(27, 1, 1, '2021-01-10 14:20:08', '00:00:10', 'testawfaw'),
(28, 1, 1, '2021-01-10 14:20:08', '00:00:10', 'testawfaw'),
(29, 1, 1, '1991-01-04 14:20:08', '00:00:10', 'testawfwafwafwa'),
(30, 1, 1, '1991-01-04 14:20:08', '00:00:10', 'testawfwafwafwa'),
(31, 1, 1, '1991-01-04 14:20:08', '00:00:10', 'asdf123'),
(32, 1, 1, '1991-01-04 14:20:08', '00:00:10', 'asdf123'),
(33, 1, 1, '1991-01-04 14:20:08', '12:00:00', 'testxasdf'),
(34, 1, 1, '1991-01-04 14:20:08', '00:00:10', '123321'),
(35, 1, 1, '1991-01-04 14:20:08', '00:00:10', '123321'),
(36, 1, 1, '1991-01-04 14:20:08', '00:00:10', '123321'),
(37, 1, 1, '1991-01-04 14:20:08', '00:00:10', '123333'),
(38, 1, 1, '2021-01-08 14:20:08', '00:00:10', '321111'),
(39, 1, 1, '2021-01-08 14:20:08', '00:00:10', '321111'),
(40, 1, 1, '2021-01-08 14:20:08', '00:00:10', '321111'),
(41, 1, 1, '1991-01-04 14:20:08', '12:00:00', '123321'),
(42, 1, 1, '1991-01-04 14:20:08', '12:00:00', '123321'),
(43, 1, 1, '1991-01-04 14:20:08', '14:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `marsrutu_atkarpos`
--

CREATE TABLE `marsrutu_atkarpos` (
  `id` int(11) NOT NULL,
  `pav` varchar(255) NOT NULL,
  `ipatybes` varchar(255) NOT NULL,
  `id_punkto1` int(11) NOT NULL,
  `id_punkto2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `marsrutu_atkarpos`
--

INSERT INTO `marsrutu_atkarpos` (`id`, `pav`, `ipatybes`, `id_punkto1`, `id_punkto2`) VALUES
(1, 'Santaka', 'Y', 1, 1),
(2, 'Baznycia santakoj', 'Sena', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `priemones`
--

CREATE TABLE `priemones` (
  `id` int(10) UNSIGNED NOT NULL,
  `pav` varchar(255) COLLATE utf8_lithuanian_ci NOT NULL,
  `kaina` decimal(10,2) NOT NULL,
  `nuoroda` varchar(255) COLLATE utf8_lithuanian_ci NOT NULL,
  `skaicius_parodymu` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `skaicius_paspaudimu` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `vaizdas` varchar(255) COLLATE utf8_lithuanian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `punktai`
--

CREATE TABLE `punktai` (
  `id` int(11) NOT NULL,
  `pav` varchar(255) NOT NULL,
  `ilguma` decimal(10,6) NOT NULL,
  `platuma` decimal(10,6) NOT NULL,
  `aprasymas` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `punktai`
--

INSERT INTO `punktai` (`id`, `pav`, `ilguma`, `platuma`, `aprasymas`) VALUES
(1, 'Kebabinė prie pilies', '10.000000', '10.000000', 'skanūs kebabai ir ne tik.'),
(2, 'Gedimino kalnas', '20.000000', '20.000000', 'Slenkančio kalno pilis.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `pav` varchar(255) COLLATE utf8_lithuanian_ci NOT NULL,
  `passwd` varchar(255) COLLATE utf8_lithuanian_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_lithuanian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `keliones`
--
ALTER TABLE `keliones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `keliones_budai`
--
ALTER TABLE `keliones_budai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `keliones_marsruto_atkarpos`
--
ALTER TABLE `keliones_marsruto_atkarpos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_marsruto_atkarpos` (`id_marsruto_atkarpos`),
  ADD KEY `id_keliones` (`id_keliones`),
  ADD KEY `id_keliones_budo` (`id_keliones_budo`);

--
-- Indexes for table `lankymasis_punkte`
--
ALTER TABLE `lankymasis_punkte`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keliones` (`id_keliones`),
  ADD KEY `id_punkto` (`id_punkto`);

--
-- Indexes for table `marsrutu_atkarpos`
--
ALTER TABLE `marsrutu_atkarpos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_punkto1` (`id_punkto1`),
  ADD KEY `id_punkto2` (`id_punkto2`);

--
-- Indexes for table `priemones`
--
ALTER TABLE `priemones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `punktai`
--
ALTER TABLE `punktai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `keliones`
--
ALTER TABLE `keliones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `keliones_budai`
--
ALTER TABLE `keliones_budai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `keliones_marsruto_atkarpos`
--
ALTER TABLE `keliones_marsruto_atkarpos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `lankymasis_punkte`
--
ALTER TABLE `lankymasis_punkte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `marsrutu_atkarpos`
--
ALTER TABLE `marsrutu_atkarpos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `priemones`
--
ALTER TABLE `priemones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `punktai`
--
ALTER TABLE `punktai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `keliones_marsruto_atkarpos`
--
ALTER TABLE `keliones_marsruto_atkarpos`
  ADD CONSTRAINT `keliones_marsruto_atkarpos_ibfk_1` FOREIGN KEY (`id_marsruto_atkarpos`) REFERENCES `marsrutu_atkarpos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `keliones_marsruto_atkarpos_ibfk_2` FOREIGN KEY (`id_keliones`) REFERENCES `keliones` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `keliones_marsruto_atkarpos_ibfk_3` FOREIGN KEY (`id_keliones_budo`) REFERENCES `keliones_budai` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `lankymasis_punkte`
--
ALTER TABLE `lankymasis_punkte`
  ADD CONSTRAINT `lankymasis_punkte_ibfk_1` FOREIGN KEY (`id_keliones`) REFERENCES `keliones` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `lankymasis_punkte_ibfk_2` FOREIGN KEY (`id_punkto`) REFERENCES `punktai` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `marsrutu_atkarpos`
--
ALTER TABLE `marsrutu_atkarpos`
  ADD CONSTRAINT `marsrutu_atkarpos_ibfk_1` FOREIGN KEY (`id_punkto1`) REFERENCES `punktai` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `marsrutu_atkarpos_ibfk_2` FOREIGN KEY (`id_punkto2`) REFERENCES `punktai` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
