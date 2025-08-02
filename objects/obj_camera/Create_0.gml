visible = false
var cam = view_camera[0];
var cam_w = camera_get_view_width(cam);
var cam_h = camera_get_view_height(cam);

camera_set_view_pos(cam, obj_player.x - cam_w / 2, obj_player.y - cam_h / 2);