/// @description Insert description here
// You can write your code in this editor

x += tileSpeed;

if(x >= 600) {
	tileSpeed *= -1;
}
if(x <= 350) {
	tileSpeed *= -1;
}

tilemap_set_at_pixel(colTiles,1,x,y);
tilemap_set_at_pixel(imageTiles,5,x,y);
