if(state == FALLING)
{
	ySpd = fall_values[fallTimer++];
	if(fallTimer >= FALL_TIMER_MAX)
	{
		fallTimer = FALL_TIMER_MAX - 1;
	}
}