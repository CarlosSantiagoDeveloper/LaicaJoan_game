var _z = 0; // Closest to screen

// Turn on 3D and Z buffer
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

var _u_pos = u_pos;
var _u_pos2 = u_pos2;
var _u_z = u_z;
var _u_z2 = u_z2;
var _vb = vb;

for (var i = 0; i < instance_number(obj_light); i++) {
    var l = instance_find(obj_light, i);

    // Draw shadow volume at depth _z

    shader_set(shd_shadow);
    shader_set_uniform_f(_u_pos2, l.x, l.y);
    shader_set_uniform_f(_u_z2, _z);
    vertex_submit(_vb, pr_trianglelist, -1);


    // Draw light texture at same depth
    gpu_set_blendmode(bm_add);
    shader_set(shd_light);
    shader_set_uniform_f(_u_pos, l.x, l.y);
    shader_set_uniform_f(_u_z, _z);
    draw_rectangle(0, 0, room_width, room_height, false);
    gpu_set_blendmode(bm_normal);
	
    _z -= 1; // Draw next light/shadow further back (higher Z = farther)
}


shader_reset();
gpu_set_ztestenable(false);
gpu_set_zwriteenable(false);