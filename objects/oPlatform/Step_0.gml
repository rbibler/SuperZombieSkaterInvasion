/// @description Insert description here
// You can write your code in this editor

x += tileSpeed;

if(x >= xMax) {
	tileSpeed *= -1;
}
if(x <= xMin) {
	tileSpeed *= -1;
}


if(instance_exists(oPlayer))
{
	if(place_meeting(x, y - 1, oPlayer) && oPlayer.bbox_bottom <= bbox_bottom)
	{
		oPlayer.xSpdFromFriends = tileSpeed;
	}
}