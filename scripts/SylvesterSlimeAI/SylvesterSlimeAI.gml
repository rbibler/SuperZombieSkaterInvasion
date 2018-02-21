if(state == MOVING) {
	script_execute(BadGuyAI);
} else if(state == JUMP_PREP) {
	if(jumpPrepCounter <= 0) {
		input[JUMP_INPUT] = 1;
	} else {
		jumpPrepCounter--;
	}
}
if(framesOnGround >= 100 && state == MOVING) {
	state = JUMP_PREP;
	xSpd = 0;
	xFraction = 0;
	xDirAtJump = xDir;
	xDir = 0;
	jumpPrepCounter = jumpPrepLength;
}


upPressed = input[0];
downPressed = input[1];
leftPressed = input[2];
rightPressed = input[3];
jumpPressed = input[4];
shootPressed = input[5];
selectPressed = input[6];