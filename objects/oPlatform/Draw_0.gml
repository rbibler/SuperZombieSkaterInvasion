/// @description Insert description here
// You can write your code in this editor

width = image_xscale;
height = image_yscale;
for(var i = 0; i < width; i++)
{
	for(var j = 0; j < height; j++)
	{
		draw_tile(imageTiles, 5, 0, x + (i * TILE_SIZE), y + (j * TILE_SIZE));
	}
}
