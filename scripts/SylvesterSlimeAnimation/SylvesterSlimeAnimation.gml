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
			lastEventTime = eventTimer;
			x = oPlayer.x;
			y = oPlayer.y;
			with(oPlayer) {
				visible = false;
			}
		}
		if(eventTimer >= chompFrames / 2) {
			image_index = 5;
		} else {
			image_index = 6;
		}
	break;
	case SWALLOWING:
		if(eventTimer <= 0) {
			eventTimer = explodingFrames;
			state = EXPLODING;
			lastEventTime = eventTimer;
		}
		if(eventTimer >= swallowingFrames / 2) {
			image_index = 7;
		} else {
			image_index = 8;
		}
		var wobbleTime = lastEventTime - eventTimer;
		if(wobbleTime >= swallowWobbleFrames) {
			lastEventTime = eventTimer;
			x += wobbleToggle;
			wobbleToggle = -wobbleToggle;
		}
	break;
	case EXPLODING:
		var wobbleTime = lastEventTime - eventTimer;
		if(wobbleTime >= swallowWobbleFrames) {
			lastEventTime = eventTimer;
			x += wobbleToggle;
			
			wobbleToggle = -wobbleToggle;
		}
		if(eventTimer <= 0) {
			instance_destroy();
			with(oPlayer) {
				state = IDLE;
				immune = false;
				image_speed = 1;
				xDir = -1;
				visible = true;
			}
		}
	break;
}

if(state == MOVING || state == JUMPING || state == JUMP_PREP) {
	image_xscale = sign(xSpd);
	if(image_xscale == 0) {
		image_xscale = lastDir;
	}
	lastDir = image_xscale;
}