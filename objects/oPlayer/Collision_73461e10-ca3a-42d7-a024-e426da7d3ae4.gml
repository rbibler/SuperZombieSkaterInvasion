/// @description Insert description here
// You can write your code in this editor

if(!immune && state != FROZEN) {
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
		xDir = 0;
		state = CHOMPING;
		eventTimer = chompFrames;
		x = other.x;
		y = other.y;
	}
}
