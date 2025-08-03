switch (Haunt) {
	case "NEUTRAL":
		//visible = true;
		//imageSpeed = 1; // dudoso
		//image_blend = c_white
		//image_xscale = 1;
		//image_yscale = 1;
		//imageSound = 1
		break;
	case "FLIP": 

		image_yscale = -1;

		break;
	case "VANDALIZE":

		sprite_index =  spr_book_shelf_vandilize
		break;

	case "GROW":

		yoffset = -40
		image_xscale = 1.2
		image_yscale = 1.2
		break;
	case "SHRINK":

		yoffset = 135
		image_xscale = 0.5
		image_yscale = 0.5
		break;
	case "COLOR": 

		image_blend = c_aqua
		image_alpha = 0.5

		break;
		
	case "VANISH":

		sprite_index = spr_book_shelf_vanish
		break;
	
}	
