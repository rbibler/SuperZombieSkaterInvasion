if(xSpd >= 0) {
	x = x - (x % TILE_SIZE) + (TILE_SIZE - 1) - (bbox_right - x);
} else {
	x = x - (x % TILE_SIZE) - (bbox_left - x);
}
xSpd = 0;