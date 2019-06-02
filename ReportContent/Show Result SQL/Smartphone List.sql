USE `smartphone`;
SELECT
	smartphone.image AS 'Image',
    
	CONCAT(
		smartphone_brand.name, ' ',
		IF (smartphone_brand_series.series_name IS NOT NULL, 
			smartphone_brand_series.series_name, 
            ''
		), ' ',
        smartphone_model.name
	) AS 'Name',
    
    CONCAT( 
		FORMAT( 
			MIN(smartphone_modifier.price), 0),
        ' VND'
	) AS 'Price',
    
    smartphone_model.smartphone_model_id AS 'Model ID',
    smartphone_modifier.smartphone_modifier_id AS 'Modifier ID'


FROM
	smartphone_model
    
LEFT JOIN smartphone_brand_series 	ON smartphone_model.brand_series_id 			= smartphone_brand_series.brand_series_id
LEFT JOIN smartphone_brand 			ON smartphone_brand_series.smartphone_brand_id 	= smartphone_brand.smartphone_brand_id
LEFT JOIN smartphone_modifier		ON smartphone_model.smartphone_model_id			= smartphone_modifier.smartphone_model_id
LEFT JOIN smartphone				ON smartphone_modifier.smartphone_modifier_id   = smartphone.smartphone_modifier_id

#WHERE smartphone_model.smartphone_model_id = 2

GROUP BY smartphone_modifier.smartphone_model_id
ORDER BY smartphone_model.date_realeased DESC -- , smartphone_model.smartphone_model_id ASC
