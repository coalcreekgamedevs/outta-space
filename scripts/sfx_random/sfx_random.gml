///sfx_random
//var picks = argument_count + 1;
var sfx = median(1, irandom(argument_count - 1) + 1, argument_count);
switch(sfx) {
	case 1:
		sfx_play(argument[0]);
		break;
	case 2:
		sfx_play(argument[1]);
		break;
	case 3:
		if (argument_count > 2) {
			sfx_play(argument[2]);
		}
		break;
	case 4:
		if (argument_count > 3) {
			sfx_play(argument[3]);
		}
		break;
	case 5:
		if (argument_count > 4) {
			sfx_play(argument[4]);
		}
		break;
}