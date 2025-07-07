// Clear surface once per frame before all lights
if (!surface_exists(global.surf_light)) {
    global.surf_light = surface_create(room_width, room_height);
}
surface_set_target(global.surf_light);
draw_clear_alpha(c_black, 0.9); // Full black with full alpha
surface_reset_target();

// Draw the final darkness surface on top of the room
if (surface_exists(global.surf_light)) {
    draw_surface(global.surf_light, 0, 0);
}