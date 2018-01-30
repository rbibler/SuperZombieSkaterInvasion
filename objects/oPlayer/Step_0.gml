/// @description Insert description here
// You can write your code in this editor


// Grab user input and convert to local variables
var input = PlayerCheckInput();

var up = input[0];
var down = input[1];
var left = input[2];
var right = input[3];
var jump = input[4];
var sprint_shoot = input[5];
var select = input[6];

// Process input

var skateReleased = left && right == 0;
var shootPressed = sprint_shoot && !lastInput[5];
var shootReleased = !sprint_shoot && lastInput[5];
var selectPressed = select && !lastInput[6];
var xDir = right - left;

// Save to check next step
lastInput[0] = input[0];
lastInput[1] = input[1];
lastInput[2] = input[2];
lastInput[3] = input[3];
lastInput[4] = input[4];
lastInput[5] = input[5];
lastInput[6] = input[6];

// Set x speed; sprint or normal
var xMax = normalXMax;
if(sprint_shoot) 
{
	xMax = sprintXMax;
}

// Calculate our bounding box for use in collision detection
var curBoxHalfWidth = (bbox_right - bbox_left) / 2;

image_blend = -1;


fallTimerMax = FALL_TIMER_MAX;

// check if on ground
PlayerCheckGrounded();

PlayerCheckTeleportation(selectPressed);

PlayerCheckVertImpulse(jump, sprint_shoot);


// Check for horizontal impetus
PlayerCheckHorizImpulse(xMax, xDir);

// Update fractions from last step
PlayerAddFraction();

// Check Horizontal Collisions
PlayerCheckHBGCol();

// Check horizontal platform collisions
PlayerCheckHPlatformCol();

// Finalize X Pos after collisions and movement
PlayerFinalizeXPos();

PlayerCheckVPlatformCol();

PlayerCheckVBGCol();

PlayerCheckLadderCol(up, down);


if(onPlatform)
{
	x += platformObject.tileSpeedX;
	y += platformObject.tileSpeedY;
}

if(y >= (room_height + sprite_height))
{
	game_restart();
}


PlayerUpdateAnimation(down, up, left, right, shootPressed, shootReleased);


if(shootReleased && canShoot)
{
	with(instance_create_layer(x + 6, y - 25, "Collidable_Objects", oProjRock))
	{
		speed = 7 * other.lastDir;
		
	}
	canShoot = false;
}

if(shootPressed)
{
	canShoot = true;
}

if(teleporterCounter > 0) {
	teleporterCounter--;
}