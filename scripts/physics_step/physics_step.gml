
if !(pause) {
repeat(abs(xSpd)) {
	var x_next = x + sign(xSpd);
	if (x_next > 0 && x_next < room_width) {
		if !(place_meeting(x_next, y, par_moveable)) {
			
			if !(place_meeting(x_next, y, par_solid)) {
				x = x_next;
			} else {
				if !(place_meeting(x_next, y - 1, par_solid)) {
					x = x_next;
					y -= 1;
					xSpd -= sign(xSpd) * xSpd_dec;
				} else if !(place_meeting(x_next, y + 1, par_solid)) {
					x = x_next;
					y += 1;
					xSpd -= sign(xSpd) * xSpd_dec;
				} else {
					xSpd = 0;
					break;
				}
			}
		} else {
			catalyst = id;
			with(instance_place(x_next, y, par_moveable)) {
				var x_bump = x + catalyst.xSpd;
				if (!place_meeting(x + sign(catalyst.xSpd), y, par_solid) && x_bump > 0 && x_bump < room_width) {
					xSpd = catalyst.xSpd;
					catalyst.can_move = 1;
				} else {
					xSpd = 0;
					catalyst.can_move = 0;
					break;
				}
			}
			if (can_move) {
				x = x_next;
			} else {
				xSpd = 0;
				break;
			}
		}
	} else {
		xSpd = 0;
		break;
	}
}
if (beam_up) {
	fall_speed = 0;
	if (abs(obj_ufo.y - y) > 60 - (40 * can_take)) {
		ySpd = median(-ySpd_max, ySpd - ySpd_acc, 0);
	} else {
		if (can_take && inv_total < inv_max) {
			inv[inv_total] = obj_type;
			inv_spr[inv_total] = sprite_index;
			inv_total += 1;
			with(control) {
				scr_inv_check();
			}
			switch(obj_type) {
				case "car":
					obj_ufo.delay_snd = "crush";
					obj_ufo.delay_snd_timer = 30;
					break;
					
			}
			if (inv_total = inv_max) {
				obj_ufo.player_talk_timer = obj_ufo.player_talk_time;
			}
			control.new_pickup = 1;
			sfx_play(snd_ufo_beam_captured);
			instance_destroy();
		}
		ySpd = median(-ySpd_max, ySpd + ySpd_acc, ySpd_max);
	}
	draw_angle_change = median(0, draw_angle_change + 0.05, 1);
	if (can_take = 1) {
		size_dist = median(0, size_dist + ((150 - (point_distance(x, y, obj_ufo.x, obj_ufo.y))) / 500), 1);
	}
} else {
	ySpd = median(-ySpd_max, ySpd + ySpd_acc, 0);
	if (can_fall) {
		fall_speed = median(0, fall_speed + world_gravity, world_velocity);
		repeat(abs(fall_speed)) {
			if !(place_meeting(x, y + sign(fall_speed), par_solid)) {
				y += sign(fall_speed);
			} else {
				 if (fall_speed > 4) {
						switch(obj_type) {
							case "cow":
								if !(audio_is_playing(snd_cow_moo_drop1) && !audio_is_playing(snd_cow_moo_drop2)) {
									sfx_random(snd_cow_moo_drop1, snd_cow_moo_drop2);
								}
								break;
						}
					}
				fall_speed = 0;
				break;
			}
		}
	}
	draw_angle_change = median(0, draw_angle_change - 0.1, 1);
	size_dist = median(0, (size_dist - 0.1) / 1.05, 1);
}
repeat(abs(ySpd)) {
	var y_next = y + sign(ySpd);
	if (y_next > 0 && y_next < room_height) {
		if !(place_meeting(x, y_next, par_solid)) {
			y = y_next;
		} else {
			if !(place_meeting(x - 1, y_next, par_solid)) {
				y = y_next;
				x -= 1;
				ySpd -= sign(ySpd) * ySpd_dec;
			} else if !(place_meeting(x + 1, y_next, par_solid)) {
				y = y_next;
				x += 1;
				ySpd -= sign(ySpd) * ySpd_dec;
			} else {
				ySpd = 0;
				break;
			}
		}
	} else {
		ySpd = 0;
		break;
	}
}
xSpd = median(-xSpd_max, xSpd - (sign(xSpd) * xSpd_dec), xSpd_max);
}
beam_up = 0;
draw_angle = offset_angle + (50 * tilt * draw_angle_change * sin(control.flow / 10));

if (txt_show) {
	txt_fly = median(0, txt_fly + 0.1, 1);
	var _pd = point_distance(x, y, obj_ufo.x, obj_ufo.y);
	if (_pd < 30 || _pd > 220) {
		txt_show = 0;
	} else
	if (txt_timer > 0) {
		txt_timer -= 1;
	} else {
		txt_show = 0;
	}
} else {
	txt_timer = txt_time;
	txt_fly = median(0, txt_fly - 0.1, 1);
	if (txt_fly = 0) {
		txt = _txt[irandom(txt_amt)];
	}
}