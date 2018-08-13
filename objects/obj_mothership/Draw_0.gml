
draw_sprite_ext(spr_mothership, 0, x, y + (5 * sin(control.flow / 50)), image_xscale, image_yscale, image_angle, image_blend, image_alpha);

if (hoob_pos > 0) {
	draw_sprite_ext(spr_hoob, hoob_index, x - 41, y - 1 - (hoob_pos * 13) + (3 * sin(control.flow / 50)), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	draw_sprite_ext(spr_mothership_dock, 0, x, y + (5 * sin(control.flow / 50)), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}