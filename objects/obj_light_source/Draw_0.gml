if (!surface_exists(global.shadow_surface)) exit;

// Light settings
var lx = x;
var ly = y;
var rad = 256;
var tile_size = 64;
var tilemap = layer_tilemap_get_id("walls");


// === Draw the light hole (subtract from darkness) ===
surface_set_target(global.shadow_surface);
//draw_clear_alpha(0,0);  Maybe lo devuelvo
			

// === Shadow projection ===
vertex_begin(global.vb_shadow,global.vf_shadow);

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

            // Cast shadow if edge faces light
            // Top edge: only cast if tile above is empty
if (yy > 0 && tilemap_get(tilemap, xx, yy - 1) == 0) {
    ProjectShadow(global.vb_shadow, px1, py1, px2, py1, lx, ly);
}

// Right edge: only cast if tile to the right is empty
if (xx < tilemap_get_width(tilemap) - 1 && tilemap_get(tilemap, xx + 1, yy) == 0) {
    ProjectShadow(global.vb_shadow, px2, py1, px2, py2, lx, ly);
}

// Bottom edge: only cast if tile below is empty
if (yy < tilemap_get_height(tilemap) - 1 && tilemap_get(tilemap, xx, yy + 1) == 0) {
    ProjectShadow(global.vb_shadow, px2, py2, px1, py2, lx, ly);
}

// Left edge: only cast if tile to the left is empty
if (xx > 0 && tilemap_get(tilemap, xx - 1, yy) == 0) {
    ProjectShadow(global.vb_shadow, px1, py2, px1, py1, lx, ly);
}
        }
    }
}

vertex_end(global.vb_shadow);

//No vertex submit

surface_reset_target();

shader_set(shader0);
shader_set_uniform_f( LightPosRadius, x,y,rad,0.0 );

draw_surface(global.shadow_surface,0,0);
shader_reset();


