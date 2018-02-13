/// Check for ladder collisions
/// @arg upPressed
/// @arg downPressed

var upPressed = argument0;
var downPressed = argument1;

if(upPressed)
{
	var ladderTileTopLeft = tilemap_get_at_pixel(ladderTiles,bbox_left,bbox_top);
	var ladderTileTopRight = tilemap_get_at_pixel(ladderTiles,bbox_right,bbox_top);
	var ladderTileBottomRight = tilemap_get_at_pixel(ladderTiles,bbox_right,bbox_bottom);
	var ladderTileBottomLeft = tilemap_get_at_pixel(ladderTiles,bbox_left,bbox_bottom);
	var ladderTileCenter = tilemap_get_at_pixel(ladderTiles,x,y);
	if(state == CLIMBING)
	{
		y -= ladderClimbSpeed;
		if(ladderTileTopLeft == 2 || ladderTileTopRight == 2)
		{
			state = IDLE;
			y = (floor(y / TILE_SIZE) * TILE_SIZE) - 1;
		}
	} else {
		
		// Check to see if we're intersecting a ladder tile
		if(ladderTileTopLeft + ladderTileTopRight != 0)
		{
			// Free-floating ladder
			if(ladderTileTopLeft == 1 || ladderTileTopRight == 1)
			{
				if(ladderTileTopLeft == 1) {
					x = (floor(bbox_left / TILE_SIZE) * TILE_SIZE) + 8;
				} else {
					x = (floor(bbox_right / TILE_SIZE) * TILE_SIZE) + 8;
				}
				xSpd = 0;
				ySpd = 0;
				y -= ladderClimbSpeed;
				state = CLIMBING;
			}
		} 
	}
}


// Check for ladder collisions
if(downPressed)
{
	var ladderTileTopLeft = tilemap_get_at_pixel(ladderTiles,bbox_left,bbox_top);
	var ladderTileTopRight = tilemap_get_at_pixel(ladderTiles,bbox_right,bbox_top);
	var ladderTileBottomRight = tilemap_get_at_pixel(ladderTiles,bbox_right,bbox_bottom + ladderClimbSpeed);
	var ladderTileBottomLeft = tilemap_get_at_pixel(ladderTiles,bbox_left,bbox_bottom + ladderClimbSpeed);
	var ladderTileCenter = tilemap_get_at_pixel(ladderTiles,x,y + 1);
	if(state == CLIMBING)
	{
		if(ladderTileBottomLeft == 2 || ladderTileCenter == 2 || ladderTileBottomRight == 2)
		{
			state = IDLE;
			y = (floor((bbox_bottom + ladderClimbSpeed) / TILE_SIZE) * TILE_SIZE) + (TILE_SIZE - 1);
		} else {
			y += ladderClimbSpeed;
		}
	} else {
		
		// Check to see if we're intersecting a ladder tile
		if(ladderTileCenter + ladderTileBottomLeft + ladderTileBottomRight != 0)
		{
			// Free-floating ladder
			if(ladderTileBottomRight == 1 || ladderTileBottomLeft == 1 || ladderTileCenter == 1)
			{
				if(ladderTileBottomLeft == 1) {
					x = (floor(bbox_left / TILE_SIZE) * TILE_SIZE) + (curBoxHalfWidth);
				} else if(ladderTileBottomRight == 1) {
					x = (floor(bbox_right / TILE_SIZE) * TILE_SIZE) + (curBoxHalfWidth);
				} else {
					x = (floor(x / TILE_SIZE) * TILE_SIZE) + (curBoxHalfWidth);
				}
				xSpd = 0;
				ySpd = 0;
				y += ladderClimbSpeed;
				state = CLIMBING;
			}
		} 
	}
}