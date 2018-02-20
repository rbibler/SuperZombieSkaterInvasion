if(state == MOVING) {
	script_execute(BadGuyAI);
}
if(framesOnGround >= 100) {
	input[JUMP_INPUT] = 1;
	xSpd = 0;
	xFraction = 0;
}

upPressed = input[0];
downPressed = input[1];
leftPressed = input[2];
rightPressed = input[3];
jumpPressed = input[4];
shootPressed = input[5];
selectPressed = input[6];