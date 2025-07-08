var _hidden = true; // Start assuming it's in shadow

with (obj_light) {
    var dist = point_distance(x, y, other.x, other.y);
    var angle = point_direction(x, y, other.x, other.y);

    var steps = floor(dist / 4);
    var blocked = false;

    for (var i = 0; i < steps; i++) {
        var px = x + lengthdir_x(i * 4, angle);
        var py = y + lengthdir_y(i * 4, angle);

        if (instance_position(px, py, obj_wall)) {
            blocked = true;
            break;
        }
    }

    // If at least one light is not blocked, the object is not in shadow
    if (!blocked) {
        _hidden = false;
    }
}
//show_debug_message(_hidden)