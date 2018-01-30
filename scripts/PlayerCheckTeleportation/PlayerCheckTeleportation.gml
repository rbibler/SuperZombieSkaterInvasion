/// Checks to see if player should teleport somewhere
/// @arg select_pressed
/// @arg select_pressed_last

var select_pressed = argument0;


if(select_pressed) {
	var teleporter = instance_find(oTeleporter, 0);
	x = teleporter.x;
	y = teleporter.y;
}