USE smartphone;
INSERT INTO `smartphone`.`smartphone_model` (`brand_series_id`, `name`, `cpu_id`, `os_id`, `date_realeased`) 
	VALUES ('11', 'S10e', '49', '13', '2019-05-30');
    
INSERT INTO `smartphone`.`display` (`smartphone_model_id`, `display_type_id`, `size`, `resolution`, `ratio`, `pixel_density`, `feature_description`) 
	VALUES ('12', '7', '5.8', '2280 x 1080', '19:9', '438', 'HDR10+, Always-on display');
    
INSERT INTO `smartphone`.`camera` (`smartphone_model_id`, `feature_description`, `video_record_description`) 
	VALUES ('12', 'Dual Pixel PDAF, OIS, LED flash, Auto-HDR, Panorama, Dual video call', '2160p@60fps, 1080p@240fps, 720p@960fps, HDR, dual-video rec');
INSERT INTO `smartphone`.`front_camera` (`camera_id`, `resolution`, `aperture`, `focal_length`) VALUES ('12', '10', '1.9', '26');
INSERT INTO `smartphone`.`back_camera` (`camera_id`, `resolution`, `aperture`, `focal_length`) VALUES ('12', '12', '1.5', '26');
INSERT INTO `smartphone`.`back_camera` (`camera_id`, `resolution`, `aperture`, `focal_length`) VALUES ('12', '16', '2.2', '12');

INSERT INTO `smartphone`.`memory_card` (`smartphone_model_id`, `mem_card_type_id`, `mem_slot_type_id`, `max_capacity`) 
	VALUES ('12', '1', '3', '1024');
    
INSERT INTO `smartphone`.`sim` (`smartphone_model_id`, `sim_type_id`) VALUES ('12', '3');
#INSERT INTO `smartphone`.`sim` (`smartphone_model_id`, `sim_type_id`) VALUES ('12', '4');

INSERT INTO `smartphone`.`connection` (`smartphone_model_id`, `mobile_network`, `wlan_network`, `bluetooth`, `headphone_jack_type_id`) 
	VALUES ('12', '4G', 'Wi-Fi 802.11 a/b/g/n/ac/ax, dual-band, Wi-Fi Direct, hotspot', '5.0, A2DP, LE, aptX', '1');

INSERT INTO `smartphone`.`unlock_security` (`smartphone_model_id`, `security_type_id`) 
	VALUES ('12', '3');
    
INSERT INTO `smartphone`.`design` (`smartphone_model_id`, `body_protection_id`, `frame_protection_id`, `screen_protection_id`, `width`, `height`, `thickness`, `weight`, `feature_description`) 
	VALUES ('12', '3', '2', '5', '149.9', '70.4', '7.8', '157', 'IP68 dust/water proof (up to 1.5 meters for 30 mins)');
    
INSERT INTO `smartphone`.`battery` (`smartphone_model_id`, `battery_type_id`, `capacity`, `quick_charge_type_id`, `charging_port_id`, `feature_description`) 
	VALUES ('12', '1', '3100', '1', '2', 'Fast wireless charging 15W, Power bank/Reverse wireless charging 9W');
    
INSERT INTO `smartphone`.`smartphone_modifier` (`smartphone_model_id`, `ram`, `rom`, `price`) VALUES ('12', '6', '128', '15990000');

INSERT INTO `smartphone`.`smartphone` (`smartphone_modifier_id`, `color`, `image`) VALUES ('22', 'Prism Black', '636863622278818137_ss-galaxy-s10e-prism-black.png');









    