// Safely delete vertex buffer
if (global.VBuffer != -1) {
    vertex_delete_buffer(global.VBuffer);
    global.VBuffer = -1;
}

// Safely free light surface
if (surface_exists(global.surf_light)) {
    surface_free(global.surf_light);
    global.surf_light = -1;
}