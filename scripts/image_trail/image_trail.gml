///image_trail(x, y, image angle)
///@description image_trail(x, y, image angle)
///@param x
///@param y
///@param image angle
trail_x[0] = argument[0];
trail_y[0] = argument[1];
trail_angle[0] = argument[2];
trail = trails;
repeat(trails) {
    trail_x[trail] = trail_x[trail - 1];
    trail_y[trail] = trail_y[trail - 1];
    trail_angle[trail] = trail_angle[trail - 1];
    trail -= 1;
    }
