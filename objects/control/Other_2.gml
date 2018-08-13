globalvar world_gravity, world_velocity;
	world_gravity = 0.15;
	world_velocity = 5;
	
globalvar pause, catalyst;
	pause = 0;
	catalyst = 0;
globalvar all_sound, all_music;

all_sound = 1;
all_music = 1;
randomise();
next_sshot = 0;
scheme = 0;
ini_open(working_directory + "game.ini");
	
	next_sshot = ini_read_real("data", "screens", 0);
	scheme = ini_read_real("options", "controls", 0);
	var _full = ini_read_real("options", "fullscreen", 1);
	all_sound = ini_read_real("options", "sound", 1);
	all_music = ini_read_real("options", "music", 1);

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

globalvar c_pickup, c_drop;
	c_pickup = make_color_rgb(136, 239, 21);
	c_drop = make_color_rgb(255, 44, 44);
	
globalvar new_spawn;
	new_spawn = 1;
	