/// @description Insert description here
// You can write your code in this editor

var left = keyboard_check(vk_left);
var right = keyboard_check(vk_right);
var down = keyboard_check(vk_down);
var skateReleased = left && right == 0;
var xDir = right - left;
var jumpPressed = keyboard_check(vk_space);
var jumpReleased = keyboard_check_released(vk_space);
var sprintPressed = keyboard_check(vk_shift);
var xMax = normalXMax;
if(sprintPressed) 
{
	xMax = sprintXMax;
}

fallTimerMax = FALL_TIMER_MAX;

grounded = InFloor(tilemap,x,bbox_bottom+1) >= 0;

if(grounded) {
	airState = GROUNDED;
	jumpTimer = 0;
	fallTimer = 0;
	if(jumpPressed && jumpKeyDown == 0) 
	{
		grounded = false;
		jumpKeyDown = 1;
		airState = JUMPING;
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
	if(jumpPressed && airState == JUMPING)
	{
		if(jumpTimer >= jumpTimerMax)
		{
			airState = FALLING;
		
		} else {
			ySpd = jump_heights[jumpTimer++];
		}
	} else 
	{
		airState = FALLING;
	}
}

if(airState == FALLING)
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
			airState = FALLING;
			jumpTimer = jumpTimerMax;
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


/*
* Animation:
* States are:
* Idle
* Skating
* Jumping
* Falling
* Hit
*/
switch(animState) 
{
	case ANIM_IDLE:
		if(airState == JUMPING) 
		{
			animState = ANIM_JUMP;
			sprite_index = sSkaterJump;
			image_index = 0;
		} else if(airState == FALLING)
		{
			animState = ANIM_FALL;
			sprite_index = sSkaterFall;
			image_index = 0;
		} else if(left || right) 
		{
			animState = ANIM_SKATE;
			sprite_index = sSkater;
		} else if(down)
		{
			animState = ANIM_CROUCH;
			sprite_index = sSkaterCrouch;
		} else
		{
			sprite_index = sSkaterIdle;
		}
	break;
	case ANIM_SKATE:
		if(airState == JUMPING) 
		{
			animState = ANIM_JUMP;
			sprite_index = sSkaterJump;
			image_index = 0;
		} else if(airState == FALLING)
		{
			animState = ANIM_FALL;
			sprite_index = sSkaterFall;
			image_index = 0;
		} else if(down)
		{
			animState = ANIM_CROUCH;
			sprite_index = sSkaterCrouch;
		} else if(left + right == 0)
		{
			animState = ANIM_IDLE;
			sprite_index = sSkaterIdle;
		}
	break;
	case ANIM_JUMP:
		if(airState == FALLING)
		{
			animState = ANIM_FALL;
			sprite_index = sSkaterFall;
			image_index = 0;
		} else if(grounded)
		{
			if(left || right) {
				animState = ANIM_SKATE;
				sprite_index = sSkater;
			} else {
				animState = ANIM_IDLE;
				sprite_index = sSkaterIdle;
			}
		}
	break;
	case ANIM_CROUCH:
		if(airState == FALLING)
		{
			animState = ANIM_FALL;
			sprite_index = sSkaterFall;
			image_index = 0;
		} else if(!down)
		{
			if(left || right) {
				animState = ANIM_SKATE;
				sprite_index = sSkater;
			} else {
				animState = ANIM_IDLE;
				sprite_index = sSkaterIdle;
			}
		}
	break;
	case ANIM_BAIL:
	break;
	case ANIM_FALL:
		if(grounded)
		{
			if(left || right) {
				animState = ANIM_SKATE;
				sprite_index = sSkater;
			} else {
				animState = ANIM_IDLE;
				sprite_index = sSkaterIdle;
			}
		}
	break;
	case ANIM_FLIP:
	break;
	case ANIM_SLAM:
	break;
}
if(animState != lastAnimState)
{
	image_index = 0;
}
lastAnimState = animState;




// Image rotation based on direction
// Check direction
image_xscale = sign(xSpd);
if(image_xscale == 0) 
{
	image_xscale = lastDir;
}
lastDir = image_xscale;