if (!surface_exists(dark_surf)) {
    dark_surf = surface_create(room_width, room_height);
}

surface_set_target(dark_surf);
draw_clear_alpha(c_black, 0); // clear fully

// === Full black overlay ===
draw_set_alpha(0.2);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);

// === Begin light subtraction ===
gpu_set_blendmode(bm_subtract);
draw_set_alpha(0.2 + random_range(-0.05, 0.05));
draw_set_color(c_white); // white subtracts from black

if(instance_exists(obj_light)&&obj_light.on){

	lightSource(obj_light,ray_count,light_radius,dir,angle)

}



gpu_set_blendmode(bm_normal);


draw_set_alpha(1)

surface_reset_target();


// === Draw final darkness surface to screen ===
if (surface_exists(dark_surf)) {
    draw_surface(dark_surf, 0, 0);
}



