-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2021 at 01:32 PM
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
-- Database: `test_keliones`
--

-- --------------------------------------------------------

--
-- Table structure for table `keliones`
--

CREATE TABLE `keliones` (
  `id` int(11) NOT NULL,
  `pav` varchar(255) NOT NULL,
  `aprasymas` varchar(255) NOT NULL,
  `flag_ivykusi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `keliones_budai`
--

CREATE TABLE `keliones_budai` (
  `id` int(11) NOT NULL,
  `pav` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `trukme` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `aprasymas` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Table structure for table `punktai`
--

CREATE TABLE `punktai` (
  `id` int(11) NOT NULL,
  `pav` varchar(255) NOT NULL,
  `ilguma` decimal(10,6) NOT NULL,
  `platuma` decimal(10,6) NOT NULL,
  `aprasymas` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Indexes for table `punktai`
--
ALTER TABLE `punktai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `keliones`
--
ALTER TABLE `keliones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `keliones_budai`
--
ALTER TABLE `keliones_budai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `keliones_marsruto_atkarpos`
--
ALTER TABLE `keliones_marsruto_atkarpos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lankymasis_punkte`
--
ALTER TABLE `lankymasis_punkte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marsrutu_atkarpos`
--
ALTER TABLE `marsrutu_atkarpos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `punktai`
--
ALTER TABLE `punktai`
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
