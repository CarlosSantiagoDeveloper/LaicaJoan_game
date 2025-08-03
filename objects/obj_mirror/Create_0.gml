
image_speed = 0
color = c_white
alpha = 0.5
yscale = 1;
xscale = -1;
offset = 0;
topSet = 0
botSet = 0
Haunt = "GROW"
depth = -y




if (!variable_global_exists("hauntable")) {
    global.hauntable = [];
}
array_push(global.hauntable, id);