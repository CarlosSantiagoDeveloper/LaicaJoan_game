x = mouse_x
y = mouse_y

if(mouse_check_button_pressed(mb_left)){
	var light = instance_create_layer(x,y,"Instances",obj_light)	

	obj_setup.r = random_range(0.0,1.0);
	obj_setup.g = random_range(0.0,1.0);
	obj_setup.b = random_range(0.0,1.0);

}