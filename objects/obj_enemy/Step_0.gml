// === Calculate distance to player ===
var dist = point_distance(x, y, obj_player.x, obj_player.y);

if (dist < range) {
    // Update direction toward player
    dir = point_direction(x, y, obj_player.x, obj_player.y);
}

// Move in current direction
x += lengthdir_x(move_speed, dir);
y += lengthdir_y(move_speed, dir);

var pos = scr_loop(x,y);
x = pos[0]
y = pos[1]