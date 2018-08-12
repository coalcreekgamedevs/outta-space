/// @description Insert description here
// You can write your code in this editor
vxx = camera_get_view_x(view_camera[0]);
vyy = camera_get_view_y(view_camera[0]);
vww = camera_get_view_width(view_camera[0]);
vhh = camera_get_view_height(view_camera[0]);

instance_activate_all();
instance_deactivate_region(x - 300, y - 150, 600, 300, false, true);

instance_activate_object(par_solid);
instance_deactivate_region(x - 1000, y - 1000, 2000, 2000, false, true);

instance_activate_object(obj_ufo);
