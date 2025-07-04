// === Create surface if needed ===
if (!surface_exists(surf_dark)) {
    surf_dark = surface_create(display_get_width(), display_get_height());
}

// === Set surface target ===
surface_set_target(surf_dark);
draw_clear_alpha(c_black, 0); // Clear it fully

// === Draw full darkness ===
draw_set_alpha(0.95); // how dark the world is
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_width(), display_get_height(), false);

lightSource(obj_player)

lightSource(obj_light)

// === End drawing to surface ===
surface_reset_target();

// === Draw the darkness surface over the screen ===
if (surface_exists(surf_dark)) {
    draw_surface(surf_dark, 0, 0);
}