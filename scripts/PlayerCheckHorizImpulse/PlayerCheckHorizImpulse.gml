/// Checks to see if player should be moving horizontally
/// @arg xMax
/// @arg xDir

var xMax = argument0;
var xDir = argument1;



xSpd += ((xMax * xDir) - xSpd) * xAccel;
if(state == CLIMBING)
{
	xSpd = 0;
} else if(state == SKATE_TELEPORTING) {
	xSpd = sign(targetX - x) * teleportSpeed;
	if(abs(targetX - x) <= 10 && abs(targetY - y) <= 10) {
		state = SKATE_IDLE;
	}
}