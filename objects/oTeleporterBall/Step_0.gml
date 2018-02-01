/// @description Insert description here
// You can write your code in this editor



PlayerCheckGrounded();

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
	
	if(grounded) {
		stopped = true;
		xSpd = 0;
		ySpd = 0;
		xFraction = 0;
		yFraction = 0;
	} else {
		xSpd += ((xMax * xDir) - xSpd) * xAccel;
	}
}

	
PlayerCheckHBGCol();
PlayerCheckVBGCol();
	
	
y += ySpd;
x += xSpd;

