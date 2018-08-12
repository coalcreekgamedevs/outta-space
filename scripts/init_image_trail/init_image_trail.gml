///init_image_trail(trail length, trail size, *trail color)
///@description init_image_trail[trail length, trail size, *trail_color)
///@param trail length
///@param trail size
var tc = c_white;
if (argument_count > 2) {
    tc = argument[2];
    }
trail_x = 0;
trail_y = 0;
trail_angle = 0;
trail_size = argument[1];
trail_color = tc;
trail = -1;
trails = argument[0];
repeat(trails + 1) {
    trail += 1;
    trail_x[trail] = x;
    trail_y[trail] = y;
    trail_angle[trail] = image_angle;
    }
