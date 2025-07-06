shader_set(shader0);
shader_set_uniform_f(LightPosRadius, x, y, 256, 0);
draw_surface(surf, 0, 0);
shader_reset();