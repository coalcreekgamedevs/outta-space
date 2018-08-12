///render_trail()
///@description render_trail()
//Draws a smooth triangle-based trail behind a moving object
//Works in conjunction with init_image_trail() & image_trail()
draw_set_color(trail_color);
draw_set_alpha(1);
draw_primitive_begin(pr_trianglestrip);
trail = 0;
repeat(trails + 1) {
	draw_set_alpha(((trails + 1) / trail) * 0.2);
    if (trail = trails) {
        draw_vertex(trail_x[trail], trail_y[trail]);
        } else {
        draw_vertex(trail_x[trail] + lengthdir_x((trails / median(1, trail ^ 0.9, trails)) * trail_size, trail_angle[trail] + 90), trail_y[trail] + lengthdir_y((trails / median(1, trail ^ 0.9, trails)) * trail_size, trail_angle[trail] + 90));
        draw_vertex(trail_x[trail] + lengthdir_x((trails / median(1, trail ^ 0.9, trails)) * trail_size, trail_angle[trail] - 90), trail_y[trail] + lengthdir_y((trails / median(1, trail ^ 0.9, trails)) * trail_size, trail_angle[trail] - 90));
        }
    trail += 1;
    }
draw_primitive_end();
