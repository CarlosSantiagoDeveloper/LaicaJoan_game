// === Cut light from other sources ===
function lightSource(_obj){
	with (_obj) {
	    var lx = x - camera_get_view_x(view_camera[0]);
	    var ly = y - camera_get_view_y(view_camera[0]);
	    draw_set_alpha(1);
	    draw_set_color(c_white);
	    gpu_set_blendmode(bm_subtract);
	    draw_circle(lx, ly, light_radius, false);
	    gpu_set_blendmode(bm_normal);
	}

}