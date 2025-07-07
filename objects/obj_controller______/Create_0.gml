// Create darkness surface once
global.surf_light = -1;
if (!surface_exists(global.surf_light)) {
    global.surf_light = surface_create(room_width, room_height);
}

// Set up vertex format
var fmt = vertex_format_begin();
vertex_format_add_position();
vertex_format_add_color();
global.VF_Shadow = vertex_format_end();
global.VBuffer = vertex_create_buffer();