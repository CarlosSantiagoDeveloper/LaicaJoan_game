var pause = keyboard_check_pressed(vk_enter)||keyboard_check_pressed(vk_escape)

if(pause){
	if(!instance_exists(obj_book_empty)){
		instance_deactivate_all(1)
		//instance_activate_layer("Darkness")
		var cam_x = camera_get_view_x(view_camera[0]);
		var cam_y = camera_get_view_y(view_camera[0]);
		var cam_w = camera_get_view_width(view_camera[0]);
		var cam_h = camera_get_view_height(view_camera[0]);

		var book = instance_create_layer(cam_x + cam_w / 2, cam_y + cam_h / 2, "Book", obj_book_empty);
	} else{
		instance_activate_all()
		instance_destroy(obj_book_empty)	
	}
}