/// Checks to see if player is jumping or falling and adds to vert speed accoridngly
if(state == TELEPORTING) {
	ySpd = sign(targetY - y) * teleportSpeedY;
} else {

	// Check for vertical impetus (i.e. jumping)
	if(framesSinceGround <= jumpLeeway) {
		if(CanJump(jumpPressed)) {
			grounded = false;
			rightGrounded = false;
			middleGrounded = false;
			leftGrounded = false;
			state = JUMPING;
			ySpd = jump_heights[jumpTimer++];
			if(shootPressed && abs(xSpd) > 0) {
				jumpTimerMax = jumpTimerFast;
			} else {
				jumpTimerMax = jumpTimerSlow;
			}
		}
	}
	if(grounded || onPlatform) {
		//show_debug_message("Grounded or on platform");
		// Not jumping or falling, so reset timers
		jumpTimer = 0;
		fallTimer = 0;
		glideTimer = 0;
		framesSinceGround = 0;
		framesOnGround++;
	} else {
		framesSinceGround++;
		framesOnGround = 0;
		onPlatform = false;
		if(state == JUMPING) {
			if(jumpTimer >= jumpTimerMax || !jumpPressed) {
				state = FALLING;
			} else {
				ySpd = jump_heights[jumpTimer++];
			}
		} else if(state == GLIDING) {
			if(jumpReleased) {
				state = FALLING;
			} else {
				ySpd = glide_values[glideTimer++];
				if(glideTimer >= glideTimerMax) {
					glideTimer = glideTimerMax - 1;
				}
			}
		} else if(state != CLIMBING && state != SLAMMING) {
			state = FALLING;
		}
	}
	if(state == FALLING) {
		if(CanGlide(jumpPressed)) {
			state = GLIDING;
		} else {
			ySpd = fall_values[fallTimer++];
			if(fallTimer >= fallTimerMax) {
				fallTimer = fallTimerMax - 1;
			}
		}
	}
}