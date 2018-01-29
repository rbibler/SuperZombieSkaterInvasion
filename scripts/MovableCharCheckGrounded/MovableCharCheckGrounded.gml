/// @description Checks to see if an object is on the ground. Returns true or false. 
/// @arg tilemap
/// @arg x
/// @arg bbox_bottom

grounded = (InFloor(tilemap,x,bbox_bottom+1) >= 0);
if(grounded || onPlatform) {
	fallTimer = 0;
} else {
	onPlatform = false;
	state = FALLING;
}