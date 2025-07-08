if (!surface_exists(global.surf_darkness)) exit;

var lx = x;
var ly = y;
var rad = 256; // Light radius
var tile_size = 64;
var tilemap = layer_tilemap_get_id("walls");

// === Subtract circular light ===
surface_set_target(global.surf_darkness);

gpu_set_blendmode(bm_subtract);
draw_set_color(c_white);
draw_set_alpha(1);
draw_circle(lx, ly, rad, false); // Light circle

gpu_set_blendmode(bm_normal);

// === Begin drawing shadows inside light radius ===
vertex_begin(VBuffer, VertexFormat);

var startx = max(0, floor((lx - rad) / tile_size));
var endx   = min(floor((lx + rad) / tile_size), tilemap_get_width(tilemap) - 1);
var starty = max(0, floor((ly - rad) / tile_size));
var endy   = min(floor((ly + rad) / tile_size), tilemap_get_height(tilemap) - 1);

for (var yy = starty; yy <= endy; yy++) {
    for (var xx = startx; xx <= endx; xx++) {
        var tile = tilemap_get(tilemap, xx, yy);
        if (tile != 0) {
            var px1 = xx * tile_size;
            var py1 = yy * tile_size;
            var px2 = px1 + tile_size;
            var py2 = py1 + tile_size;

            if (!SignTest(px1, py1, px2, py1, lx, ly)) ProjectShadow(VBuffer, px1, py1, px2, py1, lx, ly);
            if (!SignTest(px2, py1, px2, py2, lx, ly)) ProjectShadow(VBuffer, px2, py1, px2, py2, lx, ly);
            if (!SignTest(px2, py2, px1, py2, lx, ly)) ProjectShadow(VBuffer, px2, py2, px1, py2, lx, ly);
            if (!SignTest(px1, py2, px1, py1, lx, ly)) ProjectShadow(VBuffer, px1, py2, px1, py1, lx, ly);
        }
    }
}

vertex_end(VBuffer);

// Draw shadows
draw_set_color(c_black);
draw_set_alpha(1);
vertex_submit(VBuffer, pr_trianglelist, -1);

surface_reset_target();