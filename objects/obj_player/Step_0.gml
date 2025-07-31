// === PLAYER INPUT ===
var move = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var jump = keyboard_check_pressed(vk_space);

// === CONSTANTS ===


// === HORIZONTAL MOVEMENT ===
hsp = move * move_speed;
vsp += grav;
vsp = clamp(vsp, -1000, max_fall); // limit fall speed
// Infinite Room logic for X
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
	obj_camera.y = 4608-200
    y = 4608;
} else if (y > 4608) {
    y = 2304;
	obj_camera.y = 2304-200
	obj_light.on = false;
}
// === JUMPING ===
if (place_meeting(x, y + 1, obj_wall) && jump) {
    vsp = jump_speed;
}

// === HORIZONTAL COLLISION ===
if (place_meeting(x + hsp, y, obj_wall)) {
    while (!place_meeting(x + sign(hsp), y, obj_wall)) {
        x += sign(hsp);
    }
    hsp = 0;
}
x += hsp;

// === VERTICAL COLLISION ===
if (place_meeting(x, y + vsp, obj_wall)) {
    while (!place_meeting(x, y + sign(vsp), obj_wall)) {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;


//light_dir = point_direction(x, y, mouse_x, mouse_y);

light.x = x
light.y = y
