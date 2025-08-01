function scr_loop(_x,_y){
	
	if (_x < 2732) {
	    _x = 5464;
	} else if (_x > 5464) {
	    _x = 2732;
	}
	// Infinite Room logic for Y
	if (_y < 2304) {
	    _y = 4607;
	} else if (_y > 4608) {
	    _y = 2305;
	}
	return [_x,_y];
}
