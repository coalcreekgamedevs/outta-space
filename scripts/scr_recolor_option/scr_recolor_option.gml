//@desc scr_recolor_option(#, inv)
//@param option number
//@param *invert?

var _a = c_black;
var _b = c_white;
if (argument_count > 1) {
	if (argument[1] = 1) {
		var _a = c_white;
		var _b = c_black;
	}
}
if (pause_option = argument[0]) {
	draw_set_color(_a);
} else {
	draw_set_color(_b);
}