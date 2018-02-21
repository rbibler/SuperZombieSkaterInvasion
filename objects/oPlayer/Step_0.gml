/// @description Insert description here
// You can write your code in this editor


if(infected) {
	var framesSinceLastEpisode = frameCounter - lastEpisodeTime;
	if(framesSinceLastEpisode >= infectionTime) {
		health -= infectionVirulence;
		show_debug_message("Episode! Health: " + string(health));
		lastEpisodeTime = frameCounter;
	}
}

if(state == FROZEN) {
	return;
}
event_inherited();

if(y >= (room_height + sprite_height))
{
	game_restart();
}
if(health <= 0) {
	game_restart();
}

if(state == RECOVERING) {
	recoveryTimer--;
	if(recoveryTimer == 0) {
		state = IDLE;
	}
}
if(immune) {
	immunityTimer--;
	if(immunityTimer == 0) {
		immune = false;
	}
	var flashSwitch = frameCounter - lastImmunityFlashSwitch;
	if(flashSwitch >= immunityFlashSwitchTime) {
		immunityFlashToggle++;
		image_blend = immunityFlashValues[immunityFlashToggle % 4];
		lastImmunityFlashSwitch = frameCounter;
	}
}
frameCounter++;