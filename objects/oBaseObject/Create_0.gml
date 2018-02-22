/// @description Insert description here
// You can write your code in this editor

#macro IDLE			0x100				

#macro MOVING		0x200			

#macro CROUCHING	0x300			

#macro JUMPING		0x400				

#macro FALLING		0x500			

#macro CLIMBING		0xB00			

#macro GLIDING		0xC00			

#macro TELEPORTING	0x3234

#macro JUMP_PREP	0x765

#macro FRAMES_PER_SECOND	60

#macro FROZEN 0x309

#macro BOUNCING 0x34


#macro UP_INPUT		0
#macro DOWN_INPUT	1
#macro LEFT_INPUT	2
#macro RIGHT_INPUT	3
#macro JUMP_INPUT	4
#macro SHOOT_INPUT	5


state = IDLE;
lastState = -1;
canShoot = true;

xSpd = 0;
xFraction = 0;

ySpd = 1;
yFraction = 0;
rightGrounded = false;
middleGrounded = false;
leftGrounded = false;
wasGroundedRight = false;
wasGroundedMiddle = false;
wasGroundedLeft = false;
grounded = false;
wasGrounded = false;
framesSinceGround = 0;
framesOnGround = 0;

tilemap = layer_tilemap_get_id(layer_get_id("Collision"));
ladderTiles = layer_tilemap_get_id(layer_get_id("Ladder_Tiles"));

lastDir = 1;

jumpTimer = 0;

fallTimer = 0;
fallTimerMax = 0;

glideTimer = 0;
glideTimerMax = 0;

onPlatform = false;

canGlide = false;

checkInputScript = CheckInput;
updateAnimationScript = EmptyScript;