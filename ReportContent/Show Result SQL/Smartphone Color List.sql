USE `smartphone`;
SELECT
	smartphone.image AS 'Image File',
	smartphone.color AS 'Color',
    
     CONCAT( 
		FORMAT( 
			smartphone_modifier.price, 0),
        ' VND'
	) AS 'Price',
    
	CONCAT(smartphone_modifier.ram, ' GB') AS 'RAM',
    
    CONCAT(
		IF(smartphone_modifier.rom % 1024 = 0,
			CONCAT(ROUND(smartphone_modifier.rom / 1024, 0), ' TB'),
            CONCAT(smartphone_modifier.rom, ' GB')
        ), ''
	) AS 'ROM'

FROM
	smartphone_model
    
LEFT JOIN smartphone_brand_series 	ON smartphone_model.brand_series_id 			= smartphone_brand_series.brand_series_id
LEFT JOIN smartphone_brand 			ON smartphone_brand_series.smartphone_brand_id 	= smartphone_brand.smartphone_brand_id
LEFT JOIN smartphone_modifier		ON smartphone_model.smartphone_model_id			= smartphone_modifier.smartphone_model_id
LEFT JOIN smartphone				ON smartphone_modifier.smartphone_modifier_id   = smartphone.smartphone_modifier_id

WHERE smartphone.smartphone_modifier_id = 2