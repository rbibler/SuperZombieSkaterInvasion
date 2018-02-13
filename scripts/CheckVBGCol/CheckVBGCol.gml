// Check vertical collisions
if (tilemap_get_at_pixel(tilemap,x,bbox_bottom+ySpd) <= 1)
	{
	colEdge = ySpd >= 0 ? bbox_bottom : bbox_top;
	var tileIndexRight = tilemap_get_at_pixel(tilemap, bbox_right, colEdge + ySpd);
	var tileIndexLeft = tilemap_get_at_pixel(tilemap, bbox_left, colEdge + ySpd);

	if(tileIndexRight == 1 || tileIndexLeft == 1)	
	{
		// Falling Down (good movie)
		if(ySpd >= 0 && state != CLIMBING) 
		{
			y = y - (y % TILE_SIZE) + (TILE_SIZE - 1) - (bbox_bottom - y);
		} else 
		{
			if(state != CLIMBING) 
			{
				state = FALLING;
				jumpTimer = jumpTimerMax;
			}
		}
		ySpd = 0;
	}
}

var floordist = InFloor(tilemap,x,bbox_bottom+ySpd);
if (floordist >= 0 && state != CLIMBING)
{
	y += ySpd;
	y -= (floordist + 1);
	ySpd = 0;
	floordist = -1;
}

y += ySpd;


if (grounded && state != CLIMBING && !onPlatform)
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