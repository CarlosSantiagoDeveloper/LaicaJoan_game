varying vec4 v_vColour;
varying vec2 v_vScreenPos;

uniform vec4 u_fLightPositionRadius;

void main() {
    vec2 vect = v_vScreenPos.xy - u_fLightPositionRadius.xy;
    float dist = length(vect);

    if (dist < u_fLightPositionRadius.z) {
        float falloff = dist / u_fLightPositionRadius.z;
        gl_FragColor = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(0.0, 0.0, 0.0, 0.7), falloff);
    } else {
        gl_FragColor = vec4(0.0, 0.0, 0.0, 0.7);
    }
}