/// @description Insert description here
// You can write your code in this editor
// Inherit the parent event
event_inherited();

image_speed = 1;
flip = 1;
can_take = 1;
size_dist = 0;
obj_type = "squid";
tilt = 2;
txt_amt = 3;
_txt[0] = "Ruu?";
_txt[1] = "HELP!";
_txt[2] = "I've been framed!";
_txt[3] = "ARUUUGAH!";
depth = -100;
txt = _txt[irandom(txt_amt)];

move_timer = 120;
move_flip = choose(-1, 1);
move_spd = 0;
xSpd_max = 3;
xSpd_acc = 0.2;
xSpd_dec = 0.05;
can_fall = 0;
offset_angle = -90 * move_flip;