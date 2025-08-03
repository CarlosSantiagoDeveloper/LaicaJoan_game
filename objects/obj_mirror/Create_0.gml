
image_speed = 0
color = c_white
alpha = 0.5
yscale = 1;
xscale = -1;
offset = 0;
topSet = 0
botSet = 0
Haunt = "NEUTRAL"
depth = -y
sprite = obj_player.sprite_index




if (!variable_global_exists("hauntable")) {
    global.hauntable = [];
}
array_push(global.hauntable, id);