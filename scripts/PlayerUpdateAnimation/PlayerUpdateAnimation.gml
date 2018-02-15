/// Updates the animation


switch(state) 
{
	case IDLE:
		if(leftPressed || rightPressed) 
		{
			state = MOVING;
			sprite_index = sSkater;
		} else if(downPressed)
		{
			state = CROUCHING;
			sprite_index = sSkaterCrouch;
		} else if(shootPressed && CanShoot())
		{
			state = IDLE;
			sprite_index = sSkaterSlingShotIdle;
			
		} else
		{
			sprite_index = sSkaterIdle;
		}
	break;
	case MOVING:
		if(downPressed)
		{
			state = CROUCHING;
			sprite_index = sSkaterCrouch;
		} else if(shootPressed && CanShoot())
		{
			state = MOVING;
			var imgIndex = image_index;
			sprite_index = sSkaterSlingShot;
			image_index = (imgIndex + 1) % 2;
		} else if(leftPressed + rightPressed == 0)
		{
			state = IDLE;
			sprite_index = sSkaterIdle;
		}
	break;
	/*case SKATE_IDLE_WEAPON_DRAWN:
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
	break;*/
	case JUMPING:
		if(grounded)
		{
			
			if(leftPressed || rightPressed) {
				state = MOVING;
				sprite_index = sSkater;
			} else {
				state = IDLE;
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
	case CROUCHING:
		if(!downPressed)
		{
			if(leftPressed || rightPressed) {
				state = JUMPING;
				sprite_index = sSkater;
			} else {
				state = IDLE;
				sprite_index = sSkaterIdle;
			}
		}
	break;
	case FALLING:
	case GLIDING:
		if(grounded)
		{
			if(leftPressed || rightPressed) {
				state = MOVING;
				sprite_index = sSkater;
			} else {
				state = IDLE;
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
image_xscale *= 0.75;
image_yscale = 0.75;