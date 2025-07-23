shadow_surface = -1

// Setup shared vertex format (if not already done)
vertex_format_begin();
vertex_format_add_position();
vertex_format_add_color();
vf_shadow = vertex_format_end();

vb_shadow = vertex_create_buffer();

//light = instance_create_layer(x,y,"Darkness",obj_light_source)



