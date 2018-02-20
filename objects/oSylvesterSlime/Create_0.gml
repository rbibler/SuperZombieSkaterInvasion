/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

checkInputScript = SylvesterSlimeAI;
updateAnimationScript = SylvesterSlimeAnimation;
xDir = 1;
state = MOVING;

jump_heights[0] = -25.0;
jump_heights[1] = -25.0;

fall_values[0] = 0.0;
fall_values[1] = 0.0;
fall_values[2] = 0.0;
fall_values[3] = 0.0;
fall_values[4] = 0.0;
fall_values[5] = 0.0;
fall_values[6] = 0.0;
fall_values[7] = 0.0;
fall_values[8] = 0.0;
fall_values[9] = 0.0;
fall_values[10] = .25;
fall_values[11] = .25;
fall_values[12] = .25;
fall_values[13] = .25;
fall_values[14] = .25;
fall_values[15] = .25;
fall_values[16] = .25;
fall_values[17] = .5;
fall_values[18] = .5;
fall_values[19] = .5;
fall_values[20] = .5;
fall_values[21] = .75;
fall_values[22] = .75;
fall_values[23] = .75;
fall_values[24] = .75;
fall_values[25] = .75;
fall_values[26] = .75;
fall_values[27] = .75;

jumpTimerMax = array_length_1d(jump_heights);
jumpTimerFast = jumpTimerMax;
jumpTimerSlow = jumpTimerMax;

fallTimerMax = array_length_1d(fall_values);