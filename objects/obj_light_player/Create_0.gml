vertex_format_begin();
vertex_format_add_position();
vertex_format_add_color();
VertexFormat = vertex_format_end();

VBuffer = vertex_create_buffer();
surf = -1;

// Shader uniform
LightPosRadius = shader_get_uniform(shader0, "u_fLightPositionRadius");