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
if(sprintPressed) 
{
	xMax = sprintXMax;
}

fallTimerMax = FALL_TIMER_MAX;

grounded = InFloor(tilemap,x,bbox_bottom+1) >= 0;

if(grounded) {
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

xSpd += ((xMax * xDir) - xSpd) * xAccel;
if(state == CLIMBING)
{
	xSpd = 0;
}

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
		// Falling Down (good movie)
		if(ySpd >= 0 ) 
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
					x = (floor(bbox_left / TILE_SIZE) * TILE_SIZE) + (curBoxHalfWidth);
				} else {
					x = (floor(bbox_right / TILE_SIZE) * TILE_SIZE) + (curBoxHalfWidth);
				}
				xSpd = 0;
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
	var ladderTileBottomRight = tilemap_get_at_pixel(ladderTiles,bbox_right,bbox_bottom);
	var ladderTileBottomLeft = tilemap_get_at_pixel(ladderTiles,bbox_left,bbox_bottom);
	var ladderTileCenter = tilemap_get_at_pixel(ladderTiles,x,y);
	if(state == CLIMBING)
	{
		if(ladderTileBottomLeft == 2 || ladderTileCenter == 2 || ladderTileBottomRight == 2)
		{
			state = SKATE_IDLE;
			y = (floor(bbox_bottom / TILE_SIZE) * TILE_SIZE) + (TILE_SIZE - 1);
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
				} else if(ladderBottomRight == 1) {
					x = (floor(bbox_right / TILE_SIZE) * TILE_SIZE) + (curBoxHalfWidth);
				} else {
					x = (floor(x / TILE_SIZE) * TILE_SIZE) + (curBoxHalfWidth);
				}
				xSpd = 0;
				y += ladderClimbSpeed;
				state = CLIMBING;
			}
		} 
	}
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
	with(instance_create_layer(x + 6, y - 25, "Instances", oProjRock))
	{
		speed = 7 * other.lastDir;
		
	}
	canShoot = false;
}

if(shootPressed)
{
	canShoot = true;
}