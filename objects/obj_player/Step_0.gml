// === PLAYER INPUT ===
var right = keyboard_check(ord("D")) || keyboard_check(vk_right)
var left = keyboard_check(ord("A")) || keyboard_check(vk_left)
var up = keyboard_check(ord("W")) || keyboard_check(vk_up)
var down = keyboard_check(ord("S"))  || keyboard_check(vk_down)
var interact = keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_space) 
var sprint = keyboard_check(vk_shift);
if(climb){
var right = keyboard_check(ord("D")) || keyboard_check(ord("S"))
var left = keyboard_check(ord("A")) || keyboard_check(ord("W"))
}
// === CONSTANTS ===
move = right - left

if(!tired){
	if(stamina<1){
		tired = true;	
	}
if (sprint) { // sprinting
    move_speed = sprint_speed; // Or 2.0 if you want faster sprinting
	stamina -= 1;
	
} else{ //not sprinting but stamina left
	move_speed = normal_speed;	
	if(stamina<max_stamina){ //Cap stamina at max
		stamina += 0.5; //
	}
	
}
} else{ //Tired
	if(stamina<max_stamina){ //Cant sprint while recovering stamina
	move_speed = normal_speed;	
	stamina += 0.5;
	} else{ // no longer tired
	tired = false;
	}
}


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
		obj_camera.y = 4607-250
	    y = 4607;
	} else if (y > 4608) {
	    y = 2305;
		obj_camera.y = 2305-250
		obj_light.on = false;
	}
}


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

light.x = x-10
light.y = y-280


//Activate things-----------------------
//Activate car
if(place_meeting(x,y,obj_car)&&interact){
	var car = instance_nearest(x,y,obj_car)
	car.active	= true;
}
//Activate Music box
if(place_meeting(x,y,obj_music_box)&&interact){
	var box = instance_nearest(x,y,obj_music_box)
	box.active	= true;
}

if(move!=0){
	image_speed = 1	
	image_xscale = sign(move)
}else{
	image_index = 0
	image_speed = 0	
}


