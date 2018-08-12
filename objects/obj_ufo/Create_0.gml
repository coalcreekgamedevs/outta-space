/// @description Insert description here
// You can write your code in this editor
depth = -100;

room_speed = 60;
instance_create_depth(x, y, 1000, control);

can_move = 0;

//Movement
xSpd = 0;
ySpd = 0;
xSpd_max = 8;
ySpd_max = 6;
xSpd_acc = 0.4;
xSpd_dec = 0.3;
ySpd_acc = 0.3;
ySpd_dec = 0.2;

//Dash
dash = 0;
dash_spd = 0;
dash_timer = 0;
dash_dir = 0;

//Image
draw_angle = 0;

turn = 0;
move_snd = 0;

tractor_beam = 0;
beam = 0;
beam_acc = 0;
c_pickup = make_color_rgb(136, 239, 21);
c_drop = make_color_rgb(255, 44, 44);
flash = 0;
flash_col = c_pickup;

//Inv
globalvar inv_total, inv_max, inv, inv_spr;
inv_total = 0;
inv_max = 5;
inv = 0;
inv_spr = 0;
for(i = 0; i <= inv_max; i++) {
	inv[i] = "";
	inv_spr[i] = "";
}

init_image_trail(12, 1);