var _i = 1;
if (argument_count > 0) {
	_i = 0;
}

flash = 1;
flash_col = c_drop;
shake += 3;
sfx_play(snd_ufo_beam_release);
switch(inv[inv_total - 1 - inv_drop]) {
	case "cow":
		instance_create_depth(x, y, -100, obj_space_cow);
		break;
	case "gameboy":
		instance_create_depth(x, y, -100, obj_gameboy);
		break;
}
if (_i) {
	inv_drop += 1;
}