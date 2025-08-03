function scr_nightmare_transition(argument0){
	/// scr_nightmare_transition(room_target)
	var target_room = argument0;

	// Create a dark flash effect
	var transition = layer_create(999, "Transition");
	var obj = instance_create_layer(0, 0, "Transition", obj_nightmare_fade);
	obj.target_room = target_room;
}