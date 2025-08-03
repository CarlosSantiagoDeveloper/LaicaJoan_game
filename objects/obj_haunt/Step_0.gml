if(alarm[0]==0){
	haunt = irandom(9);	
}

if(alarm[0]<1){
	alarm[0] = room_speed/2 // Haunt Frenquency
}

if(haunt==8){
	repeat(50){
		var shuffle = array_shuffle(global.hauntable)
		var pull = shuffle[0];
		if(pull.Haunt=="NEUTRAL"){
			pull.Haunt = global.ability1;
			haunt = 0;
			show_debug_message("Done")
			break;
		
		}
		show_debug_message(pull.Haunt)
	}
}
if(haunt==9){
	repeat(50){
		var shuffle = array_shuffle(global.hauntable)
		var pull = shuffle[0];
		if(pull.Haunt=="NEUTRAL"){
			pull.Haunt = global.ability2;
			haunt = 0;
			show_debug_message("Done")
			break;
		
		}
		show_debug_message(pull.Haunt)
	}
}