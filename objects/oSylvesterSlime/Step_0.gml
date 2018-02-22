/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if(state == CHOMPING || state == SWALLOWING || state == EXPLODING) {
	SylvesterSlimeAI();
	SylvesterSlimeAnimation();
	return;
}
event_inherited();

