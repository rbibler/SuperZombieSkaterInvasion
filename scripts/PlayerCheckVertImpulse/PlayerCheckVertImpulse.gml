/// Checks to see if player is jumping or falling and adds to vert speed accoridngly
/// @arg jumpPressed
/// @arg sprintPressed


var jumpPressed = argument0;
var sprintPressed = argument1;

if(state == SKATE_TELEPORTING) {
	ySpd = sign(y - targetY) * teleportSpeed;
	if( abs(targetY - y) <= 10 && abs(targetX - x) <= 10) {
		state = SKATE_IDLE;
	}
} else {

	// Check for vertical impetus (i.e. jumping)
	if(grounded || onPlatform) {
		//show_debug_message("Grounded or on platform");
		// Not jumping or falling, so reset timers
		jumpTimer = 0;
		fallTimer = 0;
		if(PlayerCanJump(jumpPressed)) 
		{
			grounded = false;
			state = SKATE_JUMPING;
			ySpd = jump_heights[jumpTimer++];
			if(sprintPressed && abs(xSpd) > 0)
			{
				jumpTimerMax = JUMP_TIMER_FAST;
			} else
			{
				jumpTimerMax = JUMP_TIMER_SLOW;
			}
		}
	} else {
		//show_debug_message("not grounded and not on platform");
		onPlatform = false;
		if(state == SKATE_JUMPING)
		{
			if(jumpTimer >= jumpTimerMax || !jumpPressed)
			{
				state = SKATE_FALLING;
			} else
			{
				ySpd = jump_heights[jumpTimer++];
			}
		} else if(state != CLIMBING)
		{
			state = SKATE_FALLING;
		}
	}

	if(state == SKATE_FALLING)
	{
		ySpd = fall_values[fallTimer++];
		if(fallTimer >= FALL_TIMER_MAX)
		{
			fallTimer = FALL_TIMER_MAX - 1;
		}
	}
}