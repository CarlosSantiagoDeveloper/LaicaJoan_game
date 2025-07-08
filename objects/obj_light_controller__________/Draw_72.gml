if (!surface_exists(global.surf_darkness)) {
    global.surf_darkness = surface_create(room_width, room_height);
} else if (surface_get_width(global.surf_darkness) != room_width || surface_get_height(global.surf_darkness) != room_height) {
    surface_free(global.surf_darkness);
    global.surf_darkness = surface_create(room_width, room_height);
}

// Clear the surface to full darkness only once per frame
surface_set_target(global.surf_darkness);
draw_clear_alpha(c_black, 1);
surface_reset_target();