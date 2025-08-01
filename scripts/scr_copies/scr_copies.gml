function scr_copies(_spr,_sub,_x,_y,_xscale,_yscale,_rot,_col,_alpha){
	
	for (var i =-1; i <= 1; i++) {
		for (var j =-1; j <= 1; j++) {
			var _x2 = _x+i*2732;
			var _y2 = _y+j*2304;
			
			draw_sprite_ext(_spr, _sub,_x2 , _y2,_xscale,_yscale,_rot,_col,_alpha)
		}
	}
}