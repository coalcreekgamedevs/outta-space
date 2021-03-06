		
		
if (dock_fly[0] > 0) {
	var _fly_anim = 200 - (200 * dock_fly[0]),
	    _fly_animb = 200 - (200 * dock_fly[1]);
	
	draw_sprite_ext(spr_monitor, 0 + (dock_ui_menu = 2), 83 - 20 - _fly_anim, 139 - 20 + (5 * sin(flow / 15)), 1, 1, (3 * sin(flow / 15)), c_white, 1);
	if (dock_ui_menu < 2) {
		draw_sprite_ext(spr_monitor, 2, 83 - 20 - _fly_anim, 139 - 20 + (5 * sin(flow / 15)), 1, 1, (3 * sin(flow / 15)) + (15 * sin(flow / 15)), c_white, 1);
		}
	draw_set_color(c_black);
	draw_set_alpha(dock_fly[0]);
	draw_roundrect(20, 200 + _fly_anim, 300, 260 + _fly_anim, false);
	
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_font(fo_speaking);
	
	draw_text_transformed(40 + (2 * sin(flow / 20)), 220 + _fly_anim, "Big Boss Bothra", 0.7, 0.7, 0);
	//draw_set_font(fo_header2);
	draw_text_transformed(50, 235 + _fly_anim, "Oh great... You again.", 0.5, 0.5, 0);
	
	if (dock_fly[1] < 1) {
		draw_set_color(c_black);
		draw_roundrect(320 + _fly_anim, 120, 460 + _fly_anim, 260, false);
	
		draw_set_color(c_white);
		draw_roundrect(330 + _fly_anim, 130 + (dock_ui_sel * 45), 450 + _fly_anim, 160 + (dock_ui_sel * 45), false);
	
		draw_set_font(fo_header2);
		scr_recolor_dock_option(0);
		draw_text(340 + _fly_anim, 145, "Leave Dock");
		scr_recolor_dock_option(1);
		draw_text(340 + _fly_anim, 190, "Unload Cargo");
		scr_recolor_dock_option(2);
		draw_text(340 + _fly_anim, 235, "Visit Shop");
		
	}
	if (dock_fly[1] > 0) {
		draw_set_color(c_white);
		draw_roundrect(320 + _fly_animb, 120, 460 + _fly_animb, 260, false);
	
		draw_set_color(c_black);
		draw_roundrect(330 + _fly_animb, 130 + (dock_ui_sel * 45), 450 + _fly_animb, 160 + (dock_ui_sel * 45), false);
	
		draw_set_font(fo_header2);
		scr_recolor_dock_option(0, 1);
		draw_text(340 + _fly_animb, 145, "Back");
		scr_recolor_dock_option(1, 1);
		draw_text(340 + _fly_animb, 190, "Upgrades");
		scr_recolor_dock_option(2, 1);
		draw_text(340 + _fly_animb, 235, "Hats");
		
		
		
		draw_set_alpha(dock_ui_sel_anim[1]);
		
		draw_set_color(c_white);
		draw_set_halign(fa_center);
		draw_text(160, 100, upgrade_title[dock_ui_hor]);
		
		//draw_set_alpha(dock_ui_sel_anim[2]);
		//draw_text(160, 100 + (_fly_animb / 5), upgrade_title[dock_ui_hor]);
	}
}

if (list > 0) {
	var _size_back = -200,
		_size_rest = 350 * list,
		_left = _size_back + _size_rest - (40 * dock_fly[0])
		,
		_ht_down = 135 - (40 * dock_fly[0]),
		_margin = 20,
		_top = -80,
		_scale = (0.95 - (dock_fly[0] * 0.3)) + (0.05 * sin(flow / 50)),
		_txt_size = _scale * 0.8,
		_dir = 5 * sin(flow / 20),
		_line_start = lengthdir_x(-50 * _scale, _dir),
		_line_start_y = lengthdir_y(-50 * _scale, _dir),
		_check_start = lengthdir_x(-70 * _scale, _dir),
		_check_start_y = lengthdir_y(-70 * _scale, _dir);
	
	draw_set_font(fo_tablet);
	
	draw_sprite_ext(spr_tablet, 0, _left, _ht_down, _scale, _scale, _dir, c_white, 1);

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_pickup);
	draw_set_alpha(1);
	if (list_available) {
		for(i = 0; i < list_items_total; i++) {
			scr_render_list_item(_left, _top + (25 * i), _scale, _dir - 90, _check_start, _ht_down, _check_start_y, _txt_size, _dir, _line_start, _line_start_y, pickup_title[list_items_num[i]], list_items_col[i])
			}
		}
}
		
if (dock_time > 0) {
	var fly = (3 * sin(control.flow / 20)) - (10 * dock_time),
		_ask = "Press Space to Dock";
	draw_set_color(c_black);
	draw_set_alpha(dock_time);
	draw_set_font(fo_header2);
	draw_roundrect(240 - (string_width(_ask) / 1.5), 170 + fly, 240 + (string_width(_ask) / 1.5), 190 + fly, false);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(240, 180 + fly, _ask);
}
		
		
	if (pause_pull[0] > 0) {
		var _hub_wd = 180,
			_hub_off = -300,
			_hub_rest = 320,
			_opt_ht = 30,
			_opt_off = 10,
			_opt_margin = 10,
			_opt_xd = 35,
			_sel_off = 15,
			_txt_off = 20,
			
			_tna = pause_pull[0],
			_tnb = pause_pull[1];
			
		draw_set_color(c_black);
		draw_set_alpha(_tna * 0.7);
		draw_rectangle(-1, -1, 481, 271, false);
		draw_set_alpha(_tna);
		draw_set_halign(fa_center);
		draw_set_font(fo_menu);
		
		draw_set_color(c_black);
		draw_set_alpha(1);
		draw_rectangle(_hub_off + (_hub_rest * _tna), 0, _hub_off + (_hub_rest * _tna) + _hub_wd, 270, false);
	
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		
		if (_tnb < 1) {
			draw_set_color(c_white);
			if (pause_menu = 0) {
				draw_roundrect(_hub_off + (_hub_rest * _tna) + (_opt_xd / 1.5), (_opt_ht * (pause_option + 1)) + (_opt_off * (pause_option + 1)) + _opt_margin - _sel_off,
					_hub_off + (_hub_rest * _tna) + _hub_wd - (_opt_xd / 1.5), (_opt_ht * (pause_option + 1)) + (_opt_off * (pause_option + 1)) + _opt_margin + _sel_off, false);
			}
			for(i = 0; i <= pause_options[0]; i++) {
				draw_sprite_ext(spr_menu_options, i, _hub_off + (_hub_rest * _tna) + _opt_xd + 2, (_opt_ht * (i + 1)) + (_opt_off * (i + 1)) + _opt_margin + 2, 1, 1, 0, make_color_hsv(0, 0, 255 * (pause_option != i || pause_menu != 0)), 1);
			}
			if (pause_menu != 0) {
				draw_set_color(c_white);
			} else {
				scr_recolor_option(0);
			}
			draw_text(_hub_off + (_hub_rest * _tna) + _opt_xd + _txt_off, _opt_ht + _opt_off + _opt_margin, "Resume");
			scr_recolor_option(1);
			draw_text(_hub_off + (_hub_rest * _tna) + _opt_xd + _txt_off, (_opt_ht * 2) + _opt_margin + (_opt_off * 2), "Options");
			scr_recolor_option(2);
			draw_text(_hub_off + (_hub_rest * _tna) + _opt_xd + _txt_off, (_opt_ht * 3) + _opt_margin + (_opt_off * 3), "Extras");
			scr_recolor_option(3);
			draw_text(_hub_off + (_hub_rest * _tna) + _opt_xd + _txt_off, (_opt_ht * 4) + _opt_margin + (_opt_off * 4), "Menu");
			scr_recolor_option(4);
			draw_text(_hub_off + (_hub_rest * _tna) + _opt_xd + _txt_off, (_opt_ht * 5) + _opt_margin + (_opt_off * 5), "Exit");
		}
		
		draw_set_color(c_white);
		draw_set_alpha(1);
		draw_rectangle(_hub_off + (_hub_rest * _tnb), 0, _hub_off + (_hub_rest * _tnb) + _hub_wd, 270, false);
		
		if (_tnb > 0) {
			draw_set_color(c_black);
			draw_roundrect(_hub_off + (_hub_rest * _tnb) + (_opt_xd / 1.5), (_opt_ht * (pause_option + 1)) + (_opt_off * (pause_option + 1)) + _opt_margin - _sel_off,
				_hub_off + (_hub_rest * _tnb) + _hub_wd - (_opt_xd / 1.5), (_opt_ht * (pause_option + 1)) + (_opt_off * (pause_option + 1)) + _opt_margin + _sel_off, false);
			switch(pause_menu_sec) {
				case 1:
					for(i = 0; i <= pause_options[pause_menu_sec]; i++) {
						draw_sprite_ext(spr_menu_options, i + 5, _hub_off + (_hub_rest * _tnb) + _opt_xd + 2, (_opt_ht * (i + 1)) + (_opt_off * (i + 1)) + _opt_margin + 2, 1, 1, 0, make_color_hsv(0, 0, 255 * (pause_option = i || pause_menu_sec != 1)), 1);
					}
					draw_sprite_ext(spr_check, all_music, _hub_off + (_hub_rest * _tnb) + _hub_wd - (_opt_xd), (_opt_ht * 3) + (_opt_off * 3) + _opt_margin + 2, 1, 1, 0, make_color_hsv(0, 0, 255 * (pause_option = 2 || pause_menu_sec != 1)), 1);
					draw_sprite_ext(spr_check, all_sound, _hub_off + (_hub_rest * _tnb) + _hub_wd - (_opt_xd), (_opt_ht * 4) + (_opt_off * 4) + _opt_margin + 2, 1, 1, 0, make_color_hsv(0, 0, 255 * (pause_option = 3 || pause_menu_sec != 1)), 1);
					scr_recolor_option(0, 1);
					draw_text(_hub_off + (_hub_rest * _tnb) + _opt_xd + _txt_off, _opt_ht + _opt_off + _opt_margin, "Back");
					scr_recolor_option(1, 1);
					draw_text(_hub_off + (_hub_rest * _tnb) + _opt_xd + _txt_off, (_opt_ht * 2) + _opt_margin + (_opt_off * 2), "Fullscreen");
					scr_recolor_option(2, 1);
					draw_text(_hub_off + (_hub_rest * _tnb) + _opt_xd + _txt_off, (_opt_ht * 3) + _opt_margin + (_opt_off * 3), "Music");
					scr_recolor_option(3, 1);
					draw_text(_hub_off + (_hub_rest * _tnb) + _opt_xd + _txt_off, (_opt_ht * 4) + _opt_margin + (_opt_off * 4), "Sound");
					scr_recolor_option(4, 1);
					draw_text(_hub_off + (_hub_rest * _tnb) + _opt_xd + _txt_off, (_opt_ht * 5) + _opt_margin + (_opt_off * 5), "Controls");
					if (scheme_animation > 0) {
						switch(scheme) {
							case 0:
								draw_sprite_ext(spr_control_schemes, 1, 360 + 300 - (300 * scheme_animation), 80 - (10 * scheme_jump[0]), 0.5 + (scheme_jump[0] * 0.5), 0.5 + (scheme_jump[0] * 0.5), 3 * sin(flow / 25), c_white, 1);
								draw_sprite_ext(spr_control_schemes, 2, 360 + 300 - (300 * scheme_animation), 180 - (30 * scheme_jump[1]), 0.5 + (scheme_jump[1] * 0.5), 0.5 + (scheme_jump[1] * 0.5), 3 * cos(flow / 25), c_white, 1);
								break;
							case 1:
								draw_sprite_ext(spr_control_schemes, 3, 360 + 300 - (300 * scheme_animation), 180 - (30 * scheme_jump[1]), 0.5 + (scheme_jump[1] * 0.5), 0.5 + (scheme_jump[1] * 0.5), 3 * cos(flow / 25), c_white, 1);
								draw_sprite_ext(spr_control_schemes, 0, 360 + 300 - (300 * scheme_animation), 80 - (10 * scheme_jump[0]), 0.5 + (scheme_jump[0] * 0.5), 0.5 + (scheme_jump[0] * 0.5), 3 * sin(flow / 25), c_white, 1);
								break;
							}
						}
					break;
				case 2:
					draw_sprite_ext(spr_menu_options, 5, _hub_off + (_hub_rest * _tnb) + _opt_xd + 2, (_opt_ht) + (_opt_off) + _opt_margin + 2, 1, 1, 0, make_color_hsv(0, 0, 255 * (pause_option = 0 || pause_menu_sec != 2)), 1);
					draw_sprite_ext(spr_menu_options, 10, _hub_off + (_hub_rest * _tnb) + _opt_xd + 2, (_opt_ht * 2) + (_opt_off * 2) + _opt_margin + 2, 1, 1, 0, make_color_hsv(0, 0, 255 * (pause_option = 1 || pause_menu_sec != 2)), 1);
					draw_sprite_ext(spr_menu_options, 11, _hub_off + (_hub_rest * _tnb) + _opt_xd + 2, (_opt_ht * 3) + (_opt_off * 3) + _opt_margin + 2, 1, 1, 0, make_color_hsv(0, 0, 255 * (pause_option = 2 || pause_menu_sec != 2)), 1);
					scr_recolor_option(0, 1);
					draw_text(_hub_off + (_hub_rest * _tnb) + _opt_xd + _txt_off, _opt_ht + _opt_off + _opt_margin, "Back");
					scr_recolor_option(1, 1);
					draw_text(_hub_off + (_hub_rest * _tnb) + _opt_xd + _txt_off, (_opt_ht * 2) + _opt_margin + (_opt_off * 2), "Trophies");
					scr_recolor_option(2, 1);
					draw_text(_hub_off + (_hub_rest * _tnb) + _opt_xd + _txt_off, (_opt_ht * 3) + _opt_margin + (_opt_off * 3), "Credits");
					break;
				case 3:
					draw_sprite_ext(spr_menu_options, 5, _hub_off + (_hub_rest * _tnb) + _opt_xd + 2, (_opt_ht) + (_opt_off) + _opt_margin + 2, 1, 1, 0, make_color_hsv(0, 0, 255 * (pause_option = 0 || pause_menu_sec != 3)), 1);
					draw_sprite_ext(spr_menu_options, 3, _hub_off + (_hub_rest * _tnb) + _opt_xd + 2, (_opt_ht * 2) + (_opt_off * 2) + _opt_margin + 2, 1, 1, 0, make_color_hsv(0, 0, 255 * (pause_option = 1 || pause_menu_sec != 3)), 1);
					scr_recolor_option(0, 1);
					draw_text(_hub_off + (_hub_rest * _tnb) + _opt_xd + _txt_off, _opt_ht + _opt_off + _opt_margin, "Back");
					scr_recolor_option(1, 1);
					draw_text(_hub_off + (_hub_rest * _tnb) + _opt_xd + _txt_off, (_opt_ht * 2) + _opt_margin + (_opt_off * 2), "Main Menu");
					break;
				case 4:
					draw_sprite_ext(spr_menu_options, 5, _hub_off + (_hub_rest * _tnb) + _opt_xd + 2, (_opt_ht) + (_opt_off) + _opt_margin + 2, 1, 1, 0, make_color_hsv(0, 0, 255 * (pause_option = 0 || pause_menu_sec != 4)), 1);
					draw_sprite_ext(spr_menu_options, 4, _hub_off + (_hub_rest * _tnb) + _opt_xd + 2, (_opt_ht * 2) + (_opt_off * 2) + _opt_margin + 2, 1, 1, 0, make_color_hsv(0, 0, 255 * (pause_option = 1 || pause_menu_sec != 4)), 1);
					scr_recolor_option(0, 1);
					draw_text(_hub_off + (_hub_rest * _tnb) + _opt_xd + _txt_off, _opt_ht + _opt_off + _opt_margin, "Back");
					scr_recolor_option(1, 1);
					draw_text(_hub_off + (_hub_rest * _tnb) + _opt_xd + _txt_off, (_opt_ht * 2) + _opt_margin + (_opt_off * 2), "Quit");
					break;
			}
		}
	}

draw_set_alpha(1);
draw_set_color(c_white);
draw_roundrect(465 - (inv_max * 34), 11, 500, 53, false);
draw_roundrect(379, 59, 500, 81, false);
draw_set_color(c_black);

draw_roundrect(466 - (inv_max * 34), 12, 500, 52, false);
draw_roundrect(380, 60, 500, 80, false);

draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_set_font(fo_cash);
draw_sprite_ext(spr_cash, 0, 394, 70, 1, 1, (5 * sin(flow / 25)), c_white, 1);
draw_text_transformed(416, 72, cash_draw_amt, 0.7, 0.7, 0);

for(i = 0; i < inv_max; i++) {
	draw_sprite_ext(spr_container, 0, 456 - (i * 34), 33, 1, 1, (10 * new_pickup * cos(flow / 5)), c_white, 1);
}
var _tilt = sin(flow / 25);
for(i = 0; i < inv_total; i++) {
	draw_sprite_ext(inv_spr[i], 0, 456 - (i * 34), 33, 0.9 - ((0.8 * (new_pickup + abs(inv_drop_timer - 1))) * (i + 1 = inv_total)) + (_tilt * 0.1),
		0.9 - ((0.8 * (new_pickup + abs(inv_drop_timer - 1))) * (i + 1 = inv_total)) + (_tilt * 0.1), (20 * new_pickup * sin(flow / 5)) + (5 * sin(flow / 18)), c_white, 1);
}

