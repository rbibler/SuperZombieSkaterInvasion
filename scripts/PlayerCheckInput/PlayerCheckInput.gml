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
var a = keyboard_check(ord("F"));
var b = keyboard_check(ord("D"));
var select = keyboard_check(vk_shift);

var deviceCount = gamepad_get_device_count();

if(deviceCount > 900) {
	up = gamepad_button_check(4, gp_padu);
	down = gamepad_button_check(4, gp_padd);
	left = gamepad_button_check(4, gp_padl);
	right = gamepad_button_check(4, gp_padr);
	a = gamepad_button_check(4, gp_face2);
	b = gamepad_button_check(4, gp_face3);
	select = gamepad_button_check(4, gp_select);
}


input[0] = up;
input[1] = down;
input[2] = left;
input[3] = right;
input[4] = a;
input[5] = b;
input[6] = b;


upPressed = input[0];
downPressed = input[1];
leftPressed = input[2];
rightPressed = input[3];
jumpPressed = input[4];
shootPressed = input[5];
selectPressed = input[6];

// Process input

movementReleased = leftPressed && rightPressed == 0;
jumpReleased = !jumpPressed && lastInput[4];
shootNewPress = shootPressed && !lastInput[5];
shootReleased = !shootPressed && lastInput[5];
selectPressed = selectPressed && !lastInput[6];
xDir = rightPressed - leftPressed;