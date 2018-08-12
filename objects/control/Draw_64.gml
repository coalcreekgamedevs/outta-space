		
	if (pause_pull[0] > 0) {
		var _hub_wd = 160,
			_hub_off = -300,
			_hub_rest = 320,
			_opt_ht = 30,
			_opt_off = 10,
			_opt_margin = 10,
			_opt_xd = 40,
			_sel_off = 15,
			
			_tna = pause_pull[0],
			_tnb = pause_pull[1];
			
		draw_set_color(c_black);
		draw_set_alpha(_tna * 0.7);
		draw_rectangle(0, 0, 480, 270, false);
		draw_set_alpha(_tna);
		draw_set_color(c_white);
		draw_set_halign(fa_center);
		draw_text(240, 20, "Paused");
		
		draw_set_color(c_black);
		draw_set_alpha(1);
		draw_rectangle(_hub_off + (_hub_rest * _tna), 0, _hub_off + (_hub_rest * _tna) + _hub_wd, 270, false);
	
		draw_set_halign(fa_left);
		
		if (_tnb < 1) {
			draw_set_color(c_white);
			draw_roundrect(_hub_off + (_hub_rest * _tna) + (_opt_xd / 2), (_opt_ht * (pause_option + 1)) + (_opt_off * (pause_option + 1)) + _opt_margin - _sel_off,
				_hub_off + (_hub_rest * _tna) + _hub_wd - (_opt_xd / 2), (_opt_ht * (pause_option + 1)) + (_opt_off * (pause_option + 1)) + _opt_margin + _sel_off, false);
		
			scr_recolor_option(0);
			draw_text(_hub_off + (_hub_rest * _tna) + _opt_xd, _opt_ht + _opt_off + _opt_margin, "Resume");
			scr_recolor_option(1);
			draw_text(_hub_off + (_hub_rest * _tna) + _opt_xd, (_opt_ht * 2) + _opt_margin + (_opt_off * 2), "Options");
			scr_recolor_option(2);
			draw_text(_hub_off + (_hub_rest * _tna) + _opt_xd, (_opt_ht * 3) + _opt_margin + (_opt_off * 3), "Extras");
			scr_recolor_option(3);
			draw_text(_hub_off + (_hub_rest * _tna) + _opt_xd, (_opt_ht * 4) + _opt_margin + (_opt_off * 4), "Menu");
			scr_recolor_option(4);
			draw_text(_hub_off + (_hub_rest * _tna) + _opt_xd, (_opt_ht * 5) + _opt_margin + (_opt_off * 5), "Exit");
		}
		
		draw_set_color(c_white);
		draw_set_alpha(1);
		draw_rectangle(_hub_off + (_hub_rest * _tnb), 0, _hub_off + (_hub_rest * _tnb) + _hub_wd, 270, false);
		
		if (_tnb > 0) {
			draw_set_color(c_black);
			draw_roundrect(_hub_off + (_hub_rest * _tnb) + (_opt_xd / 2), (_opt_ht * (pause_option + 1)) + (_opt_off * (pause_option + 1)) + _opt_margin - _sel_off,
				_hub_off + (_hub_rest * _tnb) + _hub_wd - (_opt_xd / 2), (_opt_ht * (pause_option + 1)) + (_opt_off * (pause_option + 1)) + _opt_margin + _sel_off, false);
			switch(pause_menu_sec) {
				case 1:
					scr_recolor_option(0, 1);
					draw_text(_hub_off + (_hub_rest * _tnb) + _opt_xd, _opt_ht + _opt_off + _opt_margin, "Back");
					scr_recolor_option(1, 1);
					draw_text(_hub_off + (_hub_rest * _tnb) + _opt_xd, (_opt_ht * 2) + _opt_margin + (_opt_off * 2), "Fullscreen");
					scr_recolor_option(2, 1);
					draw_text(_hub_off + (_hub_rest * _tnb) + _opt_xd, (_opt_ht * 3) + _opt_margin + (_opt_off * 3), "Music");
					scr_recolor_option(3, 1);
					draw_text(_hub_off + (_hub_rest * _tnb) + _opt_xd, (_opt_ht * 4) + _opt_margin + (_opt_off * 4), "Sound");
					break;
			}
		}
	}

for(i = 0; i < inv_max; i++) {
	draw_sprite_ext(spr_space_cow, 0, 320 + (i * 32), 32, 1, 1, 0, c_black, 1);
}
for(i = 0; i < inv_total; i++) {
	draw_sprite_ext(inv_spr[i], 0, 320 + (i * 32), 32, 1, 1, 0, c_white, 1);
}

