if (!surface_exists(dark_surf)) {
    dark_surf = surface_create(display_get_width(), display_get_height());
}

surface_set_target(dark_surf);
draw_clear_alpha(c_black, 0); // clear fully

// === Full black overlay ===
draw_set_alpha(0.8);
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_width(), display_get_height(), false);

// === Begin light subtraction ===
gpu_set_blendmode(bm_subtract);
draw_set_alpha(1);
draw_set_color(c_white); // white subtracts from black

lightSource(obj_player,ray_count,obj_player.light_dir,45)


gpu_set_blendmode(bm_normal);
surface_reset_target();

// === Draw final darkness surface to screen ===
if (surface_exists(dark_surf)) {
    draw_surface(dark_surf, 0, 0);
}