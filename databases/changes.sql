ALTER TABLE `keliones`  ADD `data` VARCHAR(255) NOT NULL  AFTER `pav`,  ADD `laikas` VARCHAR(255) NOT NULL  AFTER `data`,  ADD `trukme` VARCHAR(255) NOT NULL  AFTER `laikas`;

ALTER TABLE `lankymasis_punkte` CHANGE `aprasymas` `aprasymas` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL; 

ALTER TABLE `keliones_marsruto_atkarpos` ADD `atkrapos_numeris` INT(225) NOT NULL AFTER `trukme`; 

ALTER TABLE `punktai` ADD `id_punkto_tipo` INT UNSIGNED NULL DEFAULT NULL AFTER `id`, ADD INDEX (`id_punkto_tipo`);

ALTER TABLE `punktai` ADD FOREIGN KEY (`id_punkto_tipo`) REFERENCES `punktu_tipai`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
