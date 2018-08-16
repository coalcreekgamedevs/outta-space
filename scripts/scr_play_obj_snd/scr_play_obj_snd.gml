
switch(obj_type) {
	case "cow":
		sfx_random(snd_cow_moo1, snd_cow_moo2);
		break;
	case "gameboy":
		sfx_play(snd_gameboy);
		break;
	case "squid":
		sfx_play(snd_squid);
		break;
	case "guitar":
		sfx_play(snd_guitar);
		break;
	case "ironore":
		sfx_play(snd_ironore);
		break;
	case "boombox":
		sfx_play(snd_boombox);
		break;
	case "record":
		sfx_play(snd_record);
		break;
	case "phonograph":
		sfx_play(snd_phonograph);
		break;
	case "polygold":
		sfx_play(snd_polygold);
		break;
	case "cartridge":
		sfx_play(snd_cartridge);
		break;
	case "cassette":
		sfx_play(snd_cassette);
		break;
	case "vase":
		sfx_play(snd_vase);
		break;
	case "piggy":
		sfx_play(snd_piggy);
		break;
	case "car":
		if (image_index = 0) {
			sfx_play(snd_car_broken);
		} else {
			sfx_play(snd_car);
		}
		break;
}