/// @description Insert description here
// You can write your code in this editor
#macro SLAMMING 0x56
#macro RECOVERING 0x57


event_inherited();
health = 100;
immune = false;
immunityFlashToggle = 0;
immunityFlashSwitchTime = 0.075 * FRAMES_PER_SECOND;
lastImmunityFlashSwitch = 0;
immunityFlashValues[0] = c_aqua;
immunityFlashValues[1] = c_red;
immunityFlashValues[2] = c_blue;
immunityFlashValues[3] = c_yellow;
frameCounter = 0;
teleportSpeedX = 10;
teleportSpeedY = 10;
teleportSpeedMax = 10;

targetX = 0;
targetY = 0;

jumpCount = 0;

ladderClimbSpeed = 2;
onLadder = false;

jump_heights[0] = -5.0;
jump_heights[1] = -5.0;
jump_heights[2] = -5.0;
jump_heights[3] = -4.5;
jump_heights[4] = -4.5;
jump_heights[5] = -4.5;
jump_heights[6] = -4.5;
jump_heights[7] = -3.5;
jump_heights[8] = -3.5;
jump_heights[9] = -3.5;
jump_heights[10] = -3.25;
jump_heights[11] = -3.25;
jump_heights[12] = -3.25;
jump_heights[13] = -2.25;
jump_heights[14] = -2.25;
jump_heights[15] = -1.25;
jump_heights[16] = -1.25;
jump_heights[17] = -1.25;
jump_heights[18] = -1.25;
jump_heights[19] = -1.125;
jump_heights[20] = -1.125;
jump_heights[21] = -0.5;
jump_heights[22] = -0.5;
jump_heights[23] = -0.25;
jump_heights[24] = -0.25;
jump_heights[25] = -0.125;
jump_heights[26] = -0.125;
jump_heights[27] = -0.125;

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

glideTimerMax = 2;
glide_values[0] = 0.5;
glide_values[1] = 0.5;
glide_values[2] = 0.5;
glide_values[3] = 0.5;
glide_values[4] = 0.5;
glide_values[5] = 0.5;
glide_values[6] = 0.5;
glide_values[7] = 0.5;
glide_values[8] = 1.5;
glide_values[9] = 4.5;
glide_values[10] = 4.25;
glide_values[11] = 4.25;
glide_values[12] = 4.25;
glide_values[13] = 4.25;
glide_values[14] = 4.25;
glide_values[15] = 4.25;
glide_values[16] = 4.25;
glide_values[17] = 4.25;
glide_values[18] = 4.25;
glide_values[19] = 4.25;
glide_values[20] = 5.25;
glide_values[21] = 5.25;
glide_values[22] = 5.25;
glide_values[23] = 5.125;
glide_values[24] = 5.125;
glide_values[25] = 5.125;
glide_values[26] = 5.125;
glide_values[27] = 5.125;

jumpTimerMax = array_length_1d(jump_heights);
fallTimerMax = array_length_1d(fall_values);
jumpTimerFast = jumpTimerMax;
jumpTimerSlow = 16;

platformObject = pointer_null;
canGlide = false;

checkInputScript = PlayerCheckInput;
checkVertImpulseScript = PlayerCheckVertImpulse;
updateAnimationScript = PlayerUpdateAnimation;

recoveryTimer = 0;
recoveryTime = 30;

infected = false;
infectionTime = 0;
infectionVirulence = 0;
lastEpisodeTime = 0;


#macro JUMP_TIMER_SLOW	16
#macro JUMP_TIMER_FAST	28
#macro FALL_TIMER_MAX	28