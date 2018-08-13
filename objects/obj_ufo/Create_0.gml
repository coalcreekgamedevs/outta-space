/// @description Insert description here
// You can write your code in this editor
depth = -100;

room_speed = 60;
instance_create_depth(x, y, 1000, control);

can_move = 0;
image_speed = 0;

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
flash = 0;
flash_col = 0;

//Inv


init_image_trail(12, 1);
globalvar disable_tractor;
disable_tractor = 0;

_txt[0] = "GLIP GLOP!";
_txt[1] = "WUBBA LUBBA DUB DUB";
txt_amt = 1;
txt_show = 0;
txt_time = 60;
txt_timer = txt_time;
txt_fly = 0;
txt = irandom(_txt[txt_amt]);