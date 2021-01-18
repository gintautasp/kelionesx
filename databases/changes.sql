ALTER TABLE `keliones`  ADD `data` VARCHAR(255) NOT NULL  AFTER `pav`,  ADD `laikas` VARCHAR(255) NOT NULL  AFTER `data`,  ADD `trukme` VARCHAR(255) NOT NULL  AFTER `laikas`;

ALTER TABLE `punktai` CHANGE `aprasymas` `aprasymas` VARCHAR(255) NOT NULL; 
