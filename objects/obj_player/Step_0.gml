// === PLAYER INPUT ===
	 interact = keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_space) 
	 right = keyboard_check(ord("D")) || keyboard_check(vk_right)
	 left = keyboard_check(ord("A")) || keyboard_check(vk_left)
	 up = keyboard_check(ord("W")) || keyboard_check(vk_up)
	 down = keyboard_check(ord("S"))  || keyboard_check(vk_down)

	 sprint = keyboard_check(vk_shift);
	if(climb){
	 right = keyboard_check(ord("D")) || keyboard_check(ord("S"))
	 left = keyboard_check(ord("A")) || keyboard_check(ord("W"))
	}



// === CONSTANTS ===
move = right - left
//======Sprinting=============
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
//=============================


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

//============Climbing Stairs==========
if(place_meeting(x + hsp, y+1, obj_stair_collision)&&down){
	climb = true;
}
if (place_meeting(x + hsp, y, obj_stair_collision)&&up) {
	climb = true;	
}
    // Climbing up (moving right)
if(climb){
	vsp += grav;
    var yplus = 0;
	while (place_meeting(x + hsp, y-yplus, obj_stair_collision)&&yplus<=abs(3*hsp)) yplus+=1;
    if (place_meeting(x + hsp, y-yplus, obj_stair_collision))
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

// ====== VERTICAL COLLISION ===============================
if(place_meeting(x,y+vsp,obj_wall)&&!place_meeting(x+1,y,obj_wall)&&!place_meeting(x-1,y,obj_wall)){
	while(!place_meeting(x,y+sign(vsp),obj_wall)){
		y += sign(vsp);
	}
	climb = false
	vsp = 0	
}
if(place_meeting(x,y+vsp,obj_stair_collision)){
	while(!place_meeting(x,y+sign(vsp),obj_stair_collision)){
		y += sign(vsp);
	}
	
	vsp = 0	
}
y += vsp;
//===================================================================


// ========LIGHT======================

light.x = x-10
light.y = y-280
//=========================

//==================Activate Things================
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
//Activate Bed
if(place_meeting(x,y,obj_bed)&&interact){
	var bed = instance_nearest(x,y,obj_bed)
	bed.active	= true;
		xsleep = bed.x-50
		ysleep = bed.y+100
		depthsleep = bed.depth+1
		sleeping = true;
		sprHidden = spr_player_crouch
		image_alpha = 0;
		beds = true;
	
}
//=============Hidding========================
//Activate Table
if(place_meeting(x,y,obj_table)&&interact){
	var tab = instance_nearest(x,y,obj_table)
	if(!tab.refreshing){
		tab.active	= true;
		xhide = tab.x-20
		yhide = tab.y+120
		depthhide = tab.depth+1
		hiding = true;
		sprHidden = spr_player_crouch
	}
	
}
//Activate Closet
if(place_meeting(x,y,obj_closet)&&interact){
	var clo = instance_nearest(x,y,obj_closet)
	if(!clo.refreshing){
		clo.active	= true;
		xhide = clo.x+50
		yhide = clo.y+30
		depthhide = clo.depth+1
		hiding = true;
		sprHidden = spr_player
		image_alpha = 0;
	}
	
}
//Activate Trunk
if(place_meeting(x,y,obj_trunk)&&interact){
	var clo = instance_nearest(x,y,obj_trunk)
	if(!clo.refreshing){
		clo.active	= true;
		xhide = clo.x+200
		yhide = clo.y+380
		depthhide = clo.depth+1
		hiding = true;
		sprHidden = spr_player
		image_alpha = 0;
	}
	
}


//======Animation===============================================
if(move!=0&&!hiding){
	image_speed = 1	
	image_xscale = sign(move)
}else{
	image_index = 0
	image_speed = 0	
}
if(hiding||sleeping){
	
	image_xscale = 1
	sprite_index = sprHidden;	
} else{
	image_alpha = 1
	sprite_index = sprOri
}
//=======Hidden Logic=============
if(hiding){
	if(interact&&alarm[0]>-1) hiding = false
	if(alarm[0]==-1) {
		alarm[0]=room_speed*4; 
		orix = x;
		oriy = y;
	}
	x = xhide
	y = yhide
	
	if(alarm[0]==0) hiding = false; //If hidden for 3 second, unhide
	depth = depthhide
	
} else if(sleeping){
	if(interact&&alarm[0]>-1) sleeping = false
	if(alarm[0]==-1) {
	
		alarm[0]=room_speed*4000; 
		orix = x;
		oriy = y;
	}
	x = xsleep
	y = ysleep
	
	if(alarm[0]==0) hiding = false; //If hidden for 3 second, unhide
	depth = depthsleep
}
else{
	alarm[0]=-1
	depth = ogiDepth
}
//========================
depth = -y


