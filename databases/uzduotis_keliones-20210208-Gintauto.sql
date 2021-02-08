-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2021 m. Vas 08 d. 07:05
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
-- Sukurta duomenų struktūra lentelei `keliones`
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
-- Sukurta duomenų kopija lentelei `keliones`
--

INSERT INTO `keliones` (`id`, `pav`, `data`, `laikas`, `trukme`, `aprasymas`, `flag_ivykusi`) VALUES
(1, 'per didžiuosius LT miestus', '', '', '', 'tikrinam užklausą', 0),
(2, 'į Šiaurę', '', '', '', 'dumsim', 0);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `keliones_budai`
--

CREATE TABLE `keliones_budai` (
  `id` int(11) NOT NULL,
  `pav` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sukurta duomenų kopija lentelei `keliones_budai`
--

INSERT INTO `keliones_budai` (`id`, `pav`) VALUES
(1, 'Automobilis'),
(2, 'Motociklas');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `keliones_marsruto_atkarpos`
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
-- Sukurta duomenų kopija lentelei `keliones_marsruto_atkarpos`
--

INSERT INTO `keliones_marsruto_atkarpos` (`id`, `id_marsruto_atkarpos`, `id_keliones`, `id_keliones_budo`, `aprasymas`, `data_laikas`, `trukme`, `atkrapos_numeris`) VALUES
(1, 3, 1, 1, 'skubam', '0000-00-00 00:00:00', '00:00:00', 1),
(2, 4, 1, 1, 'lekiam', '0000-00-00 00:00:00', '00:00:00', 2),
(3, 3, 2, 1, 'varom', '0000-00-00 00:00:00', '00:00:00', 1),
(4, 5, 2, 1, 'lekiam', '0000-00-00 00:00:00', '00:00:00', 2),
(5, 6, 2, 1, 'bėgam', '0000-00-00 00:00:00', '00:00:00', 3);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `lankymasis_punkte`
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
-- Sukurta duomenų kopija lentelei `lankymasis_punkte`
--

INSERT INTO `lankymasis_punkte` (`id`, `id_punkto`, `id_keliones`, `data_laikas`, `trukme`, `aprasymas`) VALUES
(1, 3, 1, '0000-00-00 00:00:00', '00:00:00', 'tik pavalgėm');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `marsrutu_atkarpos`
--

CREATE TABLE `marsrutu_atkarpos` (
  `id` int(11) NOT NULL,
  `pav` varchar(255) NOT NULL,
  `ipatybes` varchar(255) NOT NULL,
  `id_punkto1` int(11) NOT NULL,
  `id_punkto2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sukurta duomenų kopija lentelei `marsrutu_atkarpos`
--

INSERT INTO `marsrutu_atkarpos` (`id`, `pav`, `ipatybes`, `id_punkto1`, `id_punkto2`) VALUES
(1, 'per Babtus, Lab8nava', 'vidurinis kelias', 1, 3),
(2, 'per Vandžiogala', 'tipo geriausias', 1, 3),
(3, 'per Cinkiškius', 'turbūt greičiausias', 1, 3),
(4, 'per Šeduvą, Radviliškį', '', 3, 5),
(5, 'E67', 'magistralė', 3, 16),
(6, 'E67', 'magistralė', 16, 15);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `priemones`
--

CREATE TABLE `priemones` (
  `id` int(10) UNSIGNED NOT NULL,
  `pav` varchar(255) COLLATE utf8_lithuanian_ci NOT NULL,
  `kaina` decimal(10,2) NOT NULL,
  `nuoroda` varchar(255) COLLATE utf8_lithuanian_ci NOT NULL,
  `skaicius_parodymu` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `skaicius_paspaudimu` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `vaizdas` varchar(255) COLLATE utf8_lithuanian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `punktai`
--

CREATE TABLE `punktai` (
  `id` int(11) NOT NULL,
  `id_punkto_tipo` int(10) UNSIGNED DEFAULT NULL,
  `pav` varchar(255) NOT NULL,
  `ilguma` decimal(10,6) NOT NULL,
  `platuma` decimal(10,6) NOT NULL,
  `aprasymas` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Sukurta duomenų kopija lentelei `punktai`
--

INSERT INTO `punktai` (`id`, `id_punkto_tipo`, `pav`, `ilguma`, `platuma`, `aprasymas`) VALUES
(1, 15, 'Kaunas', '0.000000', '0.000000', ''),
(2, 15, 'Vilnius', '0.000000', '0.000000', ''),
(3, 15, 'Panevėžys', '0.000000', '0.000000', ''),
(4, 15, 'Klaipėda', '0.000000', '0.000000', ''),
(5, 15, 'Šiauliai', '0.000000', '0.000000', ''),
(6, 15, 'Alytus', '0.000000', '0.000000', ''),
(7, 15, 'Tauragė', '0.000000', '0.000000', ''),
(8, 15, 'Telšiai', '0.000000', '0.000000', ''),
(9, 15, 'Ukmergė', '0.000000', '0.000000', ''),
(10, 15, 'Utena', '0.000000', '0.000000', ''),
(11, 15, 'Rokiškis', '0.000000', '0.000000', ''),
(12, 15, 'Raseiniai', '0.000000', '0.000000', ''),
(13, 15, 'Radviliškis', '0.000000', '0.000000', ''),
(14, 15, 'Šilutė', '0.000000', '0.000000', ''),
(15, 15, 'Ryga', '0.000000', '0.000000', ''),
(16, 15, 'Pasvalys', '0.000000', '0.000000', '');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `punktu_tipai`
--

CREATE TABLE `punktu_tipai` (
  `id` int(10) UNSIGNED NOT NULL,
  `pav` varchar(255) COLLATE utf16_lithuanian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_lithuanian_ci;

--
-- Sukurta duomenų kopija lentelei `punktu_tipai`
--

INSERT INTO `punktu_tipai` (`id`, `pav`) VALUES
(15, 'Miestas'),
(16, 'Miestelis\r\n');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `users`
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
  ADD KEY `id_2` (`id`),
  ADD KEY `id_punkto_tipo` (`id_punkto_tipo`);

--
-- Indexes for table `punktu_tipai`
--
ALTER TABLE `punktu_tipai`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `keliones_budai`
--
ALTER TABLE `keliones_budai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `keliones_marsruto_atkarpos`
--
ALTER TABLE `keliones_marsruto_atkarpos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lankymasis_punkte`
--
ALTER TABLE `lankymasis_punkte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `marsrutu_atkarpos`
--
ALTER TABLE `marsrutu_atkarpos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `priemones`
--
ALTER TABLE `priemones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `punktai`
--
ALTER TABLE `punktai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `punktu_tipai`
--
ALTER TABLE `punktu_tipai`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Apribojimai eksportuotom lentelėm
--

--
-- Apribojimai lentelei `keliones_marsruto_atkarpos`
--
ALTER TABLE `keliones_marsruto_atkarpos`
  ADD CONSTRAINT `keliones_marsruto_atkarpos_ibfk_1` FOREIGN KEY (`id_marsruto_atkarpos`) REFERENCES `marsrutu_atkarpos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `keliones_marsruto_atkarpos_ibfk_2` FOREIGN KEY (`id_keliones`) REFERENCES `keliones` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `keliones_marsruto_atkarpos_ibfk_3` FOREIGN KEY (`id_keliones_budo`) REFERENCES `keliones_budai` (`id`) ON UPDATE CASCADE;

--
-- Apribojimai lentelei `lankymasis_punkte`
--
ALTER TABLE `lankymasis_punkte`
  ADD CONSTRAINT `lankymasis_punkte_ibfk_1` FOREIGN KEY (`id_keliones`) REFERENCES `keliones` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `lankymasis_punkte_ibfk_2` FOREIGN KEY (`id_punkto`) REFERENCES `punktai` (`id`) ON UPDATE CASCADE;

--
-- Apribojimai lentelei `marsrutu_atkarpos`
--
ALTER TABLE `marsrutu_atkarpos`
  ADD CONSTRAINT `marsrutu_atkarpos_ibfk_1` FOREIGN KEY (`id_punkto1`) REFERENCES `punktai` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `marsrutu_atkarpos_ibfk_2` FOREIGN KEY (`id_punkto2`) REFERENCES `punktai` (`id`) ON UPDATE CASCADE;

--
-- Apribojimai lentelei `punktai`
--
ALTER TABLE `punktai`
  ADD CONSTRAINT `punktai_ibfk_1` FOREIGN KEY (`id_punkto_tipo`) REFERENCES `punktu_tipai` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
