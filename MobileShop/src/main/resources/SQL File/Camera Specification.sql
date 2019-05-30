SELECT 
	CONCAT(
		(SELECT  
			GROUP_CONCAT(
				front_camera.resolution, ' MP f/', 
				front_camera.aperture, ' ',
				front_camera.focal_length, 'mm' 
				SEPARATOR ' + '
			)
		FROM front_camera
        GROUP BY camera_id
		), ' ' 
    ) AS 'Front Camera',
    
    CONCAT(
		(SELECT  
			GROUP_CONCAT(
				back_camera.resolution, ' MP f/', 
				back_camera.aperture, ' ',
				back_camera.focal_length, 'mm' 
				SEPARATOR ' + '
			)
		FROM back_camera
        GROUP BY camera_id
		), ' ' 
    ) AS 'Back Camera'
    



