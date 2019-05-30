USE smartphone;
INSERT INTO `smartphone`.`smartphone_model` (`brand_series_id`, `name`, `cpu_id`, `os_id`, `date_realeased`) 
	VALUES ('1', '6s Plus', '82', '9', '2015-03-08');
    
INSERT INTO `smartphone`.`display` (`smartphone_model_id`, `display_type_id`, `size`, `resolution`, `ratio`, `pixel_density`, `feature_description`) 
	VALUES ('9', '8', '5.5', '1920 x 1080', '16:9', '401', '3D Touch display');
    
INSERT INTO `smartphone`.`camera` (`smartphone_model_id`, `feature_description`, `video_record_description`) 
	VALUES ('9', 'OIS, PDAF, Dual-LED dual-tone flash, HDR, Face detection, Panorama', '2160p@30fps, 1080p@60fps, 1080p@120fps, 720p@240fps');
INSERT INTO `smartphone`.`front_camera` (`camera_id`, `resolution`, `aperture`, `focal_length`) VALUES ('9', '5', '2.2', '31');
INSERT INTO `smartphone`.`back_camera` (`camera_id`, `resolution`, `aperture`, `focal_length`) VALUES ('9', '12', '2.2', '29');
#INSERT INTO `smartphone`.`back_camera` (`camera_id`, `resolution`, `aperture`, `focal_length`) VALUES ('9', '12', '1.8', '28');

INSERT INTO `smartphone`.`memory_card` (`smartphone_model_id`, `mem_card_type_id`, `mem_slot_type_id`, `max_capacity`) 
	VALUES ('9', null, '2', null);
    
INSERT INTO `smartphone`.`sim` (`smartphone_model_id`, `sim_type_id`) VALUES ('9', '3');
#INSERT INTO `smartphone`.`sim` (`smartphone_model_id`, `sim_type_id`) VALUES ('9', '4');

INSERT INTO `smartphone`.`connection` (`smartphone_model_id`, `mobile_network`, `wlan_network`, `bluetooth`, `headphone_jack_type_id`) 
	VALUES ('9', '3G, 4G LTE Cat 6', 'Wi-Fi 802.11 a/b/g/n/ac, dual-band, hotspot', '4.2, A2DP, LE', '1');

INSERT INTO `smartphone`.`unlock_security` (`smartphone_model_id`, `security_type_id`) 
	VALUES ('9', '3');
    
INSERT INTO `smartphone`.`design` (`smartphone_model_id`, `body_protection_id`, `frame_protection_id`, `screen_protection_id`, `width`, `height`, `thickness`, `weight`, `feature_description`) 
	VALUES ('9', '2', '2', '7', '158.2', '77.9', '7.3', '192', null);
    
INSERT INTO `smartphone`.`battery` (`smartphone_model_id`, `battery_type_id`, `capacity`, `quick_charge_type_id`, `charging_port_id`, `feature_description`) 
	VALUES ('9', '1', '2750', null, '3', null);
    
INSERT INTO `smartphone`.`smartphone_modifier` (`smartphone_model_id`, `ram`, `rom`, `price`) VALUES ('9', '2', '32', '8780000');
-- INSERT INTO `smartphone`.`smartphone_modifier` (`smartphone_model_id`, `ram`, `rom`, `price`) VALUES ('9', '3', '128', '13490000');
-- INSERT INTO `smartphone`.`smartphone_modifier` (`smartphone_model_id`, `ram`, `rom`, `price`) VALUES ('9', '2', '256', '15490000');

INSERT INTO `smartphone`.`smartphone` (`smartphone_modifier_id`, `color`, `image`) VALUES ('17', 'Black', '90375518604b6972d727430c3bef8a24-iphone6s-plus-gold.png');
INSERT INTO `smartphone`.`smartphone` (`smartphone_modifier_id`, `color`, `image`) VALUES ('17', 'Gold', 'ca3dd1e04421065a3f08605aba97dfae-iphone6s-plus-rose-gold.png');








    