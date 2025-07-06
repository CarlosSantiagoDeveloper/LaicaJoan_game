// Create shadow casting setup
vertex_format_begin();
vertex_format_add_position();
vertex_format_add_color();
VertexFormat = vertex_format_end();

VBuffer = vertex_create_buffer();
surf = -1;

// Shader uniform (optional, for advanced step later)
LightPosRadius = shader_get_uniform(shader0, "u_fLightPositionRadius");

// Light settings
light_radius = 256; // Or whatever you need
tile_size = 64;
rad = 256; // Light radius