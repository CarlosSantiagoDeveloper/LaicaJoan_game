global.shadow_surface = -1

// Setup shared vertex format (if not already done)
vertex_format_begin();
vertex_format_add_position();
vertex_format_add_color();
global.vf_shadow = vertex_format_end();

global.vb_shadow = vertex_create_buffer();



