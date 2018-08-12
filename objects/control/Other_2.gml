globalvar world_gravity, world_velocity;
	world_gravity = 0.15;
	world_velocity = 5;
	
globalvar pause, catalyst;
	pause = 0;
	catalyst = 0;

randomise();
next_sshot = 0;
ini_open("game.ini");
	
	next_sshot = ini_read_real("data", "screens", 0);

ini_close();