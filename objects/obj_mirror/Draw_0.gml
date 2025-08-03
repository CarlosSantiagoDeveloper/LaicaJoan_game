scr_copies(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)


// Draw the mirrored player vertically (like a reflection on the ground)

var dist = x-obj_player.x
if(obj_player.image_xscale>0){
	
		draw_sprite_part_ext(
		    sprite,     // sprite
		    obj_player.image_index,      // frame
			dist,//left,
			0,//top,
			sprite_width-25-widthSet,//width,
			sprite_height-topSet,//height,
		    x+115*(xscale)+xSet,                // x position
		    y-320-offset-botSet ,   // reflected position (offset = distance to mirror line)
		    -obj_player.image_xscale*xscale,               // x scale (normal)
		    obj_player.image_yscale*yscale,              // y scale (flipped)
		    color,          // color
		    alpha               // alpha (lower for reflection)
		);

} else{
		
		draw_sprite_part_ext(
		    sprite,     // sprite
		    obj_player.image_index,      // frame
			dist,//left,
			0,//top,
			sprite_width-25-widthSet,//width,
			sprite_height-topSet,//height,
		    x+115*(xscale)+xSet,                // x position
		    y-320-offset-botSet ,   // reflected position (offset = distance to mirror line)
		    obj_player.image_xscale*xscale,               // x scale (normal)
		    obj_player.image_yscale*yscale,              // y scale (flipped)
		    color,          // color
		    alpha               // alpha (lower for reflection)
		);
	
	
}