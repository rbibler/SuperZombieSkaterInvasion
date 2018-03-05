script_execute(CheckVertImpulse);

if(state == JUMPING || state == FALLING) {
	if(downNewPress) {
		state = SLAMMING;
	}
} else if(state == SLAMMING) {
	ySpd = 15;
}