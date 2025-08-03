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

		sprite_index = spr_pictures_1
		break;

	case "GROW":


		image_xscale = 1.7
		image_yscale = 1.7
		break;
	case "SHRINK":


		image_xscale = 0.6
		image_yscale = 0.6
		break;
	case "COLOR": 

		image_blend = c_aqua
		image_alpha = 0.15

		break;
		
	case "VANISH":

		sprite_index = spr_pictures_vandilize_1
		break;
	
}	
