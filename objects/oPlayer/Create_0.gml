/// @description Insert description here
// You can write your code in this editor
normalXMax = 4;
sprintXMax = 6;
xSpd = 0;
xAccel = 0.2;
x_fraction = 0;

yMax = 15;
ySpd = 1;
yAccel = 0.07;
grounded = false;
y_fraction = 0;

jumpCount = 0;
jumpKeyDown = 0;

jumpSpeedMax = 20;


tilemap = layer_tilemap_get_id(layer_get_id("Collision"));

lastDir = 1;
