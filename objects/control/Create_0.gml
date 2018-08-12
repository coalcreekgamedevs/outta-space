
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
pause_options[1] = 3;
pause_options[2] = 1;
pause_options[3] = 1;
pause_options[4] = 1;
pause_option_timer = 0;
pause_timer_duration = 5;
pause_menu_sec = pause_menu;
