/// @param vb, x1, y1, x2, y2, lx, ly
function ProjectShadow(_vb,_Ax,_Ay,_Bx,_By,_Lx,_Ly){
    var SHADOW_LENGTH = 20000;

    var Adx = _Ax - _Lx;
    var Ady = _Ay - _Ly;
    var lenA = SHADOW_LENGTH / point_distance(_Ax, _Ay, _Lx, _Ly);
    var Ax_far = _Ax + Adx * lenA;
    var Ay_far = _Ay + Ady * lenA;

    var Bdx = _Bx - _Lx;
    var Bdy = _By - _Ly;
    var lenB = SHADOW_LENGTH / point_distance(_Bx, _By, _Lx, _Ly);
    var Bx_far = _Bx + Bdx * lenB;
    var By_far = _By + Bdy * lenB;

    // Triangle 1
    vertex_position(_vb, _Ax, _Ay);
    vertex_color(_vb, c_black, 1); // dark near edge

    vertex_position(_vb, _Bx, _By);
    vertex_color(_vb, c_black, 1);

    vertex_position(_vb, Ax_far, Ay_far);
    vertex_color(_vb, c_black, 1); // fade out

    // Triangle 2
    vertex_position(_vb, _Bx, _By);
    vertex_color(_vb, c_black, 1);

    vertex_position(_vb, Ax_far, Ay_far);
    vertex_color(_vb, c_black, 1);

    vertex_position(_vb, Bx_far, By_far);
    vertex_color(_vb, c_black, 1);
}

function SignTest(_x1,_y1,_x2,_y2,_lx,_ly){
	
	/// @param x1, y1, x2, y2, lx, ly
return ((_x2 - _x1) * (_ly - _y1) - (_y2 - _y1) * (_lx - _x1));

}