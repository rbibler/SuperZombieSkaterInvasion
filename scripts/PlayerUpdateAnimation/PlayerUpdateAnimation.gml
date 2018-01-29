/// Updates the animation
/// @arg downPressed
/// @arg upPressed
/// @arg left
/// @arg right
/// @arg shootPressed
/// @arg shootReleased

var downPressed = argument0;
var upPressed = argument1;
var left = argument2;
var right = argument3;
var shootPressed = argument4;
var shootReleased = argument5;

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