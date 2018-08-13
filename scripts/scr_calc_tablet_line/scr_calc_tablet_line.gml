var _aa = "y";
if (argument_count > 3) {
	_aa = "x"
}
switch(_aa) {
	case "y":
		return lengthdir_y(argument[0] * argument[1], argument[2]);
		break;
	case "x":
		return lengthdir_x(argument[0] * argument[1], argument[2]);
		break;
}