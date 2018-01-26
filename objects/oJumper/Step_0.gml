/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event





event_inherited();

if(grounded) {
	jumpTimer = 0;
	fallTimer = 0;
	if(jumpNext) 
	{
		grounded = false;
		state = JUMPING;
		ySpd = jump_heights[jumpTimer++];
		//if(sprintPressed && abs(xSpd) > 0)
		//{
			//jumpTimerMax = JUMP_TIMER_FAST;
		//} else
		//{
			jumpTimerMax = JUMP_TIMER_SLOW;
		//}
	}
} else {
	if(state == JUMPING)
	{
		if(jumpTimer >= jumpTimerMax)
		{
			jumpTimer = jumpTimerMax;
			ySpd = fall_values[fallTimer++];
			if(fallTimer >= FALL_TIMER_MAX)
			{
				fallTimer = FALL_TIMER_MAX - 1;
			}
		
		} else
		{
			ySpd = jump_heights[jumpTimer++];
		}
	} else
	{
		state = SKATE_FALLING;
	}
}