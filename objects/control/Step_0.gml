
if (pause) {
	pause_pull[0] = median(0, pause_pull[0] + ((1.1 - pause_pull[0]) * 0.1), 1);
	if (pause_menu > 0) {
		pause_pull[1] = median(0, pause_pull[1] + ((1.1 - pause_pull[1]) * 0.1), 1);
	} else {
		pause_pull[1] = median(0, pause_pull[1] - ((-0.1 + pause_pull[1]) * 0.1), 1);
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
						break;
					//Music
					case 2:
						
						break;
					//Sound
					case 3:
						
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
	yd = (keyboard_check(vk_down) - keyboard_check(vk_up));
	if (pause_option_timer > 0) {
		pause_option_timer -= 1;	
	} else {
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
		pause_pull[i] = median(0, pause_pull[i] - ((-0.1 + pause_pull[i]) * 0.1), 1);	
	}

if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_escape)) {
	if (pause_pull[0] + pause_pull[1] > 0) {
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

}
//Take a screenshot
if (keyboard_check_pressed(ord("Q"))) {
	screen_save(working_directory + "Screens\screenshot_" + string(next_sshot) + ".png");
	next_sshot += 1;
	ini_open("game.ini");
		ini_write_real("data", "screens", next_sshot);
	ini_close();
}

flow += 1;
if (flow >= 1000000) {
	flow = 0;
}
if (instance_exists(obj_ufo)) {
	var x_mlt = 22 - (pause * 15),
		y_mlt = 10 - (pause * 8);
	var pdist = point_distance(x, y, obj_ufo.x + (obj_ufo.xSpd * x_mlt), obj_ufo.y + (obj_ufo.ySpd * y_mlt));
	var pdir = point_direction(x, y, obj_ufo.x + (obj_ufo.xSpd * x_mlt), obj_ufo.y + (obj_ufo.ySpd * y_mlt));
	if (pdist > 1 || shake > 0) {
		var pull = 20;
		x += lengthdir_x(pdist / pull, pdir) + (shake * shake_flip * irandom(3));
		y += lengthdir_y(pdist / pull, pdir) + (shake * shake_flip * irandom(3));
	}
}
x = clamp(x, 240, room_width - 240);
y = clamp(y, 135, room_height - 135);
shake = median(0, shake - 0.5, 5);
shake_flip *= -1;
