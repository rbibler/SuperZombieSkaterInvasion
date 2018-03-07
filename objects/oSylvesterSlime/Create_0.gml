/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event


event_inherited();
CHOMPING = 4;
SWALLOWING = 5;
EXPLODING = 6;
SYLVESTER_FLYING = 7;


chompFrames = 10;
swallowingFrames = 30;
explodingFrames = 16;
eventTimer = 0;
lastEventTime = 0;
explodeWobbleFrames = 4;
swallowWobbleFrames = 4;
wobbleToggle = 1;

jumpTime = random_range(150,350);

checkInputScript = SylvesterSlimeAI;
updateAnimationScript = SylvesterSlimeAnimation;
xDir = 1;
xDirAtJump = 0;
state = MOVING;

jump_heights[0] = -15.0;
jump_heights[1] = -12.0;
jump_heights[2] = -10.0;
jump_heights[3] = -7.5;
jump_heights[4] = -5.0;
jump_heights[5] = -2.5;
jump_heights[6] = -1.0;
jump_heights[7] = -0.75;
jump_heights[8] = -0.5;
jump_heights[9] = -0.25;
jump_heights[20] = -0.125;

fall_values[0] = 0.0;
fall_values[1] = 0.125;
fall_values[2] = 0.125;
fall_values[3] = 0.25;
fall_values[4] = 0.25;
fall_values[5] = 0.25;
fall_values[6] = 0.5;
fall_values[7] = 0.5;
fall_values[8] = 0.5;
fall_values[9] = 0.5;
fall_values[10] = .75;
fall_values[11] = .75;
fall_values[12] = .75;
fall_values[13] = .75;
fall_values[14] = .75;
fall_values[15] = 1;
fall_values[16] = 1;


fly_values[0] = -5;
fly_values[1] = -5;
fly_values[2] = -4;
fly_values[3] = -4;
fly_values[4] = -3;
fly_values[5] = -3;
fly_values[6] = -2;
fly_values[7] = -2;
fly_values[8] = -1;
fly_values[9] = -1;
flyValuesMax = array_length_1d(fly_values);
flyTimer = 0;




jumpTimerMax = array_length_1d(jump_heights);
jumpTimerFast = jumpTimerMax;
jumpTimerSlow = jumpTimerMax;

fallTimerMax = array_length_1d(fall_values);
jumpPrepCounter = 0;
jumpPrepLength = 50;

WALK_START_INDEX = 0;
WALK_END_INDEX = 2;
JUMP_INDEX = 2;
FALL_INDEX = 3;

isInfector = true;
virulence = 3;
hitPower = 3;
infectionTime = 5 * FRAMES_PER_SECOND;