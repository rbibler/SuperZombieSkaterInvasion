/// @description Insert description here
// You can write your code in this editor

x += tileSpeedX;
y += tileSpeedY;

if(x >= xstart + xTravel) {
	tileSpeedX *= -1;
}
if(x <= xstart - xTravel) {
	tileSpeedX *= -1;
}

if(y >= ystart + yTravel) 
{
	tileSpeedY *= -1;
}
if(y <= ystart - yTravel)
{
	tileSpeedY *= -1;
}
