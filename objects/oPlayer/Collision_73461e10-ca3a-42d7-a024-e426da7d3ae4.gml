/// @description Insert description here
// You can write your code in this editor

if(!immune) {
	state = IDLE;
	health -= other.hitPower;
	show_debug_message("Hit! Health: " + string(health));
	if(other.isInfector) {
		infected = true;
		infectionTime = other.infectionTime;
		infectionVirulence = other.virulence;
	}
	x -= 5;
	y -= 5;
	immune = true;
	immunityTimer = 2 * FRAMES_PER_SECOND;
}
