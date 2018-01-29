/// @description Insert description here
// You can write your code in this editor
/*
var left = 0;
var right = 0;;
var xDir = right - left;
var jumpPressed = 0;
var jumpReleased = 0;
var sprintPressed = 0;
var shootPressed = 0;
var shootReleased = 0;
var xMax = normalXMax;
var curBoxHalfWidth = (bbox_right - bbox_left) / 2;

image_blend = -1;

if(sprintPressed) 
{
	xMax = sprintXMax;
}

fallTimerMax = FALL_TIMER_MAX;

grounded = (InFloor(tilemap,x,bbox_bottom+1) >= 0);

if(grounded || onPlatform) {
	fallTimer = 0;
} else {
	onPlatform = false;
	state = FALLING;
}

if(state == FALLING)
{
	ySpd = fall_values[fallTimer++];
	if(fallTimer >= FALL_TIMER_MAX)
	{
		fallTimer = FALL_TIMER_MAX - 1;
	}
}

xSpd += ((xMax * xDir) - xSpd) * xAccel;

xSpd += xFraction;
ySpd += yFraction;

xFraction = xSpd - (floor(abs(xSpd)) * sign(xSpd));
xSpd -= xFraction;
yFraction = ySpd - (floor(abs(ySpd)) * sign(ySpd));
ySpd -= yFraction;

var xSpdFinal = xSpd;


// Check Horizontal Collisions
var colEdge = xSpdFinal >= 0 ? bbox_right : bbox_left;
var tileIndexTop = tilemap_get_at_pixel(tilemap, colEdge + xSpdFinal, bbox_top);
var tileIndexBottom = tilemap_get_at_pixel(tilemap, colEdge + xSpdFinal, bbox_bottom);

if (tilemap_get_at_pixel(tilemap,x,bbox_bottom) > 1)
{
	tileIndexBottom = 0;	// ignore bottom side if on a slope
}

if(tileIndexTop == 1 || tileIndexBottom == 1)
{
	if(xSpdFinal >= 0) 
	{
		x = x - (x % TILE_SIZE) + (TILE_SIZE - 1) - (bbox_right - x);
	} else
	{
		x = x - (x % TILE_SIZE) - (bbox_left - x);
	}
	xSpdFinal = 0;
	xSpd = 0;
}


var platform;
var i;
var xOffset = xSpd;
var platformHalfWidth = 0;
for(i = 0; i < instance_number(oPlatform); i++) 
{

	platform = instance_find(oPlatform, i);
	// Check horizontal collision with Platform
	platformHalfWidth = (platform.bbox_right - platform.bbox_left) / 2;
	if(place_meeting(x + xOffset, y + ySpd, platform))
	{
		// if player is stationary or moving right and platform is moving left
		if(x <= platform.x + platformHalfWidth) 
		{
			if(bbox_right + xOffset >= platform.bbox_left && bbox_right + xOffset <= platform.bbox_right
				&& bbox_left + xOffset < platform.bbox_left)
			{
				x = platform.bbox_left - 1 - (bbox_right - x);	
				xSpd = 0;
				xSpdFinal = 0;
			}
		} else 
		{
			if(bbox_left + xOffset <= platform.bbox_right && bbox_left + xOffset >= platform.bbox_left
				&& bbox_right > platform.bbox_right)
			{
				if(ySpd >= 0)
				{			
					if(y + ySpd >= platform.bbox_bottom)
					{
						x = platform.bbox_right + 1 + (x - bbox_left);
						xSpd = 0;
						xSpdFinal = 0;
					}
				} else {
					x = platform.bbox_right + 1 + (x - bbox_left);
					xSpd = 0;
					xSpdFinal = 0;
				}
			}
		}
	}
}


x += xSpdFinal;

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


if(state != lastState)
{
	image_index = 0;
}
lastState = state;




// Image rotation based on direction
// Check direction
image_xscale = sign(xSpd);
if(image_xscale == 0) 
{
	image_xscale = lastDir;
}
lastDir = image_xscale;
*/


script_execute(CheckGroundScript, tilemap, x, bbox_bottom);
script_execute(HorizImpetusScript);
script_execute(VertImpetusScript);
script_execute(AddFractionScript);
script_execute(CheckHBGColScript);
script_execute(CheckHPlatformScript);
script_execute(FinalizeHPosScript);
script_execute(CheckVBGColScript);
script_execute(CheckVPlatformScript);
script_execute(FinalizeVPosScript);
//state = 3;





