/// @description Insert description here
// You can write your code in this editor

var left = keyboard_check(vk_left);
var right = keyboard_check(vk_right);
var downPressed = keyboard_check(vk_down);
var skateReleased = left && right == 0;
var xDir = right - left;
var jumpPressed = keyboard_check(vk_space);
var jumpReleased = keyboard_check_released(vk_space);
var sprintPressed = keyboard_check(vk_shift);
var shootPressed = keyboard_check(vk_control);
var shootReleased = keyboard_check_released(vk_control);
var upPressed = keyboard_check(vk_up);
var xMax = normalXMax;
var curBoxHalfWidth = (bbox_right - bbox_left) / 2;
image_blend = -1;
if(sprintPressed) 
{
	xMax = sprintXMax;
}

fallTimerMax = FALL_TIMER_MAX;

// check if on ground
grounded = (InFloor(tilemap,x,bbox_bottom+1) >= 0);

// Check for vertical impetus (i.e. jumping)
if(grounded || onPlatform) {
	jumpTimer = 0;
	fallTimer = 0;
	if(jumpPressed && jumpKeyDown == 0) 
	{
		grounded = false;
		jumpKeyDown = 1;
		state = SKATE_JUMPING;
		ySpd = jump_heights[jumpTimer++];
		if(sprintPressed && abs(xSpd) > 0)
		{
			jumpTimerMax = JUMP_TIMER_FAST;
		} else
		{
			jumpTimerMax = JUMP_TIMER_SLOW;
		}
	}
} else {
	onPlatform = false;
	if(state == SKATE_JUMPING)
	{
		if(jumpTimer >= jumpTimerMax || !jumpPressed)
		{
			jumpTimer = jumpTimerMax;
			ySpd = fall_values[fallTimer++];
			if(fallTimer >= FALL_TIMER_MAX)
			{
				fallTimer = FALL_TIMER_MAX - 1;
			}
		
		} else if(jumpPressed) 
		{
			ySpd = jump_heights[jumpTimer++];
		}
	} else if(state != CLIMBING)
	{
		state = SKATE_FALLING;
	}
}

if(state == SKATE_FALLING)
{
	ySpd = fall_values[fallTimer++];
	if(fallTimer >= FALL_TIMER_MAX)
	{
		fallTimer = FALL_TIMER_MAX - 1;
	}
}

if(jumpReleased)
{
	jumpKeyDown = 0;
}

// Check for horizontal impetus
xSpd += ((xMax * xDir) - xSpd) * xAccel;
if(state == CLIMBING)
{
	xSpd = 0;
}

// Update fractions from last step
xSpd += x_fraction;
ySpd += y_fraction;

x_fraction = xSpd - (floor(abs(xSpd)) * sign(xSpd));
xSpd -= x_fraction;
y_fraction = ySpd - (floor(abs(ySpd)) * sign(ySpd));
ySpd -= y_fraction;

var xSpdFinal = xSpd + xSpdFromFriends;
xSpdFromFriends = 0;


// Check Horizontal Collisions
var colEdge = xSpdFinal >= 0 ? bbox_right : bbox_left;
var tileIndexTop = tilemap_get_at_pixel(tilemap, colEdge + xSpdFinal, bbox_top);
var tileIndexBottom = tilemap_get_at_pixel(tilemap, colEdge + xSpdFinal, bbox_bottom);

if (tilemap_get_at_pixel(tilemap,x,bbox_bottom) > 1)
{
	tileIndexBottom = 0;	// ignore bottom side if on a slope
}

if((tileIndexTop == 1 || tileIndexBottom == 1) && state != CLIMBING)
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
				// Falling down
				//if(ySpd >= 0)
				//{			
					//if(y + ySpd >= platform.bbox_top)
					//{
						x = platform.bbox_left - 1 - (bbox_right - x);
						xSpd = 0;
						xSpdFinal = 0;
					//}
				//} else {
					// jumping up
					//if(y + ySpd <= platform.bbox_bottom)
					//{
						//x = platform.bbox_left - 1 - (bbox_right - x);
						//xSpd = 0;
						//xSpdFinal = 0;
					//}
				//}
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
		if(ySpd >= 0 && state != CLIMBING) 
		{
			y = y - (y % TILE_SIZE) + (TILE_SIZE - 1) - (bbox_bottom - y);
		} else 
		{
			if(state != CLIMBING) 
			{
				state = SKATE_FALLING;
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
				state = SKATE_IDLE;
				platformObject = platform;
			}
		} else {
			if(bbox_top + yOffset <= platform.bbox_bottom && bbox_top + yOffset >= platform.bbox_top && y + yOffset >= platform.bbox_bottom) 
			{
				//y = oPlatform.bbox_bottom + 1 + (bbox_top - y);
				ySpd = 0;
				state = SKATE_FALLING;
				jumpTimer = jumpTimerMax;
				
			}
		}
	}
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



// Check for ladder collisions
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
			state = SKATE_IDLE;
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
				xSpdFinal = 0;
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
			state = SKATE_IDLE;
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
				xSpdFinal = 0;
				ySpd = 0;
				y += ladderClimbSpeed;
				state = CLIMBING;
			}
		} 
	}
}

if(onPlatform)
{
	x += platformObject.tileSpeedX;
	y += platformObject.tileSpeedY;
}

if(y >= (room_height + sprite_height))
{
	game_restart();
}


/*
* Animation:
* States are:
* Idle
* Skating
* Jumping
* Falling
* Hit
*/

switch(state) 
{
	case SKATE_IDLE:
		if(left || right) 
		{
			state = SKATE_SKATING;
			sprite_index = sSkater;
		} else if(downPressed)
		{
			state = SKATE_CROUCH;
			sprite_index = sSkaterCrouch;
		} else if(shootPressed)
		{
			state = SKATE_IDLE_WEAPON_DRAWN;
			sprite_index = sSkaterSlingShotIdle;
			
		} else
		{
			sprite_index = sSkaterIdle;
		}
	break;
	case SKATE_SKATING:
		if(downPressed)
		{
			state = SKATE_CROUCH;
			sprite_index = sSkaterCrouch;
		} else if(shootPressed)
		{
			state = SKATE_SKATING_WEAPON_DRAWN;
			var imgIndex = image_index;
			sprite_index = sSkaterSlingShot;
			image_index = (imgIndex + 1) % 2;
		} else if(left + right == 0)
		{
			state = SKATE_IDLE;
			sprite_index = sSkaterIdle;
		}
	break;
	case SKATE_IDLE_WEAPON_DRAWN:
	case SKATE_SKATING_WEAPON_DRAWN:
	case SKATE_JUMPING_WEAPON_DRAWN:
	case SKATE_FALLING_WEAPON_DRAWN:
	case SKATE_CROUCH_WEAPON_DRAWN:
		if(shootReleased)
		{
			if(left + right == 0)
			{
				state = SKATE_IDLE;
				sprite_index = sSkaterIdle;
			} else 
			{
				state = SKATE_SKATING;
				sprite_index = sSkater;
			}
		} else if(left + right == 0)
		{
			state = SKATE_IDLE_WEAPON_DRAWN;
			sprite_index = sSkaterSlingShotIdle;
		} else {
			state = SKATE_SKATING_WEAPON_DRAWN;
			sprite_index = sSkaterSlingShot;
		}
	break;
	case SKATE_JUMPING:
		if(grounded)
		{
			
			if(left || right) {
				state = SKATE_SKATING;
				sprite_index = sSkater;
			} else {
				state = SKATE_IDLE;
				sprite_index = sSkaterIdle;
			}
		} else 
		{
			if(sprite_index != sSkaterJump)
			{
				sprite_index = sSkaterJump;
			}
		}
	break;
	case SKATE_CROUCH:
		if(!downPressed)
		{
			if(left || right) {
				state = SKATE_JUMPING;
				sprite_index = sSkater;
			} else {
				state = SKATE_IDLE;
				sprite_index = sSkaterIdle;
			}
		}
	break;
	case SKATE_FALLING:
		if(grounded)
		{
			if(left || right) {
				state = SKATE_SKATING;
				sprite_index = sSkater;
			} else {
				state = SKATE_IDLE;
				sprite_index = sSkaterIdle;
			}
		} else
		{
			if(sprite_index != sSkaterFall)
			{
				sprite_index = sSkaterFall;
			}
		}
	break;
	case CLIMBING:
		if(sprite_index != sSkaterClimb)
		{
			sprite_index = sSkaterClimb;
		}
		if(upPressed || downPressed)
		{
			image_speed = 1;
		} else {
			image_speed = 0;
		}
	break;
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


if(shootReleased && canShoot)
{
	with(instance_create_layer(x + 6, y - 25, "Collidable_Objects", oProjRock))
	{
		speed = 7 * other.lastDir;
		
	}
	canShoot = false;
}

if(shootPressed)
{
	canShoot = true;
}
