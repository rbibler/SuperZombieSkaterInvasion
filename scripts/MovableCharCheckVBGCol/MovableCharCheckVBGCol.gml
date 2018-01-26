// Check vertical collisions
if (tilemap_get_at_pixel(tilemap,x,bbox_bottom+ySpd) <= 1)
	{
	colEdge = ySpd >= 0 ? bbox_bottom : bbox_top;
	var tileIndexRight = tilemap_get_at_pixel(tilemap, bbox_right, colEdge + ySpd);
	var tileIndexLeft = tilemap_get_at_pixel(tilemap, bbox_left, colEdge + ySpd);

	if(tileIndexRight == 1 || tileIndexLeft == 1)	
	{
		// Falling Down (good movie)
		if(ySpd >= 0) 
		{
			y = y - (y % TILE_SIZE) + (TILE_SIZE - 1) - (bbox_bottom - y);
		} else 
		{
			state = FALLING;
		}
		ySpd = 0;
	}
}

var floordist = InFloor(tilemap,x,bbox_bottom+ySpd);
if (floordist >= 0)
{
	y += ySpd;
	y -= (floordist + 1);
	ySpd = 0;
	floordist = -1;
}

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
				ySpd = 0;
				state = FALLING;
			}
		}
	}
}

y += ySpd;

if (grounded && !onPlatform)
{
	y += abs(floordist) - 1;
	if((bbox_bottom mod TILE_SIZE) == TILE_SIZE - 1)
	{
		if (tilemap_get_at_pixel(tilemap,x,bbox_bottom + 1) > 1)
		{
			y += abs(InFloor(tilemap,x,bbox_bottom + 1)); 
		}
	}
}
		

if(onPlatform)
{
	x += platformObject.tileSpeedX;
	y += platformObject.tileSpeedY;
}