/// @description Insert description here
// You can write your code in this editor

tilemap = layer_tilemap_get_id(layer_get_id("Collision"));

onPlatform = false;
grounded = false;
xMax = 10;
xAccel = 0.2;
xSpd = 0;
ySpd = 0;
xFraction = 0;
yFraction = 0;
xDir = 0;
yDir = 0;
state = -1;

stopped = false;


jumpTimer = 0;
jumpTimerMax = 28;
jump_heights[0] = -5.5;
jump_heights[1] = -5.5;
jump_heights[2] = -5.5;
jump_heights[3] = -5.5;
jump_heights[4] = -4.5;
jump_heights[5] = -4.5;
jump_heights[6] = -4.5;
jump_heights[7] = -4.5;
jump_heights[8] = -4.5;
jump_heights[9] = -4.5;
jump_heights[10] = -4.25;
jump_heights[11] = -4.25;
jump_heights[12] = -4.25;
jump_heights[13] = -3.25;
jump_heights[14] = -3.25;
jump_heights[15] = -2.25;
jump_heights[16] = -2.25;
jump_heights[17] = -2.25;
jump_heights[18] = -2.25;
jump_heights[19] = -2.125;
jump_heights[20] = -2.125;
jump_heights[21] = -1.5;
jump_heights[22] = -1.5;
jump_heights[23] = -0.75;
jump_heights[24] = -0.75;
jump_heights[25] = -0.25;
jump_heights[26] = -0.25;
jump_heights[27] = -0.25;

fallTimer = 0;
fallTimerMax = 0;
fall_values[0] = 0.5;
fall_values[1] = 0.75;
fall_values[2] = 0.75;
fall_values[3] = 1.25;
fall_values[4] = 1.25;
fall_values[5] = 2.75;
fall_values[6] = 3.25;
fall_values[7] = 3.25;
fall_values[8] = 3.5;
fall_values[9] = 4.5;
fall_values[10] = 4.25;
fall_values[11] = 4.25;
fall_values[12] = 4.25;
fall_values[13] = 4.25;
fall_values[14] = 4.25;
fall_values[15] = 4.25;
fall_values[16] = 4.25;
fall_values[17] = 4.25;
fall_values[18] = 4.25;
fall_values[19] = 4.25;
fall_values[20] = 5.25;
fall_values[21] = 5.25;
fall_values[22] = 5.25;
fall_values[23] = 5.125;
fall_values[24] = 5.125;
fall_values[25] = 5.125;
fall_values[26] = 5.125;
fall_values[27] = 5.125;