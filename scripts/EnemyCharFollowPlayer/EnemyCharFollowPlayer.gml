/// Ai script to follow the player
/// @arg input
show_debug_message("Player x: " + string(oPlayer.x) + " this x: " + string(x));
if(oPlayer.x < x) {
	input[2] = true;
} else {
	input[3] = true;
}

if(oPlayer.y < y) {
	input[4] = true;
}

