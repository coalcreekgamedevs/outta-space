/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(1);
draw_sprite_tiled(bg_sky, 0, camera_get_view_x(view_camera[0]) / 1.2, camera_get_view_y(view_camera[0]) - 120 + (10 * sin(flow / 200)));
draw_sprite_tiled(bg_sky, 1, camera_get_view_x(view_camera[0]) / 1.5, camera_get_view_y(view_camera[0]) - 50);
draw_sprite_tiled(bg_sky, 2, (camera_get_view_x(view_camera[0]) / 2) + (flow / 3), camera_get_view_y(view_camera[0]) + (3 * sin(flow / 20)) + (6 * sin(flow / 100)) - 70);
draw_sprite_tiled(bg_sky, 3, camera_get_view_x(view_camera[0]) / 3, camera_get_view_y(view_camera[0]) + (3 * sin(flow / 500)) - 6 - (132 * (camera_get_view_y(view_camera[0]) / room_height)));
