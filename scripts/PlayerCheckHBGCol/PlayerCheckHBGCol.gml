// Check Horizontal Collisions
var colEdge = xSpd >= 0 ? bbox_right : bbox_left;
var tileIndexTop = tilemap_get_at_pixel(tilemap, colEdge + xSpd, bbox_top);
var tileIndexBottom = tilemap_get_at_pixel(tilemap, colEdge + xSpd, bbox_bottom);

if (tilemap_get_at_pixel(tilemap,x,bbox_bottom) > 1)
{
	tileIndexBottom = 0;	// ignore bottom side if on a slope
}

if((tileIndexTop == 1 || tileIndexBottom == 1) && state != CLIMBING)
{
	if(xSpd >= 0) 
	{
		x = x - (x % TILE_SIZE) + (TILE_SIZE - 1) - (bbox_right - x);
	} else
	{
		x = x - (x % TILE_SIZE) - (bbox_left - x);
	}
	xSpd = 0;
}
