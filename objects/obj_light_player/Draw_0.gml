// Surface setup
if (!surface_exists(surf)) {
    surf = surface_create(room_width, room_height);
}

surface_set_target(surf);
draw_clear_alpha(c_black, 0);

// Vertex start
vertex_begin(VBuffer, VertexFormat);

var tilemap = layer_tilemap_get_id("walls");
var tile_size = 32;

var lx = x;
var ly = y;
var rad = 256;

var startx = floor((lx - rad) / tile_size);
var endx   = floor((lx + rad) / tile_size);
var starty = floor((ly - rad) / tile_size);
var endy   = floor((ly + rad) / tile_size);

for (var yy = starty; yy <= endy; yy++) {
    for (var xx = startx; xx <= endx; xx++) {
        var tile = tilemap_get(tilemap, xx, yy);
        if (tile != 0) {
            var px1 = xx * tile_size;
            var py1 = yy * tile_size;
            var px2 = px1 + tile_size;
            var py2 = py1 + tile_size;

            // Only cast shadows from edges facing the light
            if (!SignTest(px1, py1, px2, py1, lx, ly)) ProjectShadow(VBuffer, px1, py1, px2, py1, lx, ly);
            if (!SignTest(px2, py1, px2, py2, lx, ly)) ProjectShadow(VBuffer, px2, py1, px2, py2, lx, ly);
            if (!SignTest(px2, py2, px1, py2, lx, ly)) ProjectShadow(VBuffer, px2, py2, px1, py2, lx, ly);
            if (!SignTest(px1, py2, px1, py1, lx, ly)) ProjectShadow(VBuffer, px1, py2, px1, py1, lx, ly);
			
        }
    }
}

vertex_end(VBuffer);
vertex_submit(VBuffer, pr_trianglelist, -1);

surface_reset_target();