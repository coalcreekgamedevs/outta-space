
if (pause) {
	list = median(0, list - ((0.05 + list) * 0.1), 1);
	pause_pull[0] = median(0, pause_pull[0] + ((1.1 - pause_pull[0]) * 0.1), 1);
	if (pause_menu > 0) {
		pause_pull[1] = median(0, pause_pull[1] + ((1.1 - pause_pull[1]) * 0.1), 1);
	} else {
		pause_pull[1] = median(0, pause_pull[1] - ((0.1 + pause_pull[1]) * 0.1), 1);
	}
	if (keyboard_check_pressed(vk_escape)) {
		if (pause_menu != 4) {
			pause_menu = 4;
			pause_option = 0;
		} else {
			game_end();
		}
	}
	if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)) {
		switch(pause_menu) {
			//Main Menu
			case 0:
				switch(pause_option) {
					//Resume
					case 0:
						pause = 0;
						break;
					//Options Menu
					case 1:
						pause_menu = 1;
						pause_option = 0;
						break;
					//Achievements
					case 2:
						pause_menu = 2;
						pause_option = 0;
						break;
					//Main Menu
					case 3:
						pause_menu = 3;
						pause_option = 0;
						break;
					//Quit
					case 4:
						pause_menu = 4;
						pause_option = 0;
						break;
				}
				break;
			//Options
			case 1:
				switch(pause_option) {
					//Back
					case 0:
						pause_menu = 0;
						pause_option = 1;
						break;
					//Fullscreen
					case 1:
						if (window_get_fullscreen()) {
							window_set_fullscreen(0);
							window_set_size(960, 540);
							window_center();
						} else {
							window_set_fullscreen(1);	
						}
						ini_open(working_directory + "game.ini");
							ini_write_real("options", "fullscreen", window_get_fullscreen());
						ini_close();
						break;
					//Music
					case 2:
						if (all_music) {
							all_music = 0;
						} else {
							all_music = 1;
						}
						ini_open(working_directory + "game.ini");
							ini_write_real("options", "music", all_music);
						ini_close();
						break;
					//Sound
					case 3:
						if (all_sound) {
							all_sound = 0;
						} else {
							all_sound = 1;	
						}
						ini_open(working_directory + "game.ini");
							ini_write_real("options", "sound", all_sound);
						ini_close();
						break;
					//Controls
					case 4:
						if (scheme) {
							scheme = 0;
						} else {
							scheme = 1;	
						}
						switch(scheme) {
							case 0:
								key_up = ord("W"); //Up
								key_down = ord("S"); //Down
								key_left = ord("A"); //Left
								key_right = ord("D"); //Right
								key_drop = ord("K"); //Drop
								key_tractor = vk_space; //Tractor
								key_dash = ord("L"); //Rush
								key_list = ord("I"); //List
								break;
							case 1:
								key_up = vk_up; //Up
								key_down = vk_down; //Down
								key_left = vk_left; //Left
								key_right = vk_right; //Right
								key_drop = ord("D"); //Drop
								key_tractor = vk_space; //Tractor
								key_dash = ord("S"); //Rush
								key_list = ord("E"); //List
								break;
						}
						ini_open(working_directory + "game.ini");
							ini_write_real("options", "controls", scheme);
						ini_close();
						break;
				}
				break;
			//Extras
			case 2:
				switch(pause_option) {
					//Back
					case 0:
						pause_menu = 0;
						pause_option = 2;
						break;
					//Achievements
					case 1:
						//We'll place a horizontal selector here
						break;
				}
				break;
			//Main Menu
			case 3:
				switch(pause_option) {
					//No
					case 0:
						pause_menu = 0;
						pause_option = 3;
						break;
					//Yes
					case 1:
						//Main menu when it is done
						break;
				}
				break;
			//Quit
			case 4:
				switch(pause_option) {
					//No
					case 0:
						pause_menu = 0;
						pause_option = 4;
						break;
					//Yes
					case 1:
						game_end();
						break;
				}
				break;
		}
	}
	if (pause_menu = 1 && pause_option = 4) {
		scheme_animation = median(0, scheme_animation + ((1.1 - scheme_animation) * 0.1), 1);
	} else {
		scheme_animation = median(0, scheme_animation - ((0.1 + scheme_animation) * 0.1), 1);
	}
	switch(scheme) {
		case 0:
			scheme_jump[0] = median(0, scheme_jump[0] + ((1.1 - scheme_jump[0]) * 0.1), 1);
			scheme_jump[1] = median(0, scheme_jump[1] - ((0.1 + scheme_jump[1]) * 0.1), 1);
			break;
		case 1:
			scheme_jump[0] = median(0, scheme_jump[0] - ((0.1 + scheme_jump[0]) * 0.1), 1);
			scheme_jump[1] = median(0, scheme_jump[1] + ((1.1 - scheme_jump[1]) * 0.1), 1);
			break;
	}
	yd = (keyboard_check(key_down) - keyboard_check(key_up));
	if (pause_option_timer > 0) {
		pause_option_timer -= 1;	
	} else if (yd != 0) {
		pause_option_timer = pause_timer_duration;
		pause_option += yd;
		if (pause_option < 0) {
			pause_option = pause_options[pause_menu];
		} else if (pause_option > pause_options[pause_menu]) {
			pause_option = 0;
		}
	}
	if (pause_menu_sec != pause_menu && pause_menu != 0) {
		pause_menu_sec = pause_menu;
	}
} else {
	for(i = 0; i <= 1; i++) {
		pause_pull[i] = median(0, pause_pull[i] - ((0.1 + pause_pull[i]) * 0.1), 1);	
	}

if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_escape)) {
	if (pause_pull[0] + pause_pull[1] = 0 && dock = 0) {
		pause = 1;
	}
}
if (keyboard_check_pressed(ord("R"))) {
	room_restart();
}
/*
if (keyboard_check_pressed(ord("F"))) {
	if (window_get_fullscreen()) {
		window_set_fullscreen(0);
		window_set_size(960, 540);
		window_center();
	} else {
		window_set_fullscreen(1);	
	}
}
*/

if (disable_tractor && dock = 0) {
	dock_time = median(0, dock_time + ((1.1 - dock_time) * 0.1), 1);
	if (keyboard_check_pressed(key_tractor)) {
		dock = 1;
	}
} else {
	dock_time = median(0, dock_time - ((0.1 + dock_time) * 0.1), 1);
}

	if (dock) {
		if (obj_ufo.image_index < 4) {
			obj_ufo.image_index += 0.2;	
		}
		if (keyboard_check_pressed(vk_escape)) {
			dock = 0;
		}
		obj_ufo.xSpd = 0;
		obj_ufo.ySpd = 0;
		var _pd = point_distance(obj_ufo.x, obj_ufo.y, obj_mothership.x, obj_mothership.y);
		var _pdir = point_direction(obj_ufo.x, obj_ufo.y, obj_mothership.x, obj_mothership.y);
		if (_pd > 4) {
			obj_ufo.x += lengthdir_x(_pd / 10, _pdir);
			obj_ufo.y += lengthdir_y(_pd / 10, _pdir);
		}
	} else {
		if (obj_ufo.image_index > 0.4) {
			obj_ufo.image_index -= 0.2;
		}
	}

	if (keyboard_check(key_list)) {
		list = median(0, list + ((1.05 - list) * 0.1), 1);
	} else {
		list = median(0, list - ((0.05 + list) * 0.1), 1);
	}
	
}
//Take a screenshot
if (keyboard_check_pressed(ord("Q"))) {
	screen_save(working_directory + "Screens/screenshot_" + string(next_sshot) + ".png");
	next_sshot += 1;
	ini_open(working_directory + "game.ini");
		ini_write_real("data", "screens", next_sshot);
	ini_close();
}

flow += 1;
if (flow >= 100000000) {
	flow = 0;
}
if (instance_exists(obj_ufo)) {
	var x_mlt = 22 - (pause * 15),
		y_mlt = 10 - (pause * 8);
	var pdist = point_distance(x, y, obj_ufo.x + (obj_ufo.xSpd * x_mlt) - (100 * list), obj_ufo.y + (obj_ufo.ySpd * y_mlt));
	var pdir = point_direction(x, y, obj_ufo.x + (obj_ufo.xSpd * x_mlt) - (100 * list), obj_ufo.y + (obj_ufo.ySpd * y_mlt));
	if (pdist > 1 || shake > 0) {
		var pull = 20;
		x += lengthdir_x(pdist / pull, pdir) + (shake * shake_flip * irandom(3));
		y += lengthdir_y(pdist / pull, pdir) + (shake * shake_flip * irandom(3));
	}
	if (instance_exists(obj_mothership)) {
		with(obj_mothership) {
			if (instance_place(obj_mothership.x, obj_mothership.y, obj_ufo)) {
				disable_tractor = 1;
			} else {
				disable_tractor = 0;
			}
		}
	} else {
		disable_tractor = 0;
	}
}

x = clamp(x, 240, room_width - 240);
y = clamp(y, 135, room_height - 135);
shake = median(0, shake - 0.5, 5);
shake_flip *= -1;
new_pickup = median(0, new_pickup - ((0.1 + new_pickup) * 0.05), 1);