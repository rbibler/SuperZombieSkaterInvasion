// up
// down
// left
// right
// jump (NES A)
// sprint (NES B)
// shoot (NES B)

var up = keyboard_check(vk_up);
var down = keyboard_check(vk_down);
var left = keyboard_check(vk_left);
var right = keyboard_check(vk_right);
var jump = keyboard_check(vk_space);
var sprint_shoot = keyboard_check(vk_control);

input[0] = up;
input[1] = down;
input[2] = left;
input[3] = right;
input[4] = jump;
input[5] = sprint_shoot;

return input;
