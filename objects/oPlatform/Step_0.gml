/// @description Insert description here
// You can write your code in this editor

x += tileSpeed;

if(x >= xMax) {
	tileSpeed *= -1;
}
if(x <= xMin) {
	tileSpeed *= -1;
}
