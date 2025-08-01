randomize();
//global.hauntable = array_create(0);

global.flip = false;
global.reverse = false;
global.spd = false;
global.disappear = false;
global.color = false;
global.size = false;

global.ghost = choose("Llorona","Chupacabra","Diablo","Indio","Cuco","Gargola","Alien")
global.ability1 = "NEUTRAL"
global.ability2 = "NEUTRAL"
switch (global.ghost) {
	case "Llorona":
	global.spd = true;
	global.reverse = true;
	global.ability1 = "SPEED"
	global.ability2 = "REVERSE"
	break
	case "Chupacabra":
	global.color = true;
	global.size = true;
	global.ability1 = "COLOR"
	global.ability2 = "GROW"
	break
	case "Diablo":
	global.reverse = true;
	global.flip = true;
	global.ability1 = "FLIP"
	global.ability2 = "REVERSE"
	break
	case "Indio":
	global.disappear = true;
	global.flip = true;
	global.ability1 = "FLIP"
	global.ability2 = "APPEAR"
	break
	case "Cuco":
	global.disappear = true;
	global.size = true;
	global.ability2 = "APPEAR"
	global.ability1 = "GROW"
	break
	case "Gargola":
	global.size = true;
	global.reverse = true;
	global.ability1 = "GROW"
	global.ability2 = "REVERSE"
	break
	case "Alien":
	global.spd = true;
	global.color = true;
	global.ability1 = "SPEED"
	global.ability2 = "COLOR"
	break
	
}
