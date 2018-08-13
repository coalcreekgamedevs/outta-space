///sfx_random
//var picks = argument_count + 1;
switch(irandom(argument_count)) {
	case 0:
		sfx_play(argument[0]);
		break;
	case 1:
		sfx_play(argument[1]);
		break;
	case 2:
		sfx_play(argument[2]);
		break;
	case 3:
		sfx_play(argument[3]);
		break;
	case 4:
		sfx_play(argument[4]);
		break;
}