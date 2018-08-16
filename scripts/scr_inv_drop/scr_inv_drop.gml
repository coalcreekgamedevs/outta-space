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
	case "squid":
		instance_create_depth(x, y, -100, obj_space_squid);
		break;
	case "guitar":
		instance_create_depth(x, y, -100, obj_guitar);
		break;
	case "briefcase":
		instance_create_depth(x, y, -100, obj_briefcase);
		break;
	case "boombox":
		instance_create_depth(x, y, -100, obj_boombox);
		break;
	case "ironore":
		instance_create_depth(x, y, -100, obj_ironore);
		break;
	case "phonograph":
		instance_create_depth(x, y, -100, obj_phonograph);
		break;
	case "polygold":
		instance_create_depth(x, y, -100, obj_polygold);
		break;
	case "piggy":
		instance_create_depth(x, y, -100, obj_piggy);
		break;
	case "cassette":
		instance_create_depth(x, y, -100, obj_cassette);
		break;
	case "cartridge":
		instance_create_depth(x, y, -100, obj_cartridge);
		break;
	case "vase":
		instance_create_depth(x, y, -100, obj_vase);
		break;
	case "record":
		instance_create_depth(x, y, -100, obj_record);
		break;
	case "car":
		with(instance_create_depth(x, y, -100, obj_car)) {
			image_index = 0;
		}
		break;
}
if (_i) {
	inv_drop += 1;
}