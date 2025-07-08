if (global.vb_shadow!=-1) vertex_delete_buffer(global.vb_shadow);
if (global.vf_shadow!=-1) vertex_format_delete(global.vf_shadow);
if (surface_exists(global.shadow_surface)) surface_free(global.shadow_surface);