/// @description Insert description here
// You can write your code in this editor

// States:

#macro GROUNDED_MASK				0x02				// 0b000
#macro WEAPON_DRAWN_MASK			0x04				// 0b010
#macro JUMPING_MASK					0x08				// 0b001
#macro	FALLING_MASK				0x10				// 0b101

#macro	SKATE_IDLE					0x100				// Grounded
#macro	SKATE_IDLE_GROUND			0x102
#macro	SKATE_IDLE_WEAPON_DRAWN		0x106				// Weapon Drawn

#macro	SKATE_SKATING				0x200				// Grounded
#macro	SKATE_SKATING_GROUND		0x202
#macro	SKATE_SKATING_WEAPON_DRAWN	0x206				// Weapon Drawn

#macro	SKATE_CROUCH				0x300				// Grounded
#macro	SKATE_CROUCH_GROUND			0x302
#macro	SKATE_CROUCH_WEAPON_DRAWN	0x306				// Weapon Drawn

#macro	SKATE_JUMPING				0x400				// Jumping
#macro	SKATE_JUMPING_JUMP			0x408
#macro	SKATE_JUMPING_WEAPON_DRAWN	0x40C				// Jumping + Weapon Drawn

#macro	SKATE_FALLING				0x500				// Falling
#macro	SKATE_FALLING_FALL			0x510
#macro	SKATE_FALLING_WEAPON_DRAWN	0x514				// Falling + Weapon Drawn

#macro	FOOT_IDLE					0x600				// Grounded
#macro	FOOT_IDLE_GROUND			0x602
#macro	FOOT_IDLE_WEAPON_DRAWN		0x604				// Grounded + Weapon Drawn

#macro	FOOT_RUNNING				0x700				// Grounded
#macro	FOOT_RUNNING_GROUND			0x702
#macro	FOOT_RUNNING_WEAPON_DRAWN	0x704				// Grounded + Weapon Drawn

#macro	FOOT_JUMPING				0x800				// Jumping
#macro	FOOT_JUMPING_JUMP			0x808
#macro	FOOT_JUMPING_WEAPON_DRAWN	0x80C				// Jumping + Weapon Drawn

#macro	FOOT_FALLING				0x900				// Falling
#macro	FOOT_FALLING_FALL			0x910
#macro	FOOT_FALLING_WEAPON_DRAWN	0x914				// Falling + Weapon Drawn

#macro	FOOT_CROUCH					0xA00				// Grounded
#macro	FOOT_CROUCH_GROUND			0xA02
#macro	FOOT_CROUCH_WEAPON_DRAWN	0xA04				// Grounded + Weapon Drawn

#macro	CLIMBING				0xB00				// Grounded

#macro	GLIDING						0xC00				// Jumping
#macro	GLIDING_FALL				0xC10

#macro SKATE_TELEPORTING			0x3234



// state variables
state = SKATE_IDLE;
lastState = -1;
canShoot = true;

cooldown = 5;
ammoMax = 1;
ammoOnScreen = 0;

lastInput[0] = false;
lastInput[1] = false;
lastInput[2] = false;
lastInput[3] = false;
lastInput[4] = false;
lastInput[5] = false;
lastInput[6] = false;


teleportSpeedX = 10;
teleportSpeedY = 10;
teleportSpeedMax = 10;

normalXMax = 3.5;
sprintXMax = 4.5;
xSpd = 0;
xSpdFromFriends = 0;
xAccel = 0.2;
xFraction = 0;

targetX = 0;
targetY = 0;

ySpd = 1;
yFraction = 0;
grounded = false;

jumpCount = 0;

ladderClimbSpeed = 2;
onLadder = false;

tilemap = layer_tilemap_get_id(layer_get_id("Collision"));
ladderTiles = layer_tilemap_get_id(layer_get_id("Ladder_Tiles"));

lastDir = 1;

jumpTimer = 0;
jumpTimerMax = 0;
jump_heights[0] = -6.0;
jump_heights[1] = -6.0;
jump_heights[2] = -6.0;
jump_heights[3] = -5.5;
jump_heights[4] = -5.5;
jump_heights[5] = -5.5;
jump_heights[6] = -5.5;
jump_heights[7] = -4.5;
jump_heights[8] = -4.5;
jump_heights[9] = -4.5;
jump_heights[10] = -4.25;
jump_heights[11] = -4.25;
jump_heights[12] = -4.25;
jump_heights[13] = -3.25;
jump_heights[14] = -3.25;
jump_heights[15] = -2.25;
jump_heights[16] = -2.25;
jump_heights[17] = -2.25;
jump_heights[18] = -2.25;
jump_heights[19] = -2.125;
jump_heights[20] = -2.125;
jump_heights[21] = -1.5;
jump_heights[22] = -1.5;
jump_heights[23] = -0.75;
jump_heights[24] = -0.75;
jump_heights[25] = -0.25;
jump_heights[26] = -0.25;
jump_heights[27] = -0.25;

fallTimer = 0;
fallTimerMax = 0;
fall_values[0] = 0.5;
fall_values[1] = 0.75;
fall_values[2] = 0.75;
fall_values[3] = 1.25;
fall_values[4] = 1.25;
fall_values[5] = 2.75;
fall_values[6] = 3.25;
fall_values[7] = 3.25;
fall_values[8] = 3.5;
fall_values[9] = 4.5;
fall_values[10] = 4.25;
fall_values[11] = 4.25;
fall_values[12] = 4.25;
fall_values[13] = 4.25;
fall_values[14] = 4.25;
fall_values[15] = 4.25;
fall_values[16] = 4.25;
fall_values[17] = 4.25;
fall_values[18] = 4.25;
fall_values[19] = 4.25;
fall_values[20] = 5.25;
fall_values[21] = 5.25;
fall_values[22] = 5.25;
fall_values[23] = 5.125;
fall_values[24] = 5.125;
fall_values[25] = 5.125;
fall_values[26] = 5.125;
fall_values[27] = 5.125;

airState = GROUNDED;
onPlatform = false;
platformObject = pointer_null;

#macro	GROUNDED	0
#macro	JUMPING		1
#macro	FALLING		2
#macro JUMP_TIMER_SLOW	16
#macro JUMP_TIMER_FAST	28
#macro FALL_TIMER_MAX	28