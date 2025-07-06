attribute vec2 in_Position;
attribute vec4 in_Colour;

varying vec4 v_vColour;
varying vec2 v_vTexcoord;
varying vec2 v_vScreenPos;

void main() {
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 0.0, 1.0);
    v_vColour = in_Colour;
    v_vTexcoord = vec2(0.0); // Not used
    v_vScreenPos = in_Position;
}