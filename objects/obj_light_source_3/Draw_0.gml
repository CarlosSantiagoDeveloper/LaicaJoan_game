if (!surface_exists(global.surf_light)) exit;

// Light properties
var lx = x;
var ly = y;
var rad = 256;
var rays = 128;
var tile_size = 64;
var tilemap = layer_tilemap_get_id("walls");

// === Set target surface and clear to darkness ===
surface_set_target(global.surf_light);
draw_clear_alpha(c_black, 1); // Start fully dark

// === Begin subtract mode ===
gpu_set_blendmode(bm_subtract);

// === Begin vertex shadow-cutting geometry ===
vertex_begin(global.VBuffer, global.VF_Shadow);

for (var i = 0; i < rays; i++) {
    var angle = i * (360 / rays);
    var dx = dcos(angle);
    var dy = dsin(angle);

    var max_len = rad;
    var step = 4;
    var hitx = lx, hity = ly;

    // Trace until wall or max distance
    for (var d = 0; d < max_len; d += step) {
        hitx = lx + dx * d;
        hity = ly + dy * d;

        if (tilemap_get_at_pixel(tilemap, hitx, hity) != 0) break;
    }

    // Next ray
    var next_angle = (i + 1) * (360 / rays);
    var ndx = dcos(next_angle);
    var ndy = dsin(next_angle);
    var nx = lx, ny = ly;

    for (var d = 0; d < max_len; d += step) {
        nx = lx + ndx * d;
        ny = ly + ndy * d;

        if (tilemap_get_at_pixel(tilemap, nx, ny) != 0) break;
    }

    // Triangle fan made of light-subtracting white triangles
     vertex_position(global.VBuffer, lx, ly);
    vertex_color(global.VBuffer, c_white, 1);
    vertex_position(global.VBuffer, hitx, hity);
    vertex_color(global.VBuffer, c_white,1);
    vertex_position(global.VBuffer, nx, ny);
    vertex_color(global.VBuffer, c_white, 1);
}

vertex_end(global.VBuffer);

// === Submit triangles in subtract mode ===
vertex_submit(global.VBuffer, pr_trianglelist, -1);

// === Restore default render state ===
gpu_set_blendmode(bm_normal);
surface_reset_target();