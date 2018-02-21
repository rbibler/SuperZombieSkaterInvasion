switch(state) {
	case MOVING:
		if(image_index >= WALK_END_INDEX) {
			image_index = WALK_START_INDEX;
		}
	break;
	case JUMPING:
		image_index = JUMP_INDEX;
	case FALLING:
		if(grounded) {
			state = MOVING;
			jumpPressed = false;
			input[JUMP_INPUT] = 0;
			xDir = xDirAtJump;
			image_index = WALK_START_INDEX;
		} else if(state != JUMPING) {
			image_index = FALL_INDEX;
		}
	break;
	case JUMP_PREP:
		var index = floor(((jumpPrepCounter - 1) / 5) % 2);
		image_index = index;
		if(jumpPrepCounter < 5) {
			image_index = 0;
		}
	break;
	case CHOMPING:
		if(eventTimer <= 0) {
			eventTimer = swallowingFrames;
			state = SWALLOWING;
		}
		image_index = 5;
	break;
	case SWALLOWING:
		image_index = 7;
		if(eventTimer <= 0) {
			eventTimer = explodingFrames;
			state = EXPLODING;
		}
	break;
	case EXPLODING:
	image_index = 6;
		if(eventTimer <= 0) {
			instance_destroy();
			with(oPlayer) {
				state = IDLE;
				immune = false;
				image_speed = 1;
			}
		}
	break;
}

image_xscale = sign(xSpd);
if(image_xscale == 0) 
{
	image_xscale = lastDir;
}
lastDir = image_xscale;