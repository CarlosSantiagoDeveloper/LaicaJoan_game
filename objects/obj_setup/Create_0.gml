//Vertex format and buffer setup
vertex_format_begin();
vertex_format_add_position_3d();

vf = vertex_format_end();
vb = vertex_create_buffer();


//shadow
u_dir2 = shader_get_uniform(shd_shadow,"u_dir")     
u_angle2 = shader_get_uniform(shd_shadow,"u_angle")  
u_pos2 = shader_get_uniform(shd_shadow,"u_pos");
u_z2 = shader_get_uniform(shd_shadow,"u_z");
//Shader uniform variable setup
u_pos = shader_get_uniform(shd_light,"u_pos");

u_pos3 = shader_get_uniform(shd_light2,"u_pos");
u_z = shader_get_uniform(shd_light,"u_z");

u_z3 = shader_get_uniform(shd_light2,"u_z");
//set direction
u_dir = shader_get_uniform(shd_light, "u_dir");
//set angle
u_angle = shader_get_uniform(shd_light, "u_cone_angle");
//Set Color

// Set light color to blue
u_color = shader_get_uniform(shd_light, "u_light_color");
r = 0.7
g = 0.1
b = 1.0

// Set light color to blue
u_color2 = shader_get_uniform(shd_light2, "u_light_color");
r2 = 0.5
g2 = 0.8
b2 = 0.3

dir = [1, 0];
angle = 30
//------------------------
surf_shadow_mask = -1;

