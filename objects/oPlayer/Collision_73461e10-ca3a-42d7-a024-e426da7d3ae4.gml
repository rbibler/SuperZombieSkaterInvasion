/// @description Insert description here
// You can write your code in this editor
if(state == SLAMMING) {
	with(other) {
		xDir = sign(x - other.x);
		if(xDir == 0) {
			xDir = 1;
		}
		xSpd = 15 * xDir;
	}
	return;
}


if(!immune && state != FROZEN && state != BOUNCING) {
	state = FROZEN;
	health -= other.hitPower;
	show_debug_message("Hit! Health: " + string(health));
	if(other.isInfector) {
		infected = true;
		infectionTime = other.infectionTime;
		infectionVirulence = other.virulence;
	}
	//x -= 5;
	//y -= 5;
	image_speed = 0;
	with(other) {
		image_xscale = sign(x - other.x);
		xDir = 0;
		xSpd = 0;
		ySpd = 0;
		xFraction = 0;
		yFraction = 0;
		state = CHOMPING;
		eventTimer = chompFrames;
	}
}
