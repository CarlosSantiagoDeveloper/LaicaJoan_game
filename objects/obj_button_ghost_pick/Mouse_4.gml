if(myGhost==global.ghost){
	start_transition(function() {
	
    room_goto_next();
	
});
} else{
	start_transition(function() {
	
    room_goto(Room_Nightmare_1);
	
});
}