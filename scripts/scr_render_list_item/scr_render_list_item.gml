///
//@param Center from Left 1
//@param Top Line Value 2
//@param Scaling 3
//@param Direction Up 4
//@param Check Start Value X 5
//@param Middle from Top 6
//@param Check Start Value Y 7
//@param Text Scaling 8
//@param Direction Horizontal 9
//@param Line Start X 10
//@param Line Start Y 11
//@param Text 12
//@param Checked/Unchecked 13

var _x = scr_calc_tablet_line(argument[1], argument[2], argument[3], 1),
	_y = scr_calc_tablet_line(argument[1], argument[2], argument[3]);

draw_sprite_ext(spr_checkbox, 0, argument[0] + _x + argument[4], argument[5] + _y + argument[6], argument[7], argument[7], argument[8], c_white, 1);
if (argument[12] = 1) {
	draw_sprite_ext(spr_checkbox, 1, argument[0] + _x + argument[4], argument[5] + _y + argument[6], argument[7], argument[7], argument[8], c_white, 1);
}
draw_text_transformed(argument[0] + _x + argument[9], argument[5] + _y + argument[10], argument[11], argument[7], argument[7], argument[8]);
	