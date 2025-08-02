image_speed = 0
imageSpeed = 1;
imageSound = 1;
active = false
car_speed = -2;
snd = 0




Haunt = "NEUTRAL"

array = ["NEUTRAL","FLIP","REVERSE","SPEED","GROW","COLOR","APPEAR"]



if (!variable_global_exists("hauntable")) {
    global.hauntable = [];
}
array_push(global.hauntable, id);