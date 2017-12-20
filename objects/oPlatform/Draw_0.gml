/// @description Insert description here
// You can write your code in this editor
image_xscale = width;
image_yscale = height;
for(var i = 0; i < width; i++)
{
	draw_tile(imageTiles, 5, 0, x + (i * TILE_SIZE), y);
}
//draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, c_aqua);
