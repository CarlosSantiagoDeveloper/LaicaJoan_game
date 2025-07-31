// === Step 0: Rebuild the shadow geometry
var _vf = vf_shadow;
var _vb = vb_shadow;

vertex_begin(_vb, _vf);

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

                if (yy > 0 && tilemap_get(tilemap, xx, yy - 1) == 0)
                    ProjectShadow(_vb, px1, py1, px2, py1, lx, ly);
                if (xx < tilemap_get_width(tilemap) - 1 && tilemap_get(tilemap, xx + 1, yy) == 0)
                    ProjectShadow(_vb, px2, py1, px2, py2, lx, ly);
                if (yy < tilemap_get_height(tilemap) - 1 && tilemap_get(tilemap, xx, yy + 1) == 0)
                    ProjectShadow(_vb, px2, py2, px1, py2, lx, ly);
                if (xx > 0 && tilemap_get(tilemap, xx - 1, yy) == 0)
                    ProjectShadow(_vb, px1, py2, px1, py1, lx, ly);
            }
        }
    }
}

vertex_end(_vb);
draw_set_color(c_white)
draw_rectangle(0,0,room_width,room_height,false)

// === Step 2: Subtract everywhere EXCEPT the shadows
gpu_set_blendmode(bm_subtract);
vertex_submit(_vb, pr_trianglelist,-1); // restore shadows by subtracting subtract
gpu_set_blendmode(bm_normal);