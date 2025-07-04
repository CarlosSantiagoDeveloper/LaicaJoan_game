var dist_to_player = point_distance(x, y, obj_player.x, obj_player.y);
if (dist_to_player <= 100) {
    // I'm in the light
    can_move = false;
} else {
    // I'm in the dark
    can_move = true;
}

if (can_move) {
    x += 1; // or whatever your movement is
}

can_see = false;

with (obj_light_source) {
    if (point_distance(other.x, other.y, x, y) <= light_radius) {
        other.can_see = true;
    }
}