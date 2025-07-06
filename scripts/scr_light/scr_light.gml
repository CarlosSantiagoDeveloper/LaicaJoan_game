// === Cut light from other sources ===
/// @function lightSource(_obj, _ray_count, _direction, _angle)
/// @desc Draws a circular or cone-shaped light using raycasting.
/// @param _obj         The object to emit light from.
/// @param _ray_count   Number of rays to cast (quality).
/// @param _direction   Center direction in degrees (e.g. 90 = down).
/// @param _angle       Cone angle (e.g. 90 = flashlight, 360 = full light)

function lightSource(_obj, _ray_count,_light_radius, _direction, _angle) {
	
		_ray_count = _angle/360*_ray_count
	with (_obj) {
		
		
	    var origin_x = x;
	    var origin_y = y;
	    var points = [];

	    var half_angle = _angle * 0.5;
	    var start_angle = _direction - half_angle;
	    var step_angle = _angle / (_ray_count - 1); // -1 to close the fan cleanly

	    for (var i = 0; i < _ray_count; i++) {
	        var angle = start_angle + (i * step_angle);
	        var test_x = origin_x + lengthdir_x(_light_radius, angle);
	        var test_y = origin_y + lengthdir_y(_light_radius, angle);

	        var result = get_collision_point(origin_x, origin_y, test_x, test_y, obj_wall);
	        var lx = result[0];
	        var ly = result[1];

	        // convert to view space for drawing
	        lx -= camera_get_view_x(view_camera[0]);
	        ly -= camera_get_view_y(view_camera[0]);
	        var view_origin_x = origin_x - camera_get_view_x(view_camera[0]);
	        var view_origin_y = origin_y - camera_get_view_y(view_camera[0]);

	        array_push(points, [lx, ly]);
	    }

	    var len = array_length(points);
	    for (var i = 0; i < len - 1; i++) {
	        var p1 = points[i];
	        var p2 = points[i + 1];
			
	        draw_triangle(view_origin_x, view_origin_y, p1[0], p1[1], p2[0], p2[1], false);
			
	    }

	    // Optionally close the fan:
	    if (_angle == 360) {
	        var p1 = points[len - 1];
	        var p2 = points[0];
		
	        draw_triangle(view_origin_x, view_origin_y, p1[0], p1[1], p2[0], p2[1], false);
	    }
	}
}

function get_collision_point(x1, y1, x2, y2, obj) {
    var dx = x2 - x1;
    var dy = y2 - y1;
    var len = point_distance(x1, y1, x2, y2);
    var steps = floor(len);

    for (var i = 0; i <= steps; i++) {
        var px = x1 + (dx / steps) * i;
        var py = y1 + (dy / steps) * i;
        if (position_meeting(px, py, obj)) {
            return [px, py]; // First point of collision
        }
    }

    return [x2, y2]; // No collision, return endpoint
}