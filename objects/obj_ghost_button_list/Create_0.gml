
var num = 7

for(var i =0;i<num;i++){
	if(i <num/2){
	var button = instance_create_layer(x-450+(150*i),y-250-50*i,"ButtonGhost",obj_button_ghost_pick)	
	button.image_index = i
	button.depth = -100000
	} else{
	var button = instance_create_layer(x-450+150*i,y-550+(50*i),"ButtonGhost",obj_button_ghost_pick)
	button.image_index = i
	button.depth = -100000
	}
}