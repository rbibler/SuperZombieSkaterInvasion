/// Checks to see if player should teleport somewhere
/// @arg select_pressed
/// @arg select_pressed_last

var select_pressed = argument0;

if(state == SKATE_TELEPORTING) {
	if( abs(targetY - y) < 10 && abs(targetX - x) < 10) {
		state = SKATE_IDLE;
		xSpd = 0;
		ySpd = 0;
		xFraction = 0;
		yFraction = 0;
		with(instance_find(oTeleporterBall, 0)) {
			instance_destroy();
		}
	}
}


if(select_pressed) {
	var teleporter = instance_find(oTeleporterBall, 0);
	if(teleporter != noone) {
		targetX = teleporter.x;
		targetY = teleporter.y;
		var xDiff = abs(targetX - x);
		var yDiff = abs(targetY - y);
		if(yDiff > xDiff) {
			teleportSpeedY = teleportSpeedMax;
			teleportSpeedX = teleportSpeedMax * (xDiff / yDiff);
		} else {
			teleportSpeedX = teleportSpeedMax;
			teleportSpeedY = teleportSpeedMax * (yDiff / xDiff);
		}
		state = SKATE_TELEPORTING;
		with(teleporter) {
			stopped = true;
			xSpd = 0;
			ySpd = 0;
			xFraction = 0;
			yFraction = 0;
		}
	}
}