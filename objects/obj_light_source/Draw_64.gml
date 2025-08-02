if (!surface_exists(dark_surf)) {
    dark_surf = surface_create(room_width, room_height);
}

surface_set_target(dark_surf);
draw_clear_alpha(c_black, 0); // clear fully

// === Full black overlay ===
draw_set_alpha(0.8);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);

// === Begin light subtraction ===
gpu_set_blendmode(bm_subtract);
draw_set_alpha(0.4 + random_range(-0.02, 0.02));
draw_set_color(c_white); // white subtracts from black

if(instance_exists(obj_light)&&obj_light.on){
	var cam_x = camera_get_view_x(view_camera[0]);
    var cam_y = camera_get_view_y(view_camera[0]);
	lightSource(obj_light,ray_count,light_radius,dir,angle)
	var rad = 25 + random_range(0, 0.5);
	for(var i = 0;i<6;i++){
		draw_circle(obj_light.x-cam_x,obj_light.y-cam_y,rad*i,0)
	}
	
}



gpu_set_blendmode(bm_normal);


draw_set_alpha(1)

surface_reset_target();


// === Draw final darkness surface to screen ===
if (surface_exists(dark_surf)) {
    draw_surface(dark_surf, 0, 0);
}



