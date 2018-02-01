/// @description Insert description here
// You can write your code in this editor

xTo = follow.x;
yTo = follow.y
var playerDir = follow.direction;
var followSpeed = 2;


x += (xTo - x) / followSpeed;
y += (yTo - y) / followSpeed;

var xFinal = x - (viewW / 2);
var yFinal = y - (viewH / 2) - (viewH * 0.25);
//var yFinal = y;

if(xFinal < 0)
{
	xFinal = 0;
} else if(xFinal >= (room_width - viewW))
{
	xFinal = room_width - viewW;
}

if(yFinal < 0)
{
	yFinal = 0;
} else if(yFinal >= (room_height - viewH))
{
	yFinal = room_height - viewH;
}

camera_set_view_pos(cam, xFinal, yFinal);