if(active){
		image_index = 1;
		if(!obj_player.sleeping){
			obj_player.x = obj_player.orix
			obj_player.y = obj_player.oriy
		
			active = false;	
		}
		instance_create_layer(x,y,"Instances",obj_ghost_button_list)
} else{
	image_index = 0;
		instance_destroy(obj_button_ghost_pick)
		instance_destroy(obj_ghost_button_list)
}
