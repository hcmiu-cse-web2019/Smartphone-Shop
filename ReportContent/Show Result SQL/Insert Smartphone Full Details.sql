USE smartphone;
INSERT INTO `smartphone`.`smartphone_model` (`brand_series_id`, `name`, `cpu_id`, `os_id`, `date_released`) 
	VALUES ('11', 'S9', '48', '16', '2018-03-10');
    
INSERT INTO `smartphone`.`display` (`smartphone_model_id`, `display_type_id`, `size`, `resolution`, `ratio`, `pixel_density`, `feature_description`) 
	VALUES ('16', '6', '5.8', '2960 x 1440', '18.5:9', '570', 'HDR 10, 3D Touch (home button only), Always-on display');
    
INSERT INTO `smartphone`.`camera` (`smartphone_model_id`, `feature_description`, `video_record_description`) 
	VALUES ('16', 'AF, Dual Pixel PDAF, OIS, LED flash, Auto-HDR, Panorama, Dual video call', '2160p@60fps, 1440p@30fps, 1080p@240fps, 720p@960fps, HDR, dual-video rec');
INSERT INTO `smartphone`.`front_camera` (`camera_id`, `resolution`, `aperture`, `focal_length`) VALUES ('16', '8', '1.7', '25');
-- INSERT INTO `smartphone`.`back_camera` (`camera_id`, `resolution`, `aperture`, `focal_length`) VALUES ('16', '12', '2.4', '52');
INSERT INTO `smartphone`.`back_camera` (`camera_id`, `resolution`, `aperture`, `focal_length`) VALUES ('16', '12', '1.5', '26');

INSERT INTO `smartphone`.`memory_card` (`smartphone_model_id`, `mem_card_type_id`, `mem_slot_type_id`, `max_capacity`) 
	VALUES ('16', '1', '3', '400');
    
INSERT INTO `smartphone`.`sim` (`smartphone_model_id`, `sim_type_id`) VALUES ('16', '3');
#INSERT INTO `smartphone`.`sim` (`smartphone_model_id`, `sim_type_id`) VALUES ('16', '4');

INSERT INTO `smartphone`.`connection` (`smartphone_model_id`, `mobile_network`, `wlan_network`, `bluetooth`, `headphone_jack_type_id`) 
	VALUES ('16', '3G, 4G LTE Cat 18', 'Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot', '5.0, A2DP, LE, aptX', '1');

INSERT INTO `smartphone`.`unlock_security` (`smartphone_model_id`, `security_type_id`) 
	VALUES ('16', '1');
INSERT INTO `smartphone`.`unlock_security` (`smartphone_model_id`, `security_type_id`) 
	VALUES ('16', '6');
INSERT INTO `smartphone`.`unlock_security` (`smartphone_model_id`, `security_type_id`) 
	VALUES ('16', '8');
    
INSERT INTO `smartphone`.`design` (`smartphone_model_id`, `body_protection_id`, `frame_protection_id`, `screen_protection_id`, `width`, `height`, `thickness`, `weight`, `feature_description`) 
	VALUES ('16', '3', '2', '4', '147.7', '68.7', '8.5', '163', 'IP68 dust/water proof (up to 1.5 meters for 30 mins)');
    
INSERT INTO `smartphone`.`battery` (`smartphone_model_id`, `battery_type_id`, `capacity`, `quick_charge_type_id`, `charging_port_id`, `feature_description`) 
	VALUES ('16', '1', '3000', '7', '2', 'Qi/PMA wireless charging');
    
INSERT INTO `smartphone`.`smartphone_modifier` (`smartphone_model_id`, `ram`, `rom`, `price`) VALUES ('16', '4', '64', '16490000');

INSERT INTO `smartphone`.`smartphone` (`smartphone_modifier_id`, `color`, `image`) VALUES ('28', 'Midnight Black', '0fbefc4b1acd8f5e8a3d0443c267154e-ss-galaxy-s9-midnight-black.png');





    