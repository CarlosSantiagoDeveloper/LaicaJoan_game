varying vec2 pos; // current pixel position
uniform vec2 u_pos; // light source position
uniform vec3 u_light_color; // RGB color of the light

const float zz = 0.0000000001; // larger zz, larger light

void main() {
    vec2 dis = pos - u_pos;
    float str = 40.0 / (sqrt(dot(dis, dis) + zz * zz) - zz); // same as your distance calculation
    gl_FragColor = vec4(u_light_color * str, 1.0); // color * intensity
}