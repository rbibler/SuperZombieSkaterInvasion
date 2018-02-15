script_execute(CheckVertImpulse);

if(state == JUMPING || state == FALLING) {
	if(shootNewPress) {
		state = SLAMMING;
		show_debug_message("Start Slam!");
	}
} else if(state == SLAMMING) {
	ySpd = 15;
	show_debug_message("SLAMMING!");
}