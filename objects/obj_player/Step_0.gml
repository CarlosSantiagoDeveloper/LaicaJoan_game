// === PLAYER INPUT ===
var right = keyboard_check(ord("D"))
var left = keyboard_check(ord("A"))
var up = keyboard_check(ord("W")) || keyboard_check(vk_up)
var down = keyboard_check(ord("S")) 

if(climb){
var right = keyboard_check(ord("D")) || keyboard_check(ord("S"))
var left = keyboard_check(ord("A")) || keyboard_check(ord("W"))
}
// === CONSTANTS ===
move = right - left

// === HORIZONTAL MOVEMENT ===
hsp = move * move_speed;

vsp = clamp(vsp, -1000, max_fall); // limit fall speed
// Infinite Room logic for X
if(true){
	if (x < 2732) {
		obj_light.on = false;
		obj_camera.x = 5464
	    x = 5464;
	} else if (x > 5464) {
	    x = 2732;
		obj_camera.x = 2732
		obj_light.on = false;
	}
	// Infinite Room logic for Y
	if (y < 2304) {
		obj_light.on = false;
		obj_camera.y = 4607-320
	    y = 4607;
	} else if (y > 4608) {
	    y = 2305;
		obj_camera.y = 2305-320
		obj_light.on = false;
	}
}
// === JUMPING ===

if(place_meeting(x + hsp, y+1, obj_stairs)&&down){
	climb = true;
}
if (place_meeting(x + hsp, y, obj_stairs)&&up) {
	climb = true;	
}
    // Climbing up (moving right)
if(climb){
	vsp += grav;
    var yplus = 0;
	while (place_meeting(x + hsp, y-yplus, obj_stairs)&&yplus<=abs(3*hsp)) yplus+=1;
    if (place_meeting(x + hsp, y-yplus, obj_stairs))
	{
		//while (!place_meeting(x + sign(hsp), y, obj_stairs)) x+=sign(hsp)
		//hsp = 0;
	}
	else
	{
		y-= yplus;	
	}
}
x += hsp;

// === VERTICAL COLLISION ===
if(place_meeting(x,y+vsp,obj_wall)&&!place_meeting(x+1,y,obj_wall)&&!place_meeting(x-1,y,obj_wall)){
	while(!place_meeting(x,y+sign(vsp),obj_wall)){
		y += sign(vsp);
	}
	climb = false
	vsp = 0	
}
if(place_meeting(x,y+vsp,obj_stairs)){
	while(!place_meeting(x,y+sign(vsp),obj_stairs)){
		y += sign(vsp);
	}
	
	vsp = 0	
}
y += vsp;
//Going up the stairs
// === SLOPE WALKING ===

//light_dir = point_direction(x, y, mouse_x, mouse_y);

light.x = x
light.y = y
