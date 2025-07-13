LightPosRadius = shader_get_uniform(shader0,"u_fLightPositionRadius");
my_light = {
    x: x,
    y: y,
    r: 256
};
if (!variable_global_exists("lights")) global.lights = [];
array_push(global.lights, my_light);
global.light_count = array_length(global.lights);

