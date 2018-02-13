/// @description Insert description here
// You can write your code in this editor


up = input[0];
down = input[1];
left = input[2];
right = input[3];
jump = input[4];
sprint_shoot = input[5];
select = input[6];

// Process input

movementReleased = left && right == 0;
shootPressed = sprint_shoot && !lastInput[5];
shootReleased = !sprint_shoot && lastInput[5];
selectPressed = select && !lastInput[6];
xDir = -1;
event_inherited();

