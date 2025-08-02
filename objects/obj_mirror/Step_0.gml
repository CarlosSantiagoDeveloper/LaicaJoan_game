

switch (Haunt) {
	case "NEUTRAL":

		break;
	case "FLIP": 
		alpha = 0.5;
		color = c_white
		yscale = -1;
		xscale = -1;
		break;
	case "REVERSE":
		alpha = 0.5;
		color = c_white
		xscale = 1;
		yscale = 1;
		break;
	case "SPEED":
		alpha = 0.5;
		color = c_white
		xscale = 1;
		yscale = 1;
		break;
	case "GROW":
		alpha = 0.5;
		color = c_white
		xscale = -1.2;
		yscale = 1.2;
		break;
	case "COLOR": 
		alpha = 0.5;
		color = c_blue
		xscale = -1;
		yscale = 1;
		break;
		
	case "APPEAR":
		alpha = 0;
		color = c_white
		xscale = -1;
		yscale = 1;
		break;
	
}	
if(Haunt=="FLIP"){
	offset = -360;	
} else{
	offset = 0;
}

if(Haunt=="GROW"){
	botSet = 115;
	widthSet = 40
	xSet = 25;
	
} else{
	botSet = 0;
	widthSet = 0
	xSet = 0;
	
}


var pos = scr_loop(x,y);
x = pos[0]
y = pos[1]

