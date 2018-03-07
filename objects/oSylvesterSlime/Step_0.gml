/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if(state == CHOMPING || state == SWALLOWING || state == EXPLODING) {
	SylvesterSlimeAI();
	SylvesterSlimeAnimation();
	return;
} else if(state == SYLVESTER_FLYING) {
	y += fly_values[flyTimer++];
	if(flyTimer >= flyValuesMax) {
		state = FALLING;
	}
	x += xDir * xSpd;
}
event_inherited();

