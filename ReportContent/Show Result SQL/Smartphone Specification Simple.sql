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
    
	CONCAT(
		display_type.name, ', ',
        display.size, ' inch, ',
        display.resolution 
	) AS 'Display',
    
	CONCAT(
		(SELECT DISTINCT  
			GROUP_CONCAT(
				front_camera.resolution, ' MP'
				SEPARATOR ' + '
			)
		FROM front_camera
        WHERE camera.camera_id = front_camera.camera_id
        GROUP BY front_camera.camera_id
		), ' ' 
    ) AS 'Front Camera',
    
    CONCAT(
		(SELECT DISTINCT  
			GROUP_CONCAT(
				back_camera.resolution, ' MP'
				SEPARATOR ' + '
			)
		FROM back_camera
        WHERE camera.camera_id = back_camera.camera_id
        GROUP BY back_camera.camera_id
		), ' ' 
    ) AS 'Back Camera',
    
    CONCAT(
		os_stock_type.name, ' ',
        os_stock_type.version, ' (',
        os_modifier_type.name,
        IF (os_modifier_type.version IS NOT NULL, 
			CONCAT(' ', os_modifier_type.version),
            ''),
        ')'
    ) AS 'Operating System',
    
    CONCAT(
		cpu_brand.name, ' ', cpu.name
    ) AS 'CPU',
    
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
        'No' 
	) AS 'Memory Card',
    
	CONCAT(
		connection.mobile_network, ' (',
		GROUP_CONCAT(DISTINCT sim_type.name SEPARATOR ', '), ')'
	) AS 'SIM',

    CONCAT(
		battery_type.name, ' ', 
		battery.capacity, ' mAh',
        IF (quick_charge_type.name IS NOT NULL,
			CONCAT(', ', quick_charge_type.name),
			''
		) 
	) AS 'Battery'

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
LEFT JOIN os_stock_type				ON operating_system.os_stock_type_id			= os_stock_type.os_stock_type_id
LEFT JOIN os_modifier_type			ON operating_system.os_mod_type_id				= os_modifier_type.os_mod_type_id

LEFT JOIN cpu						ON smartphone_model.cpu_id						= cpu.cpu_id
LEFT JOIN cpu_brand 				ON cpu.cpu_brand_id 							= cpu_brand.cpu_brand_id

LEFT JOIN memory_card	 			ON smartphone_model.smartphone_model_id			= memory_card.smartphone_model_id
LEFT JOIN memory_card_type			ON memory_card.mem_card_type_id					= memory_card_type.mem_card_type_id
LEFT JOIN memory_slot_type			ON memory_card.mem_slot_type_id					= memory_slot_type.mem_slot_type_id

LEFT JOIN sim						ON smartphone_model.smartphone_model_id			= sim.smartphone_model_id
LEFT JOIN sim_type					ON sim.sim_type_id								= sim_type.sim_type_id	
LEFT JOIN connection				ON smartphone_model.smartphone_model_id			= connection.smartphone_model_id

LEFT JOIN unlock_security 			ON smartphone_model.smartphone_model_id			= unlock_security.smartphone_model_id

LEFT JOIN battery					ON smartphone_model.smartphone_model_id			= battery.smartphone_model_id
LEFT JOIN battery_type				ON battery.battery_type_id						= battery_type.battery_type_id
LEFT JOIN quick_charge_type			ON battery.quick_charge_type_id					= quick_charge_type.quick_charge_type_id

GROUP BY sim.smartphone_model_id, unlock_security.smartphone_model_id