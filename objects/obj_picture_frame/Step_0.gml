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
		visible = true;
		image_yscale = -1;
		imageSpeed = 0;
		imageSound = 0;
		image_blend = c_white
		image_xscale = 1;
		break;
	case "REVERSE":
		visible = true;
		imageSpeed = - 1;
		imageSound = 1
		image_blend = c_white
		image_xscale = -1;
		image_yscale = 1;
		break;
	case "SPEED":
		visible = true;
		imageSpeed = 1.2;
		imageSound = 1.2
		image_blend = c_white
		image_xscale = 1;
		image_yscale = 1;
		break;
	case "GROW":
		visible = true;
		imageSpeed = 1;
		imageSound = 0.6;
		image_blend = c_white
		image_xscale = 1.5
		image_yscale = 1.5
		break;
	case "COLOR": 
		visible = true;
		imageSpeed = 1;
		imageSound = 1;
		image_blend = c_blue
		image_xscale = 1
		image_yscale = 1
		break;
		
	case "APPEAR":
		visible = false;
		imageSpeed = -1; // dudoso
		imageSound = -1;
		image_blend = c_white
		image_xscale = 1;
		image_yscale = 1;
		break;
	
}	