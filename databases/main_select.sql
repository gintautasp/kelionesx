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
			
			
SELECT 
	*
	, `lankymasis_punkte`.`aprasymas` AS `lpaprasymas`
	, `punktai`.`aprasymas` AS `puaprasymas`
	, `punktai`.`pav` AS `pupav`
	, `punktai2`.`pav` AS `pupav2`
	, `marsrutu_atkarpos`.`pav` AS `mapav`
	, `keliones_marsruto_atkarpos`.`aprasymas` AS `kma_aprasymas`
	, `keliones_marsruto_atkarpos`.`data_laikas` AS `kma_data_laikas`
	, `keliones_marsruto_atkarpos`.`trukme` AS `kma_trukme`
	,`keliones`.`aprasymas` AS `k_aprasymas`
	, `lankymasis_punkte`.`data_laikas` AS `lp_data_laikas`
	, `lankymasis_punkte`.`id` AS `id_lankymosi_punkte`
	, `keliones`.`pav` AS `kel_pav`
	, `keliones_marsruto_atkarpos`.`id` AS `id_keliones_marsruto_atkarpos`
	, `keliones`.`data` AS `kel_data`
	, `keliones`.`laikas` AS `kel_laikas`
	, `keliones`.`trukme` AS `kel_trukme`
	, `punktai`.`id` AS `id_punkto2`  
	, `lankymasis_punkte`.`trukme` AS `lp_trukme`
FROM `keliones_marsruto_atkarpos` 
LEFT JOIN `marsrutu_atkarpos` ON ( `marsrutu_atkarpos`.`id`=`keliones_marsruto_atkarpos`.`id_marsruto_atkarpos` )
LEFT JOIN `lankymasis_punkte` ON ( `keliones_marsruto_atkarpos`.`id_keliones`=`lankymasis_punkte`.`id_keliones` AND `marsrutu_atkarpos`.`id_punkto2`=`lankymasis_punkte`.`id_punkto`) 
LEFT JOIN `punktai` ON ( `lankymasis_punkte`.`id_punkto`=`punktai`.`id` )  
LEFT JOIN `punktai` AS `punktai2` ON ( `marsrutu_atkarpos`.`id_punkto2`=`punktai2`.`id` )  
LEFT JOIN `keliones` ON ( `keliones`.`id`=`lankymasis_punkte`.`id_keliones` ) 
WHERE 
		1 
	AND 
		`keliones_marsruto_atkarpos`.`id_keliones`= '1'	


dabartine galutine:

SELECT *, `lankymasis_punkte`.`aprasymas` AS `lpaprasymas`, `punktai`.`aprasymas` AS `puaprasymas`, `punktai`.`pav` AS `pupav`, `punktai2`.`pav` AS `pupav2`,
`marsrutu_atkarpos`.`pav` AS `mapav`, `keliones_marsruto_atkarpos`.`aprasymas` AS `kma_aprasymas`, `keliones_marsruto_atkarpos`.`data_laikas` AS `kma_data_laikas`, 
`keliones_marsruto_atkarpos`.`trukme` AS `kma_trukme`, `keliones`.`aprasymas` AS `k_aprasymas`, `lankymasis_punkte`.`data_laikas` AS `lp_data_laikas`, 
`lankymasis_punkte`.`id` AS `id_lankymosi_punkte`, `keliones`.`pav` AS `kel_pav`, `keliones_marsruto_atkarpos`.`id` AS `id_keliones_marsruto_atkarpos`,
`keliones`.`data` AS `kel_data`, `keliones`.`laikas` AS `kel_laikas`, `keliones`.`trukme` AS `kel_trukme`, `punktai`.`id` AS `id_punkto1`  
FROM `keliones_marsruto_atkarpos` 
LEFT JOIN `marsrutu_atkarpos` ON ( `marsrutu_atkarpos`.`id`=`keliones_marsruto_atkarpos`.`id_marsruto_atkarpos` )
LEFT JOIN `lankymasis_punkte` ON ( 
--    `keliones_marsruto_atkarpos`.`id_keliones`=`lankymasis_punkte`.`id_keliones` 
    	`keliones_marsruto_atkarpos`.`id`=`lankymasis_punkte`.`id_keliones_marsruto_atkarpos`
    AND 
    	( 
    		IF(`flag_is2_i1`,`marsrutu_atkarpos`.`id_punkto1`,`marsrutu_atkarpos`.`id_punkto2`)=`lankymasis_punkte`.`id_punkto` 
        )
            
) 
LEFT JOIN `punktai` ON ( `lankymasis_punkte`.`id_punkto`=`punktai`.`id` )  
LEFT JOIN `punktai` AS `punktai2` ON ( `marsrutu_atkarpos`.`id_punkto2`=`punktai2`.`id` )  
LEFT JOIN `keliones` ON ( `keliones`.`id`=`lankymasis_punkte`.`id_keliones` ) 
WHERE 1 AND `keliones_marsruto_atkarpos`.`id_keliones`= '1'
ORDER BY `atkrapos_numeris`