function scr_copies(_spr,_x,_y){
	
	for (var i =-1; i <= 1; i++) {
		for (var j =-1; j <= 1; j++) {
			var _x2 = _x+i*2732;
			var _y2 = _y+j*2304;
			draw_sprite(_spr, 0,_x2 , _y2);
		
		}
	}
}