
flow = 0;
depth = 1000;
globalvar current_beamer, shake;
	current_beamer = 0;
	shake = 0;
shake_flip = -1;

vxx = camera_get_view_x(view_camera[0]);
vyy = camera_get_view_y(view_camera[0]);
vww = camera_get_view_width(view_camera[0]);
vhh = camera_get_view_height(view_camera[0]);

//Menus
pause_pull[0] = 0;
pause_pull[1] = 0;
pause_menu = 0;
pause_option = 0;
pause_options[0] = 4;
pause_options[1] = 4;
pause_options[2] = 2;
pause_options[3] = 1;
pause_options[4] = 1;
pause_option_timer = 0;
pause_timer_duration = 5;
pause_menu_sec = pause_menu;
scheme = 0;
scheme_jump[0] = 0;
scheme_jump[1] = 0;
scheme_animation = 0;
ini_open(working_directory + "game.ini");
	
	scheme = ini_read_real("options", "controls", 0);

ini_close();

globalvar key_up, key_down, key_left, key_right, key_drop, key_tractor, key_dash, key_list;
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

globalvar inv_total, inv_max, inv_max_upgrade, inv, inv_spr, inv_drop, inv_drop_timer;
inv_total = 0;
inv_max = 3;
inv_max_upgrade = 6;
inv = 0;
inv_spr = 0;
inv_drop = 0;
inv_drop_timer = 1;
for(i = 0; i <= inv_max_upgrade; i++) {
	inv[i] = "";
	inv_spr[i] = "";
}

new_pickup = 0;

//Docking
dock_time = 0;
dock = 0;

list_over = 0;
list = 0;
list_items_total = inv_max;
list_items_col = 0;
list_items_req = 0;
list_items_title = "";
list_available = 0;

for(i = 0; i < inv_max_upgrade; i++) {
	list_items_col[i] = 0;
	list_item_req[i] = 0;
	list_items_title = "";
}