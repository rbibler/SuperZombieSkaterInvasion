/// @description Insert description here
// You can write your code in this editor

xTo = follow.x;
yTo = follow.y
var playerDir = follow.direction;

x += (xTo - x) / 1.125;
y += (yTo - y) / 1.125;

var xFinal = x - 200;
var yFinal = y - 150;


if(xFinal < 0)
{
	xFinal = 0;
} else if(xFinal >= (room_width - 400))
{
	xFinal = room_width - 400;
}

if(yFinal < 0)
{
	yFinal = 0;
} else if(yFinal >= (room_height - 200))
{
	yFinal = room_height - 200;
}

camera_set_view_pos(cam, xFinal, yFinal);