if (!surface_exists(global.shadow_surface)) exit;

// Start drawing to shadow surface
surface_set_target(global.shadow_surface);
// Optionally clear alpha: draw_clear_alpha(c_black, 0);

vertex_begin(global.vb_shadow, global.vf_shadow);

// === Project all shadows from all obj_light instances ===
with (obj_light_source) {
    var lx = x;
    var ly = y;
    var rad = 256;
    var tile_size = 64;
    var tilemap = layer_tilemap_get_id("walls");

    var startx = max(0, floor((lx - rad) / tile_size));
    var endx   = min(tilemap_get_width(tilemap) - 1, floor((lx + rad) / tile_size));
    var starty = max(0, floor((ly - rad) / tile_size));
    var endy   = min(tilemap_get_height(tilemap) - 1, floor((ly + rad) / tile_size));

    for (var yy = starty; yy <= endy; yy++) {
        for (var xx = startx; xx <= endx; xx++) {
            var tile = tilemap_get(tilemap, xx, yy);
            if (tile != 0) {
                var px1 = xx * tile_size;
                var py1 = yy * tile_size;
                var px2 = px1 + tile_size;
                var py2 = py1 + tile_size;

                // Top edge
                if (yy > 0 && tilemap_get(tilemap, xx, yy - 1) == 0) {
                    ProjectShadow(global.vb_shadow, px1, py1, px2, py1, lx, ly);
                }
                // Right edge
                if (xx < tilemap_get_width(tilemap) - 1 && tilemap_get(tilemap, xx + 1, yy) == 0) {
                    ProjectShadow(global.vb_shadow, px2, py1, px2, py2, lx, ly);
                }
                // Bottom edge
                if (yy < tilemap_get_height(tilemap) - 1 && tilemap_get(tilemap, xx, yy + 1) == 0) {
                    ProjectShadow(global.vb_shadow, px2, py2, px1, py2, lx, ly);
                }
                // Left edge
                if (xx > 0 && tilemap_get(tilemap, xx - 1, yy) == 0) {
                    ProjectShadow(global.vb_shadow, px1, py2, px1, py1, lx, ly);
                }
            }
        }
    }
}

vertex_end(global.vb_shadow);
surface_reset_target();

// === Draw the shadow mask using a shader ===
//shader_set(shader0);
//shader_set_uniform_f(LightPosRadius, obj_light_source.x, obj_light_source.y, 256, 0.0); // Or reuse obj_light.x/y here if needed
//draw_surface(global.shadow_surface, 0, 0);
//shader_reset();