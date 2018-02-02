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
var a = keyboard_check(vk_space);
var b = keyboard_check(ord("Z"));
var select = keyboard_check(vk_shift);

input[0] = up;
input[1] = down;
input[2] = left;
input[3] = right;
input[4] = a;
input[5] = b;
input[6] = b;

return input;
