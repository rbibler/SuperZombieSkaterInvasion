
// Check to see if we've reached the edge of a platform and turn the f around
if(xDir > 0) {
	if(!rightGrounded && wasGroundedRight) {
		xDir = -1;
	}
} else if(xDir < 0) {
	if(!leftGrounded && wasGroundedLeft) {
		xDir = 1;
	}
}