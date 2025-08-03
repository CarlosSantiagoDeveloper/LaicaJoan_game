draw_self()
draw_text(x,y-50,climb)

var _max = max_stamina
var _stam = stamina

var _bar_width = 100
var _bar_height = 30
var _x = x;
var _y = y-40;

var _x2 = _x+_bar_width;
var _y2 = _y+_bar_height;

//draw_rectangle(_x,_y,_x2,_y2,1)
//draw_rectangle(_x,_y,_x+_bar_width*_stam/_max,_y2,0)

draw_text(x,y,global.ability1)
draw_text(x,y+20,global.ghost)
