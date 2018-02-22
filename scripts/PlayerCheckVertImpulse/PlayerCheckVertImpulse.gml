script_execute(CheckVertImpulse);

if(state == JUMPING || state == FALLING) {
	if(shootNewPress) {
		state = SLAMMING;
	}
} else if(state == SLAMMING) {
	ySpd = 15;
}