/// Ai script to follow the player
/// @arg input
if(oPlayer.x < x) {
	input[2] = true;
	input[3] = false;
} else {
	input[3] = true;
	input[2] = false;
}


upPressed = input[0];
downPressed = input[1];
leftPressed = input[2];
rightPressed = input[3];
jumpPressed = input[4];
shootPressed = input[5];
selectPressed = input[6];

// Process input

movementReleased = leftPressed && rightPressed == 0;
jumpReleased = !jumpPressed && lastInput[4];
shootNewPress = shootPressed && !lastInput[5];
shootReleased = !shootPressed && lastInput[5];
selectPressed = selectPressed && !lastInput[6];
xDir = rightPressed - leftPressed;

