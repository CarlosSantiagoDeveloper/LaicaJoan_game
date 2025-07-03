// === PLAYER INPUT ===
var move = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var jump = keyboard_check_pressed(vk_space);

// === CONSTANTS ===


// === HORIZONTAL MOVEMENT ===
hsp = move * move_speed;
vsp += grav;
vsp = clamp(vsp, -1000, max_fall); // limit fall speed

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