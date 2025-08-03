if(active){
		image_index = 1;
		if(!obj_player.hiding){
			//obj_player.x = obj_player.orix
			obj_player.y = obj_player.oriy
			refreshing = true;
			active = false;	
		}
} else{
	image_index = 0;	
}
if(refreshing){
	image_blend = c_grey
	if(alarm[0]==-1) alarm[0] = refreshingStam;
	if(alarm[0]==0) refreshing = false;
} else image_blend = c_white

