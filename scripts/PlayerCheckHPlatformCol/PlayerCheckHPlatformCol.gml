var platform;
var i;
var xOffset = xSpd;
var platformHalfWidth = 0;
for(i = 0; i < instance_number(oPlatform); i++) 
{

	platform = instance_find(oPlatform, i);
	// Check horizontal collision with Platform
	platformHalfWidth = (platform.bbox_right - platform.bbox_left) / 2;
	if(place_meeting(x + xOffset, y + ySpd, platform))
	{
		// if player is stationary or moving right and platform is moving left
		if(x <= platform.x + platformHalfWidth) 
		{
			if(bbox_right + xOffset >= platform.bbox_left && bbox_right + xOffset <= platform.bbox_right
				&& bbox_left + xOffset < platform.bbox_left)
			{
				x = platform.bbox_left - 1 - (bbox_right - x);
				xSpd = 0;
			}
		} else 
		{
			if(bbox_left + xOffset <= platform.bbox_right && bbox_left + xOffset >= platform.bbox_left
				&& bbox_right > platform.bbox_right)
			{
				if(ySpd >= 0)
				{			
					if(y + ySpd >= platform.bbox_bottom)
					{
						x = platform.bbox_right + 1 + (x - bbox_left);
						xSpd = 0;
					}
				} else {
					x = platform.bbox_right + 1 + (x - bbox_left);
					xSpd = 0;
				}
			}
		}
	}
}