//Construct the vertex buffer with every wall
//Instead of using the four edges as the walls, we use the diagonals instead (Optimization)
vertex_begin(vb,vf);
var _vb = vb;
with(obj_wall){
    
	Quad(_vb,x+sprite_width,y+sprite_height,x,y); //Negative Slope Diagonal Wall
	Quad(_vb,x,y+sprite_height,x+sprite_width,y); //Positive Slope Diagonal Wall
 
}
vertex_end(vb);