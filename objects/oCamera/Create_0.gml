/// @description Insert description here
// You can write your code in this editor
follow = oPlayer;
xTo = 0;
yTo = 0;
cam = view_camera[0];
viewW = 600;
viewH = 300;
viewHNoScale = 200;
camera_set_view_size(cam, viewW, viewH);

shouldFollowVert = false;
currentVertHeight = room_height - 100;

leftBound = 0;
rightBound = 0;
topBound = 0;
bottomBound = 0;

boundBoxOffsetX = (viewW / 2) - ((bbox_right - bbox_left) / 2);