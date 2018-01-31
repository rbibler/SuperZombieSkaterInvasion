/// @description Insert description here
// You can write your code in this editor





if(!stopped)
{
	if(jumpTimer >= jumpTimerMax)
	{
		state = FALLING;
	} else
	{
		ySpd = jump_heights[jumpTimer++];
	}
	if(state == FALLING)
	{
		ySpd = fall_values[fallTimer++];
		if(fallTimer >= FALL_TIMER_MAX)
		{
			fallTimer = FALL_TIMER_MAX - 1;
		}
	}
	
	xSpd += ((xMax * 1) - xSpd) * xAccel;
	y += ySpd;
	x += xSpd;
}


