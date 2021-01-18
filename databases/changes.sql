ALTER TABLE `keliones`  ADD `data` VARCHAR(255) NOT NULL  AFTER `pav`,  ADD `laikas` VARCHAR(255) NOT NULL  AFTER `data`,  ADD `trukme` VARCHAR(255) NOT NULL  AFTER `laikas`;

ALTER TABLE `lankymasis_punkte` CHANGE `aprasymas` `aprasymas` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL; 
