/// Checks to see if character can jump
/// @arg jumpKeyPress

var jumpKeyPress = argument0;

return state != JUMPING && jumpKeyPress && !lastInput[4];
