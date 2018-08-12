
if (pause) {
	if (audio_is_playing(snd_ufo_beam_loop)) {
		audio_stop_sound(snd_ufo_beam_loop);
	}
	if (audio_is_playing(snd_ufo_beam_capturing)) {
		audio_stop_sound(snd_ufo_beam_capturing);
	}
} else {
	xd = (keyboard_check(vk_right) - keyboard_check(vk_left));
	yd = (keyboard_check(vk_down) - keyboard_check(vk_up));

	if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(vk_left)) {
		if (dash = 1 && xd = dash_dir) {
			dash_spd = (xSpd_max);
			xSpd = xSpd_acc * dash_dir;
			dash = 2;
			dash_timer = 40;
			//shake += 3;
		} else if (dash_timer = 0 && dash = 0) {
			dash = 1;
			dash_dir = xd;
			dash_timer = 20;
		}
	}
	if (dash_timer > 0) {
		dash_timer -= 1;
	} else {
		dash = 0;
	}
	dash_spd = median(0, dash_spd - (xSpd_dec * 1.5), xSpd_max);
	xSpd += (dash_spd / 4) * sign(xSpd);
	if (xd != 0) {
		if (xSpd = 0) {
			move_snd = 1;
		}
		turn = xd;
		xSpd = median(-xSpd_max - dash_spd, xSpd + (xSpd_acc * xd), xSpd_max + dash_spd);
	} else if (abs(xSpd) > xSpd_dec) {
		xSpd -= sign(xSpd) * xSpd_dec;
	} else {
		xSpd = 0;
	}
	if (yd != 0) {
		if (ySpd = 0) {
			move_snd = 1;
		}
		turn = yd;
		ySpd = median(-ySpd_max, ySpd + (ySpd_acc * yd), ySpd_max * 2);
	} else if (abs(ySpd) > ySpd_dec) {
		ySpd -= sign(ySpd) * ySpd_dec;
	} else {
		ySpd = 0;
	}

	repeat(abs(xSpd)) {
		var x_next = x + sign(xSpd);
		if (x_next > 0 && x_next < room_width) {
			if !(place_meeting(x_next, y, par_moveable)) {
			
				if !(place_meeting(x_next, y, par_solid)) {
					x = x_next;
				} else 
				if !(place_meeting(x_next, y - 1, par_solid)) {
					x = x_next;
					y -= 1;
					xSpd -= sign(xSpd) * xSpd_dec;
				} else
				if !(place_meeting(x_next, y + 1, par_solid)) {
					x = x_next;
					y += 1;
					xSpd -= sign(xSpd) * xSpd_dec;
				} else {
					xSpd = 0;
					break;
				}
			} else {
				catalyst = id;
				with(instance_place(x_next, y, par_moveable)) {
					var x_bump = x + sign(catalyst.xSpd);
					if (!place_meeting(x_bump, y, par_solid) && x_bump > 0 && x_bump < room_width) {
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
	draw_angle = median(2.5 * -(xSpd_max + (dash_spd * 4)), draw_angle - (xSpd / 2) - (draw_angle / 2) - (dash_spd * 3 * sign(xSpd)), 2.5 * (xSpd_max + (dash_spd * 4)));
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

	if (keyboard_check(vk_space)) {
		if (tractor_beam = 0) {
			flash = 1;
			flash_col = c_pickup;
			shake = 3;
			sfx_play(snd_ufo_beam_open);
		}
		tractor_beam = 1;
		if !(audio_is_playing(snd_ufo_beam_loop)) {
			audio_play_sound(snd_ufo_beam_loop, 10, 1);
		}
	} else {
		if (tractor_beam) {
			sfx_play(snd_ufo_beam_close);
			tractor_beam = 0;
			audio_stop_sound(snd_ufo_beam_loop);
		}
		current_beamer = 0;
		audio_stop_sound(snd_ufo_beam_capturing);
		if (keyboard_check_pressed(ord("D")) && inv_total > 0) {
			flash = 1;
			flash_col = c_drop;
			sfx_play(snd_ufo_beam_release);
			switch(inv[inv_total - 1]) {
				case "cow":
					instance_create_depth(x, y, -100, obj_space_cow);
					break;
				case "gameboy":
					instance_create_depth(x, y, -100, obj_gameboy);
					break;
			}
			inv[inv_total - 1] = "";
			inv_total -= 1;
		}
	}

	if (tractor_beam) {
		beam_acc = median(0.01, beam_acc + 0.01, 0.1);
		beam = median(0, beam + beam_acc, 1);
	
		if (instance_exists(par_pickup)) {
			if (current_beamer = 0) {
				with(collision_rectangle(x + lengthdir_x(10 * beam, draw_angle) + median(0, draw_angle * 3, xSpd_max * 6), y + lengthdir_y(10 * beam, draw_angle),
				x - lengthdir_x(10 * beam, draw_angle) + median(-xSpd_max * 6, draw_angle * 3, 0), y + 150, par_pickup, true, true)) {
					beam_up = 1;
					if (point_distance(x, y, obj_ufo.x, obj_ufo.y) < 150) {
						current_beamer = id;
						switch(obj_type) {
							case "cow":
								sfx_play(snd_cow_moo);
								txt_show = 1;
								break;
						}
					}
				} 
			audio_stop_sound(snd_ufo_beam_capturing);	
			} else {
				with(current_beamer) {
					beam_up = 1;
					xSpd = obj_ufo.xSpd + median(-1, (obj_ufo.x - x) / 8, 1);
				}
				if !(audio_is_playing(snd_ufo_beam_loop)) {
					audio_play_sound(snd_ufo_beam_capturing, 10, 1);
				}
				if (point_distance(x, y, obj_ufo.x, obj_ufo.y) > 150) || !(collision_rectangle(x + lengthdir_x(10 * beam, draw_angle) + median(0, draw_angle * 3, xSpd_max * 6), y + lengthdir_y(10 * beam, draw_angle),
				x - lengthdir_x(10 * beam, draw_angle) + median(-xSpd_max * 6, draw_angle * 3, 0), y + 150, current_beamer, true, true)) {
					current_beamer = 0;
				}
			}
		} else {
			audio_stop_sound(snd_ufo_beam_capturing);	
		}
		
	} else if (beam > 0) {
		beam_acc = median(0.01, beam_acc - 0.005, 0.1);
		beam = median(0, beam - beam_acc, 1);
	} else {
		beam_acc = 0;
	}
	if (flash > 0) {
		flash -= 0.1;
	}
	if (move_snd) {
		sfx_play(snd_ufo_ship_move);
		move_snd = 0;
	}

	image_trail(x + lengthdir_x(8, draw_angle - 90), y + lengthdir_y(8, draw_angle - 90), draw_angle - 90 + (xSpd * 5) - (ySpd * 5));
}