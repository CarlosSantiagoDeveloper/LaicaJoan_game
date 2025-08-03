if(!obj_player.hiding&&!obj_player.sleeping){
	x = obj_player.x
	y = obj_player.y-250
} else {
	
	var target_x = obj_player.x;
	var target_y = obj_player.oriy - 250;
	var spd = 14
	if (point_distance(x, y, target_x, target_y) > spd+1) {
	    move_towards_point(target_x, target_y, spd);
	} else {
	    x = target_x;
	    y = target_y;
	}
		
}


