/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprite_index, image_index, x, y + (3 * sin(control.flow / 20)) + (draw_angle / 25), image_xscale - (sign(image_xscale) * (size_dist / 2)), image_yscale - (size_dist / 2), draw_angle, image_blend, image_alpha);
