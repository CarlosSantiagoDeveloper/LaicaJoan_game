// === Cut light from other sources ===
/// @function lightSource(_obj, _ray_count, _direction, _angle)
/// @desc Draws a circular or cone-shaped light using raycasting.
/// @param _obj         The object to emit light from.
/// @param _ray_count   Number of rays to cast (quality).
/// @param _direction   Center direction in degrees (e.g. 90 = down).
/// @param _angle       Cone angle (e.g. 90 = flashlight, 360 = full light)

function lightSource(_obj, _ray_count, _light_radius, _direction, _angle) {
    var cam_x = camera_get_view_x(view_camera[0]);
    var cam_y = camera_get_view_y(view_camera[0]);

    with (_obj) {
        var origin_x = x - cam_x;
        var origin_y = y - cam_y;

        var half_angle = _angle * 0.5;
        var start_angle = _direction - half_angle;
        var step_angle = _angle / (_ray_count - 1);

        draw_primitive_begin(pr_trianglefan);
        draw_vertex(origin_x, origin_y); // Cone's center

        for (var i = 0; i < _ray_count; i++) {
            var angle = start_angle + (i * step_angle);
            var px = x + lengthdir_x(_light_radius, angle) - cam_x;
            var py = y + lengthdir_y(_light_radius, angle) - cam_y;
            draw_vertex(px, py);
        }

        draw_primitive_end();
    }
}




//Creates Quad with two triangles. Used to make the shadows.
//Z coordinate is used as a flag to determine if the vertex will be repositioned in the shader
function Quad(_vb,_x1,_y1,_x2,_y2){
    //Upper triangle
    vertex_position_3d(_vb,_x1,_y1,0);
    vertex_position_3d(_vb,_x1,_y1,1); //repositioned vertex
    vertex_position_3d(_vb,_x2,_y2,0);

    //Lower Triangle
    vertex_position_3d(_vb,_x1,_y1,1); //repositioned vertex
    vertex_position_3d(_vb,_x2,_y2,0);
    vertex_position_3d(_vb,_x2,_y2,1); //repositioned vertex
}