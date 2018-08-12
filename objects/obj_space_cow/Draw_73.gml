/// @description Insert description here
// You can write your code in this editor
if (txt != 0) {
var fly = (3 * sin(control.flow / 20)) - (10 * txt_fly);
	draw_set_color(c_black);
	draw_set_alpha(txt_fly);
	draw_roundrect(x - (string_width(txt) / 1.5), y - 40 + fly, x + (string_width(txt) / 1.5), y - 20 + fly, false);
	draw_set_color(c_white);
	draw_set_font(fo_header2);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(x, y - 30 + fly, txt);
}