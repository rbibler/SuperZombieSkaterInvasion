/// @description Insert description here
// You can write your code in this editor
normalXMax = 6;
sprintXMax = 8;
xSpd = 0;
xAccel = 0.2;
x_fraction = 0;

yMax = 15;
ySpd = 1;
yAccel = 0.09;
grounded = false;
y_fraction = 0;

jumpCount = 0;
jumpKeyDown = 0;

tilemap = layer_tilemap_get_id(layer_get_id("Collision"));
