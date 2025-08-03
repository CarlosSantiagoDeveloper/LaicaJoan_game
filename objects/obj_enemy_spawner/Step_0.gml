if(alarm[0]==0){
	 locationx =irandom_range(30,2200)
	 locationy = irandom_range(30,2200)
	var enemy = instance_create_layer(locationx,locationy,"Instances",obj_enemy)
	enemy.image_index=global.index_enemy 
	visible = false;
}

alpha = 1