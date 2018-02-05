switch(async_load[? "event_type"])             // Parse the async_load map to see which event has been triggered
{
case "gamepad discovered":                     // A game pad has been discovered
    var pad = async_load[? "pad_index"];       // Get the pad index value from the async_load map
    var buttonCount = gamepad_button_count(pad);
	var axisCount = gamepad_axis_count(pad);
	show_debug_message("GAME PAD " + string(pad) + " DETECTED!");
	show_debug_message("It has " + string(buttonCount) + " buttons!");
	show_debug_message("and " + string(axisCount) + " axes!");
	show_debug_message("deadzone " + string(gamepad_get_axis_deadzone(pad)));
    break;
case "gamepad lost":                           // Gamepad has been removed or otherwise disabled
    var pad = async_load[? "pad_index"];       // Get the pad index
	show_debug_message("GAME PAD " + string(pad) + " LOST!");
    break;
}