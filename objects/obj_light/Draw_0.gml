// Set light surface
/*
surface_set_target(surf_light);

// Step 1: Fill screen with light
gpu_set_blendmode(bm_normal);
draw_clear_alpha(c_black, 0);
draw_set_color(c_white);
draw_rectangle(0, 0, room_width, room_height, false);

// Step 2: Punch shadow holes using bm_subtract
gpu_set_blendmode(bm_subtract);
shader_set(shd_shadow);
vertex_submit(vb_shadow, pr_trianglelist, -1);
shader_reset();

surface_reset_target();