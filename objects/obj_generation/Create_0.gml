//wall_object = [obj_picture_frame]
//floor_object = [obj_car]
wall_number = 10; //atleast
floor_number = 1;

if (instance_number(obj_wall_area) > 0) {
	var _area_num = instance_number(obj_wall_area)
	var _areas = [];
	var _x = []

	for(var i=0;i<_area_num;i++){ //adds areas to _areas
		var _area = instance_nearest(x,y,obj_wall_area);
		array_push(_x,_area.x) // stores x position before removing area
		_area.x = -100000 //Removes area so that its not the nearest any more
		array_push(_areas,_area)
	}
	for(var i=0;i<_area_num;i++){ //Returns areas to original position
		_areas[i].x = _x[i];  
	}
    var rx, ry;
	//show_debug_message("Hi")
	for(var i=0;i<_area_num;i++){ 
		//show_debug_message("Hi")
		repeat (wall_number) {
		    repeat (10) {
				//show_debug_message("Hi")
		        rx = irandom_range(_areas[i].bbox_left, _areas[i].bbox_right);
		        ry = irandom_range(_areas[i].bbox_top, _areas[i].bbox_bottom);

		        if (!place_meeting(rx, ry, obj_picture_frame)) {
		            var pics = instance_create_layer(rx, ry, "Instances", obj_picture_frame);
					
		            break;
		        }
		    }
		}
	}
}

//FLoor

if (instance_number(obj_floor_area) > 0) {
	var _area_num = instance_number(obj_floor_area)
	var _areas = [];
	var _x = []

	for(var i=0;i<_area_num;i++){ //adds areas to _areas
		var _area = instance_nearest(x,y,obj_floor_area);
		array_push(_x,_area.x) // stores x position before removing area
		_area.x = -100000 //Removes area so that its not the nearest any more
		array_push(_areas,_area)
	}
	for(var i=0;i<_area_num;i++){ //Returns areas to original position
		_areas[i].x = _x[i];  
	}
    var rx, ry;
	//show_debug_message("Hi")
	for(var i=0;i<_area_num;i++){ 
		//show_debug_message("Hi")
		repeat (floor_number) {
		    repeat (10) {
				//show_debug_message("Hi")
		        rx = irandom_range(_areas[i].bbox_left, _areas[i].bbox_right);
		        ry = irandom_range(_areas[i].bbox_top, _areas[i].bbox_bottom);

		        if (!place_meeting(rx, ry, obj_car)) {
		            var pics = instance_create_layer(rx, ry, "Instances", obj_car);
					
		            break;
		        }
		    }
		}
	}
}

