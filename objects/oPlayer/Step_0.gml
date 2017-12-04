/// @description Insert description here
// You can write your code in this editor

var left = keyboard_check(vk_left);
var right = keyboard_check(vk_right);
var xDir = right - left;
var jumpPressed = keyboard_check(vk_space);


if(grounded && jumpPressed) {
	grounded = false;
	ySpd = -25;
}

var yDir = sign(ySpd);

ySpd += (yMax - ySpd) * yAccel;
xSpd += ((xMax * xDir) - xSpd) * xAccel;

x += xSpd;
y += ySpd;

if(y >= 700) {
	y = 700;
	grounded = true;
	ySpd = 0;
}
