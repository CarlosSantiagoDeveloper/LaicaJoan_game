if (global.paused) exit;
if(!Haunting){
	if(instance_exists(obj_enemy_spawner)){
		instance_destroy(obj_enemy_spawner)
	}	
	if(instance_exists(obj_enemy)){
		instance_destroy(obj_enemy)
	}	
	if(alarm[0]==-1){
		alarm[0] = 	HuntTimer
	}
	if(alarm[0]==0){
		Haunting = true;	
	}
}else{
	if(alarm[1]==-1){
		alarm[1] = 	HauntingTimer
	}
	if(!instance_exists(obj_enemy_spawner)){
		instance_create_layer(x,y,"Instances",obj_enemy_spawner)
		
	}	
	if(alarm[1]==0){
	Haunting = false	
}

}
