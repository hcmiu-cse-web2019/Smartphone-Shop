USE `smartphone`;
SELECT
	CONCAT(
		smartphone_brand.name, ' ',
		IF (smartphone_brand_series.series_name IS NOT NULL, 
			smartphone_brand_series.series_name, 
            ''
		), ' ',
        smartphone_model.name
	) AS 'Name',
    
	display_type.name AS 'Display Type',
    display.size AS 'Display Size',
    display.ratio AS 'Ratio',
    display.resolution AS 'Resolution',
	display.feature_description AS 'Display Description',
    
	CONCAT(
		(SELECT DISTINCT  
			GROUP_CONCAT(
				front_camera.resolution, ' MP f/', 
				front_camera.aperture, ' ',
				front_camera.focal_length, 'mm' 
				SEPARATOR ' + '
			)
		FROM front_camera
        GROUP BY front_camera.camera_id
		), ' ' 
    ) AS 'Front Camera',
    
    CONCAT(
		(SELECT DISTINCT  
			GROUP_CONCAT(
				back_camera.resolution, ' MP f/', 
				back_camera.aperture, ' ',
				back_camera.focal_length, 'mm' 
				SEPARATOR ' + '
			)
		FROM back_camera
        GROUP BY back_camera.camera_id
		), ' ' 
    ) AS 'Back Camera',
    
    camera.feature_description AS 'Camera Feature',
    
    CONCAT(
		os_stock_type.name, ' ',
        os_stock_version.version, ' (',
        os_modifier_type.name,
        IF (os_modifier_version.version IS NOT NULL, 
			CONCAT(' ', os_modifier_version.version),
            ''),
        ')'
    ) AS 'Operating System',
    
    CONCAT(
		cpu_brand.name, ' ', cpu.name
    ) AS 'CPU',

    cpu.frequency AS 'Core Frequency',
    integrated_gpu.name AS 'GPU',
    
	IF (EXISTS (SELECT memory_card.smartphone_model_id FROM memory_card),
		CONCAT(
			IF (memory_card.mem_card_type_id IS NOT NULL,
				CONCAT(memory_card_type.name, ' ', memory_card.max_capacity, ' GB'),
                ''
            ),
            IF (memory_card.mem_slot_type_id IS NOT NULL,
				memory_slot_type.name,
                ''
            )
        ),
        '' 
	) AS 'Memory Card',
    
	CONCAT(
		(SELECT DISTINCT  
			GROUP_CONCAT(
				sim_type.name
				SEPARATOR ', '
			)
		GROUP BY sim.smartphone_model_id
		), ' ' 
    ) AS 'SIM',
    
    connection.mobile_network AS 'Mobile Network',
    connection.wlan_network AS 'WLAN',
    connection.bluetooth AS 'Bluetooth',
    headphone_jack_type.name AS 'Headphone Jack'
	
	
    
FROM
	smartphone_model
    
LEFT JOIN smartphone_brand_series 	ON smartphone_model.brand_series_id 			= smartphone_brand_series.brand_series_id
LEFT JOIN smartphone_brand 			ON smartphone_brand_series.smartphone_brand_id 	= smartphone_brand.smartphone_brand_id
LEFT JOIN display					ON smartphone_model.smartphone_model_id			= display.smartphone_model_id
LEFT JOIN display_type				ON display.display_type_id						= display_type.display_type_id
LEFT JOIN camera					ON smartphone_model.smartphone_model_id			= camera.smartphone_model_id
#LEFT JOIN front_camera				ON camera.camera_id								= front_camera.camera_id
#LEFT JOIN back_camera				ON camera.camera_id								= back_camera.camera_id
LEFT JOIN operating_system			ON smartphone_model.os_id						= operating_system.os_id
LEFT JOIN os_stock_version			ON operating_system.os_stock_version_id			= os_stock_version.os_stock_version_id
LEFT JOIN os_stock_type				ON os_stock_version.os_stock_type_id			= os_stock_type.os_stock_type_id
LEFT JOIN os_modifier_version		ON operating_system.os_mod_version_id			= os_modifier_version.os_mod_version_id
LEFT JOIN os_modifier_type			ON os_modifier_version.os_mod_type_id			= os_modifier_type.os_mod_type_id
LEFT JOIN cpu						ON smartphone_model.cpu_id						= cpu.cpu_id
LEFT JOIN cpu_brand 				ON cpu.cpu_brand_id 							= cpu_brand.cpu_brand_id
LEFT JOIN integrated_gpu 			ON cpu.igpu_id 									= integrated_gpu.igpu_id
LEFT JOIN memory_card	 			ON smartphone_model.smartphone_model_id			= memory_card.smartphone_model_id
LEFT JOIN memory_card_type			ON memory_card.mem_card_type_id					= memory_card_type.mem_card_type_id
LEFT JOIN memory_slot_type			ON memory_card.mem_slot_type_id					= memory_slot_type.mem_slot_type_id
LEFT JOIN sim						ON smartphone_model.smartphone_model_id			= sim.smartphone_model_id
LEFT JOIN sim_type					ON sim.sim_type_id								= sim_type.sim_type_id	
LEFT JOIN connection				ON smartphone_model.smartphone_model_id			= connection.smartphone_model_id
LEFT JOIN headphone_jack_type		ON connection.headphone_jack_type_id			= headphone_jack_type.headphone_jack_type_id 