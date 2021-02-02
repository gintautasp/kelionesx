
-- buvo:

	SELECT 
		*
		, `lankymasis_punkte`.`aprasymas` AS `lpaprasymas`, `punktai`.`aprasymas` AS `puaprasymas`
		, `punktai`.`pav` AS `pupav`, `marsrutu_atkarpos`.`pav` AS `mapav`
		, `keliones_marsruto_atkarpos`.`aprasymas` AS `kma_aprasymas`
		, `keliones_marsruto_atkarpos`.`data_laikas` AS `kma_data_laikas`
		, `keliones_marsruto_atkarpos`.`trukme` AS `kma_trukme`
		, `keliones`.`aprasymas` AS `k_aprasymas`
		, `lankymasis_punkte`.`data_laikas` AS `lp_data_laikas` 
	FROM 
		`lankymasis_punkte` 
		
	LEFT JOIN `punktai` ON ( 

		`lankymasis_punkte`.`id_punkto`=`punktai`.`id` 
	) 
	LEFT JOIN `keliones_marsruto_atkarpos` ON ( 

		`lankymasis_punkte`.`id_keliones`=`keliones_marsruto_atkarpos`.`id_keliones` 
	) 
	LEFT JOIN `marsrutu_atkarpos` ON ( 

			`marsrutu_atkarpos`.`id_punkto1`=`punktai`.`id` 
		AND 
			`marsrutu_atkarpos`.`id`=`keliones_marsruto_atkarpos`.`id_marsruto_atkarpos` 
	) 
	LEFT JOIN 
		`keliones` ON ( 
			`keliones`.`id`=`lankymasis_punkte`.`id_keliones` 
	) 
	WHERE 
			1 
		AND 
			`lankymasis_punkte`.`id_keliones`= '1'
		
-- siuloma:

	SELECT 
		*
	
	FROM `keliones_marsruto_atkarpos`
	
	LEFT JOIN `marsrutu_atkarpos` ON ( 	
	
		`marsrutu_atkarpos`.`id`=`keliones_marsruto_atkarpos`.`id_marsruto_atkarpos` 
	)
	LEFT JOIN `lankymasis_punkte` ON ( 

			`marsrutu_atkarpos`.`id_punkto1`=`lankymasis_punkte`.`id_punkto`
	)
	LEFT JOIN `punktai` ON ( 

		`lankymasis_punkte`.`id_punkto`=`punktai`.`id` 
	) 
	LEFT JOIN 
		`keliones` ON ( 
			`keliones`.`id`=`lankymasis_punkte`.`id_keliones` 
	)
	WHERE 
			1 
		AND 
			`keliones_marsruto_atkarpos`.`id_keliones`= '1'