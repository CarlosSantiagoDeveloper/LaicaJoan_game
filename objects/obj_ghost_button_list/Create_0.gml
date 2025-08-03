
var num = 7

for(var i =0;i<num;i++){
	if(i % 2 == 0){
	var button = instance_create_layer(x+98*i,y,"ButtonGhost",obj_button_ghost_pick)	
	button.image_index = i
	} else{
	var button = instance_create_layer(x+98*(i-1),y+100,"ButtonGhost",obj_button_ghost_pick)
	button.image_index = i
	}
}