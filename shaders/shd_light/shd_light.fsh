uniform vec2 u_pos;         // Light position
uniform vec2 u_dir;         // Light facing direction (normalized)
uniform vec3 u_light_color; // Light color
uniform float u_cone_angle; // Half angle in degrees

const float zz = 100.0;

void main() {
    vec2 pixel_pos = gl_FragCoord.xy;
    vec2 to_pixel = pixel_pos - u_pos;
    float dist = length(to_pixel);
    float intensity = 1.0 / (sqrt(dot(to_pixel, to_pixel) + zz * zz) - zz);

    vec2 dir_to_pixel = normalize(to_pixel);
    float cos_angle = dot(dir_to_pixel, normalize(u_dir));
    float cutoff = cos(radians(u_cone_angle));

    if (cos_angle >= cutoff) {
        gl_FragColor = vec4(u_light_color * intensity, 1.0);
    } else {
        gl_FragColor = vec4(0.0);
    }
}