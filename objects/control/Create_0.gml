
randomize();

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

//Currency
globalvar cash;
cash = 0;
cash_amt = 0;
cash_draw_amt = "0000000";


new_pickup = 0;
globalvar new_spawn;
	new_spawn = 1;

//Docking
dock_time = 0;
dock = 0;
dock_fly[0] = 0;
dock_fly[1] = 0;

dock_ui_hor = 0;
dock_ui_timer = 0;
dock_ui_menu = 0;
dock_ui_menu_sec = 0;
dock_ui_sel = 0;
dock_ui_sels[0] = 2;
dock_ui_sels[1] = 2;
dock_ui_sels[2] = 2;

dock_ui_sel_anim[1] = 0;
dock_ui_sel_anim[2] = 0;

dialogue = 0;

dock_ui_hor_anim[0] = 0;
dock_ui_hor_anim[1] = 0;
dock_ui_hor_anim[2] = 0;

upgrade = 0;
upgrade_cost = 0;
upgrade_title = "";
upgrade_desc = "";
upgrade_own = 0;
upgrade_prior = 0;
upgrade_total = 0;
add_upgrade(100, "Rush", "Provides a boost of speed left or right"); //0
add_upgrade(250, "Speed I", "Increase your ship speed"); //1
add_upgrade(500, "Speed II", "Max your ship speed", 1); //2
add_upgrade(500, "Tractor Beam I", "Stronger tractor beam"); //3
add_upgrade(500, "Tractor Beam II", "Max out tractor beam strength", 3); //4
add_upgrade(750, "Cargo Hold I", "Gain a fourth cargo slot"); //5
add_upgrade(10000, "Cargo Hold II", "Gain a fifth cargo slot", 5); //6
add_upgrade(30000, "Cargo Hold III", "Max at six cargo slots", 6); //7

upgrade_total -= 1;
dock_ui_hor_max[0] = 0;
dock_ui_hor_max[1] = upgrade_total;
dock_ui_hor_max[2] = 0;

globalvar difficulty;
difficulty = 0;

ini_open(working_directory + "game.ini");
	
	for(i = 0; i < upgrade_total; i++) {
		upgrade[i] = ini_read_real("upgrades", "up_" + string(i), 0);
		upgrade_own[i] = upgrade[i];
	}
	next_sshot = ini_read_real("data", "screens", 0);
	scheme = ini_read_real("options", "controls", 0);
	var _full = ini_read_real("options", "fullscreen", 1);
	all_sound = ini_read_real("options", "sound", 1);
	all_music = ini_read_real("options", "music", 1);
	cash = ini_read_real("data", "cash", 0);
	difficulty = median(0, ini_read_real("data", "difficulty", 0), 10);
	
ini_close();

window_set_size(960, 540);
window_center();
if (_full) {
	window_set_fullscreen(1);
} else {
	window_set_fullscreen(0);
	window_set_size(960, 540);
	window_center();
}
difficulty = 8;
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
inv_max_upgrade = 6;
inv_max = median(3, 3 + (upgrade[5] + upgrade[6] + upgrade[7]), inv_max_upgrade);
inv = 0;
inv_spr = 0;
inv_drop = 0;
inv_drop_timer = 1;
inv_max = 6;
for(i = 0; i <= inv_max_upgrade; i++) {
	inv[i] = "";
	inv_spr[i] = "";
}

list_over = 0;
list = 0;
list_items_total = inv_max;
list_items_col = 0;
list_items_num = 0;
list_items_title = "";
list_available = 1;

for(i = 0; i < inv_max_upgrade; i++) {
	list_items_col[i] = 0;
	list_items_num[i] = 0;
}


//ITEM LIST
//"cow" :
pickup = 0;
pickup_spr = 0;
pickup_value = 0;
pickup_title = "";
pickup_total = 0;
add_pickup(obj_briefcase, "Item transportation\ncontainer", 10, spr_briefcase); //0
add_pickup(obj_piggy, "Anthropomorphic currency\nstorage", 20, spr_piggy); //1
add_pickup(obj_space_cow, "Udderly disgusting\nbovine", 30, spr_space_cow); //2
add_pickup(obj_space_squid, "Interstellar self-\npropelled calamari", 40, spr_space_squid); //3
add_pickup(obj_ironore, "Crunchy metallic\nfragment", 50, spr_ironore); //4

add_pickup(obj_cassette, "Poluted sound module", 100, spr_cassette); //5
add_pickup(obj_boombox, "Public playback device", 200, spr_boombox); //6
add_pickup(obj_record, "Misophonic grooved\nplate", 300, spr_record); //7
add_pickup(obj_phonograph, "Cornacopic audio\namplifier", 400, spr_phonograph); //8
add_pickup(obj_guitar, "Distorted melody\nimproviser", 500, spr_guitar); //9

add_pickup(obj_cartridge, "Media repository\ncartridge", 1000, spr_cartridge); //10
add_pickup(obj_vase, "Fragile ancient\nart installation", 2000, spr_vase); //11
add_pickup(obj_gameboy, "Archaic entertainment\napparatus", 3000, spr_gameboy); //12
add_pickup(obj_car, "Depreciated transport\nvehicle", 4000, spr_car); //13
add_pickup(obj_polygold, "The Fifth Element", 5000, spr_polygold); //14

instance_create_depth(obj_mothership.x, obj_mothership.y, -1000, obj_ufo);

globalvar spawn_total, spawn_type, spawn_loc;
	spawn_total = 0;
	spawn_loc = 0;
	
with(obj_spawner) {
	spawn_loc[spawn_total] = id;
	spawn_total += 1;
}

scr_new_spawn();