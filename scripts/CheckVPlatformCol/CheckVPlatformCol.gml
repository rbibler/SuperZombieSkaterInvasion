onPlatform = false;
// Check vertical collision with Platform
var yOffset = ySpd;
if(ySpd == 0)
{
	yOffset = 2;
}

for(i = 0; i < instance_number(oPlatform); i++)
{
	platform = instance_find(oPlatform, i);
	if(place_meeting(x + xSpd, y + yOffset, platform))
	{
		if(ySpd >= 0)
		{
			if(y + yOffset >= platform.bbox_top && y + yOffset <= platform.bbox_bottom && bbox_top + yOffset <= platform.bbox_top)
			{
				y = platform.bbox_top - 1;
				ySpd = 0;
				onPlatform = true;
				state = IDLE;
				platformObject = platform;
			}
		} else {
			if(bbox_top + yOffset <= platform.bbox_bottom && bbox_top + yOffset >= platform.bbox_top && y + yOffset >= platform.bbox_bottom) 
			{
				//y = oPlatform.bbox_bottom + 1 + (bbox_top - y);
				ySpd = 0;
				state = FALLING;
				jumpTimer = jumpTimerMax;
				
			}
		}
	}
}