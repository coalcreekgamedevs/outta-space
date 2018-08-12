
render_trail();

if (flash > 0) {
	draw_set_alpha(median(0, flash, 0.8));
	gpu_set_blendmode(bm_add);
	draw_circle_color(x, y, 150 + (50 * (flash - 0.5)), flash_col, c_black, false);
	gpu_set_blendmode(bm_normal);
}
 
if (beam > 0) {
	draw_set_color(c_pickup);
	draw_set_alpha(beam * 5);
	gpu_set_blendmode(bm_add);
	draw_primitive_begin(pr_trianglestrip);
	draw_vertex(x + lengthdir_x(10 * beam, draw_angle), y + lengthdir_y(10 * beam, draw_angle));
	draw_vertex(x + lengthdir_x(10 * beam, draw_angle + 180), y + lengthdir_y(10 * beam, draw_angle + 180));
	draw_set_alpha(0);
	draw_vertex(x + lengthdir_x(150 * beam, -90 + (10 * beam) + draw_angle), y + lengthdir_y(150 * beam, -90 + (10 * beam) + draw_angle));
	draw_vertex(x + lengthdir_x(150 * beam, -90 - (10 * beam) + draw_angle), y + lengthdir_y(150 * beam, -90 - (10 * beam) + draw_angle));
	draw_primitive_end();
	gpu_set_blendmode(bm_normal);
}
draw_set_alpha(1);
draw_set_color(c_red);
//draw_rectangle(x + lengthdir_x(10 * beam, draw_angle) + median(0, draw_angle * 3, xSpd_max * 6), y + lengthdir_y(10 * beam, draw_angle),
//			x - lengthdir_x(10 * beam, draw_angle) + median(-xSpd_max * 6, draw_angle * 3, 0), y + 150, true);
//draw_rectangle(x + lengthdir_x(10 * beam, draw_angle), y + lengthdir_y(10 * beam, draw_angle),
//				x + lengthdir_x(150 * beam, -90 + draw_angle) - lengthdir_x(10 * beam, draw_angle), y + lengthdir_y(150 * beam, -90 + draw_angle) - lengthdir_y(10 * beam, draw_angle), true);

draw_sprite_ext(sprite_index, image_index, x, y + (4 * sin(control.flow / 10)), image_xscale, image_yscale, draw_angle + (6 * sin(control.flow / 15)), image_blend, image_alpha);