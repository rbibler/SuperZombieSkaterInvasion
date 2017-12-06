/// @description Insert description here
// You can write your code in this editor

var left = keyboard_check(vk_left);
var right = keyboard_check(vk_right);
var xDir = right - left;
var jumpPressed = keyboard_check(vk_space);
var jumpReleased = keyboard_check_released(vk_space);
var sprintPressed = keyboard_check(vk_shift);
var xMax = normalXMax;
if(sprintPressed) 
{
	xMax = sprintXMax;
}

grounded = InFloor(tilemap,x,bbox_bottom+1) >= 0;



if(jumpReleased) 
{
	if(ySpd < 0)
	{
		ySpd = 0;
	}
	jumpKeyDown = 0;
}

if(grounded && !jumpKeyDown && jumpPressed) {
	grounded = false;
	ySpd = -18;
	jumpKeyDown = 1;
}



ySpd += (yMax - ySpd) * yAccel;
xSpd += ((xMax * xDir) - xSpd) * xAccel;

xSpd += x_fraction;
ySpd += y_fraction;

x_fraction = xSpd - (floor(abs(xSpd)) * sign(xSpd));
xSpd -= x_fraction;
y_fraction = ySpd - (floor(abs(ySpd)) * sign(ySpd));
ySpd -= y_fraction;




// Check Horizontal Collisions
var colEdge = xSpd >= 0 ? bbox_right : bbox_left;
var tileIndexTop = tilemap_get_at_pixel(tilemap, colEdge + xSpd, bbox_top);
var tileIndexBottom = tilemap_get_at_pixel(tilemap, colEdge + xSpd, bbox_bottom);

if (tilemap_get_at_pixel(tilemap,x,bbox_bottom) > 1)
{
	tileIndexBottom = 0;	// ignore bottom side if on a slope
}

if(tileIndexTop == 1 || tileIndexBottom == 1)
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

x += xSpd;

// Check vertical collisions
if (tilemap_get_at_pixel(tilemap,x,bbox_bottom+ySpd) <= 1)
	{
	colEdge = ySpd >= 0 ? bbox_bottom : bbox_top;
	var tileIndexRight = tilemap_get_at_pixel(tilemap, bbox_right, colEdge + ySpd);
	var tileIndexLeft = tilemap_get_at_pixel(tilemap, bbox_left, colEdge + ySpd);

	if(tileIndexRight == 1 || tileIndexLeft == 1)	
	{
		if(ySpd >= 0 ) 
		{
			y = y - (y % TILE_SIZE) + (TILE_SIZE - 1) - (bbox_bottom - y);
		} else 
		{
			y = y - (y % TILE_SIZE) - (bbox_top - y);
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

y += ySpd;

if (grounded)
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

if(y >= (room_height + sprite_height))
{
	game_restart();
}