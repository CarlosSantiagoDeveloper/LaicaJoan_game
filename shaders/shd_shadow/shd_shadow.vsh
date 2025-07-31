attribute vec3 in_Position; // (x, y, z)

uniform vec2 u_pos;         // Light position
uniform float u_z;          // Z-depth
uniform vec2 u_dir;         // Light facing direction (normalized)
uniform float u_angle;      // Cone half-angle (in degrees)

void main() {
    vec2 pos = in_Position.xy;

    if (in_Position.z > 0.0) { // This vertex gets extruded

        vec2 to_vertex = pos - u_pos;
        float dist = length(to_vertex);
        vec2 to_vertex_norm = to_vertex / dist;

        float cos_angle = dot(to_vertex_norm, normalize(u_dir));
        float cone_cutoff = cos(radians(u_angle));

        // Only extrude if within cone
        if (cos_angle >= cone_cutoff) {
            pos += to_vertex_norm * 100000.0;
        }
    }

    vec4 object_space_pos = vec4(pos.x, pos.y, u_z - 0.5, 1.0); // Shadow closer than light
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
}