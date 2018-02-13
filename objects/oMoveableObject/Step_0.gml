/// @description Insert description here
// You can write your code in this editor


script_execute(checkInputScript);
// Calculate our bounding box for use in collision detection
var curBoxHalfWidth = (bbox_right - bbox_left) / 2;
// Grab user input and convert to local variables


// Set x speed; sprint or normal
var xMax = normalXMax;
if(shootPressed) 
{
	xMax = sprintXMax;
}


image_blend = -1;

fallTimerMax = FALL_TIMER_MAX;

// check if on ground
CheckGrounded();

if(canTeleport) {
	CheckTeleportation(selectPressed);
}

CheckVertImpulse(jumpPressed, jumpReleased, shootPressed);

// Check for horizontal impetus
CheckHorizImpulse(xMax, xDir);

// Update fractions from last step
AddFraction();

// Check Horizontal Collisions
if(state != TELEPORTING) {
	CheckHBGCol();
	CheckHPlatformCol();
}

// Finalize X Pos after collisions and movement
FinalizeXPos();

if(state != TELEPORTING) {
	CheckVPlatformCol();
	CheckVBGCol();
	CheckLadderCol(upPressed, downPressed);
} else {
	y += ySpd;
}

if(onPlatform)
{
	x += platformObject.tileSpeedX;
	y += platformObject.tileSpeedY;
}

script_execute(updateAnimationScript);

