scr_copies(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
if(alarm[0]>-1) {

	var _max = refreshingStam
	var _stam = alarm[0]

	var _bar_width = 100
	var _bar_height = 30
	var _x = x-_bar_width/2;
	var _y = y-sprite_height;

	var _x2 = _x+_bar_width;
	var _y2 = _y+_bar_height;
	draw_set_color(c_ltgrey)
	
	draw_rectangle(_x,_y,_x2,_y2,1)
	draw_rectangle(_x,_y,_x+_bar_width*_stam/_max,_y2,0)
	draw_sprite(spr_frame,0,_x2-50,_y2-12)
	draw_set_color(c_white)
}