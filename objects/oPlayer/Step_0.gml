/// @description Insert description here
// You can write your code in this editor


event_inherited();

if(y >= (room_height + sprite_height))
{
	game_restart();
}

if(state == RECOVERING) {
	recoveryTimer--;
	if(recoveryTimer == 0) {
		state = IDLE;
	}
}