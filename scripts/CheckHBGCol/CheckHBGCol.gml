// Check Horizontal Collisions
var bbox_middle = bbox_bottom - ((bbox_bottom - bbox_top) / 2);
var colEdge = xSpd >= 0 ? bbox_right : bbox_left;
var tileIndexTop = tilemap_get_at_pixel(tilemap, colEdge + xSpd, bbox_top);
var tileIndexBottom = tilemap_get_at_pixel(tilemap, colEdge + xSpd, bbox_bottom);
var tileIndexMiddle = tilemap_get_at_pixel(tilemap, colEdge + xSpd, bbox_middle);

if (tilemap_get_at_pixel(tilemap,x,bbox_bottom) > 1)
{
	tileIndexBottom = 0;	// ignore bottom side if on a slope
}

if((tileIndexTop == 1 || tileIndexBottom == 1 || tileIndexMiddle == 1) && state != CLIMBING)
{
	script_execute(hbgColResponseScript);
}
