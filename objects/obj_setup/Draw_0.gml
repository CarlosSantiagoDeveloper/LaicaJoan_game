var _z = 0; // Closest to screen

// Turn on 3D and Z buffer
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

var _u_pos = u_pos;
var _u_pos2 = u_pos2;
var _u_z = u_z;
var _u_z2 = u_z2;
var _vb = vb;
var _u_color = u_color;
var _u_color2 = u_color2;
var _u_pos3 = u_pos3;
var _u_z3 = u_z3;
//angel
var _u_dir = u_dir;
var _u_angle = u_angle;
//direction
//color
var _r = r
var _g = g
var _b = b
//color2
var _r2 = r2
var _g2 = g2
var _b2 = b2
//shadow dir and ang
var _u_dir2 = u_dir2;
var _u_angle2 = u_angle2;
//angle and dir
var _angle = angle
var _dir = dir
for (var i = 0; i < instance_number(obj_light); i++) {
    var l = instance_find(obj_light, i);

    // Draw shadow volume at depth _z

    shader_set(shd_shadow);
    shader_set_uniform_f(_u_pos2, l.x, l.y);
    shader_set_uniform_f(_u_z2, _z);
	shader_set_uniform_f(_u_dir2, l.x, l.y);       // normalized direction
	shader_set_uniform_f(_u_angle2, _angle);         // half-cone angle in degrees
    vertex_submit(_vb, pr_trianglelist, -1);


    // Draw light texture at same depth
    gpu_set_blendmode(bm_add);
    shader_set(shd_light);
	//direction
	var dir_vec = [1, 0]; // Unit vector
	shader_set_uniform_f(_u_dir, _dir[0], _dir[1]);
	//angle
	// Set cone angle
	shader_set_uniform_f(_u_angle, _angle); // 30 degrees cone (60 full)
    shader_set_uniform_f(_u_pos, l.x, l.y);
    shader_set_uniform_f(_u_z, _z);
	shader_set_uniform_f(_u_color, _r,_g,_b); // RGB for blue
	draw_rectangle(0,0,room_width,room_height,0)
    //draw_surface(application_surface, 0, 0);
    gpu_set_blendmode(bm_normal);
	
    _z -= 1; // Draw next light/shadow further back (higher Z = farther)
}
for (var i = 0; i < instance_number(obj_light2); i++) {
    var l = instance_find(obj_light2, i);

    // Draw light texture at same depth
    gpu_set_blendmode(bm_add);
    shader_set(shd_light2);
    shader_set_uniform_f(_u_pos3, l.x, l.y);
    shader_set_uniform_f(_u_z3, _z);
	shader_set_uniform_f(_u_color2, _r2,_g2,_b2); // RGB for blue
	draw_rectangle(0,0,room_width,room_height,0)
    //draw_surface(application_surface, 0, 0);
    gpu_set_blendmode(bm_normal);
	
    _z -= 1; // Draw next light/shadow further back (higher Z = farther)
}



shader_reset();
gpu_set_ztestenable(false);
gpu_set_zwriteenable(false);

draw_text(10,10,"r= "+string(r)+" g= "+string(g)+" b= "+string(b))