///sfx_random
//var picks = argument_count + 1;
switch(irandom(argument_count)) {
	case 0:
		audio_play_sound(argument[0], 1, 0);
		break;
	case 1:
		audio_play_sound(argument[1], 1, 0);
		break;
	case 2:
		audio_play_sound(argument[2], 1, 0);
		break;
	case 3:
		audio_play_sound(argument[3], 1, 0);
		break;
	case 4:
		audio_play_sound(argument[4], 1, 0);
		break;
}