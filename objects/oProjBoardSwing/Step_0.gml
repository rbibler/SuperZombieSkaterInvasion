/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
frameCounter++;
if(frameCounter >= boardSwingFrameLength) {
	parentWeapon.ammoOnScreen--;
	instance_destroy();
	
}

event_inherited();
x = oPlayer.x + parentWeapon.projXOffset;
y = oPlayer.y + parentWeapon.projYOffset;

