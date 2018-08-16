/// @description Insert description here
// You can write your code in this editor
// Inherit the parent event
event_inherited();

if !(pause) {
	if (move_timer > 0) {
		move_timer -= 1;
	} else {
		move_timer = 120;
		move_flip *= -1;
	}

	image_xscale = move_flip;
	xSpd = median(-xSpd_max, xSpd + (move_flip * xSpd_acc), xSpd_max);
	offset_angle = -90 * move_flip;
	draw_angle += abs(xSpd) * sin(control.flow / 5);
}