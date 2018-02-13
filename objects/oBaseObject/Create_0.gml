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


state = IDLE;
lastState = -1;
canShoot = true;


normalXMax = 3.5;
sprintXMax = 4.5;
xSpd = 0;
xAccel = 0.2;
xFraction = 0;

ySpd = 1;
yFraction = 0;
grounded = false;

tilemap = layer_tilemap_get_id(layer_get_id("Collision"));
ladderTiles = layer_tilemap_get_id(layer_get_id("Ladder_Tiles"));

lastDir = 1;

jumpTimer = 0;
jumpTimerMax = 0;

fallTimer = 0;
fallTimerMax = 0;

glideTimer = 0;
glideTimerMax = 0;

onPlatform = false;

canGlide = false;

checkInputScript = CheckInput;
updateAnimationScript = EmptyScript;