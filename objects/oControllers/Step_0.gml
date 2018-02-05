/// @description Insert description here
// You can write your code in this editor

if(gamepad_button_check_pressed(4,gp_face1)) {
	show_debug_message("Face 1");
}

if(gamepad_button_check_pressed(4,gp_face2)) {
	show_debug_message("Face 2");
}

if(gamepad_button_check_pressed(4,gp_face3)) {
	show_debug_message("Face 3");
}

if(gamepad_button_check_pressed(4,gp_face4)) {
	show_debug_message("Face 4");
}

if(gamepad_button_check_pressed(4,gp_shoulderl)) {
	show_debug_message("shoulderl");
}

if(gamepad_button_check_pressed(4,gp_shoulderlb)) {
	show_debug_message("shoulderlb");
}

if(gamepad_button_check_pressed(4,gp_shoulderr)) {
	show_debug_message("shoulderr");
}

if(gamepad_button_check_pressed(4,gp_shoulderrb)) {
	show_debug_message("shoulderrb");
}

if(gamepad_button_check_pressed(4,gp_select)) {
	show_debug_message("select");
}

if(gamepad_button_check_pressed(4,gp_start)) {
	show_debug_message("start");
}

if(gamepad_button_check_pressed(4,gp_stickl)) {
	show_debug_message("stickl");
}

if(gamepad_button_check_pressed(4,gp_stickr)) {
	show_debug_message("stickr");
}

if(gamepad_button_check_pressed(4,gp_padd)) {
	show_debug_message("padd");
}

if(gamepad_button_check_pressed(4,gp_padu)) {
	show_debug_message("padu");
}

if(gamepad_button_check_pressed(4,gp_padl)) {
	show_debug_message("padl");
}

if(gamepad_button_check_pressed(4,gp_padr)) {
	show_debug_message("padr");
}

var leftAxisHoriz = gamepad_axis_value(4, gp_axislh);
var leftAxisVert = gamepad_axis_value(4, gp_axislv);
//var rightAxisHoriz = gamepad_axis_value(4, gp_axisrh);
//var rightAxisVert = gamepad_axis_value(4, gp_axisrv);

show_debug_message("LH: " + string(leftAxisHoriz) + " LV: " + string(leftAxisVert));
//show_debug_message("RH: " + string(rightAxisHoriz) + " RV: " + string(rightAxisVert));