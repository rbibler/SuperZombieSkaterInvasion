
var leftDiff = follow.x - bbox_left;
var rightDiff = follow.x - bbox_right;
var topDiff = follow.y - bbox_top;
var bottomDiff = follow.y - bbox_bottom;

var xTo = x;
var yTo = y;

if(leftDiff < 0) {
	xTo = x + leftDiff;
}
if(rightDiff > 0) {
	xTo = x + rightDiff;
	show_debug_message(string(rightDiff));
}
if(topDiff < 0) {
	yTo = y + topDiff;
}
if(bottomDiff > 0) {
	yTo = y + bottomDiff;
}

var followSpeed = 3;
x += (xTo - x) / followSpeed;
y += (yTo - y) / followSpeed;




var camFinalX = x - boundBoxOffsetX;
var camFinalY = y - 25;

if(camFinalY >= (room_height - viewH)) {
	camFinalY = (room_height - viewH);
	y = camFinalY + 25;
}

if(camFinalY < 0) {
	camFinalY = 0;
	y = camFinalY + 25;
}

if(camFinalX < 0) {
	camFinalX = 0;
	x = camFinalX + boundBoxOffsetX;
}

if(camFinalX > (room_width - viewW)) {
	camFinalX = (room_width - viewW);
	x = camFinalX + boundBoxOffsetX
}

camera_set_view_pos(cam, camFinalX, camFinalY);
