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

globalvar c_pickup, c_drop;
	c_pickup = make_color_rgb(136, 239, 21);
	c_drop = make_color_rgb(255, 44, 44);
	
globalvar new_spawn;
	new_spawn = 1;
	