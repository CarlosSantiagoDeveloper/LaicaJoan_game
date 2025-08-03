// === Calculate distance to player ===

var dist = point_distance(x, y, obj_player.x, obj_player.y);

if (dist < range&&!obj_player.hiding) {
    // Update direction toward player
	move_speed = 5
	if(alarm[1]==-1){
		audio_play_sound(ghost_sound,1,0,0.7)
		alarm[1] = room_speed*10;
	}
    dir = point_direction(x, y, obj_player.x, obj_player.y);
} else{
	move_speed = 3
}

// Move in current direction
if(alarm[0]<1){
	x += lengthdir_x(move_speed, dir);
	y += lengthdir_y(move_speed, dir);
}
var pos = scr_loop(x,y);
x = pos[0]
y = pos[1]

if(lengthdir_x(move_speed, dir)<0){
	image_xscale = -1;	
} else{
		image_xscale = 1;	
}
image_alpha = 0.4 + random_range(-0.4,0.4)