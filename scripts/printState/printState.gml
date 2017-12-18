/// @arg state

switch(state)
{


	case SKATE_IDLE:
		show_debug_message("state = Idle");
	break;
	case SKATE_SKATING:
		show_debug_message("State = Skating");
	break;
	case SKATE_CROUCH:
		show_debug_message("State = Crouch");
	break;
	case SKATE_JUMPING:
		show_debug_message("State = Jumping");
	break;
	case SKATE_FALLING:
		show_debug_message("State = Falling");
	break;
	case CLIMBING:
		show_debug_message("State = Climbing");
	break;
	default: 
		show_debug_message("State = unknown");
	break;
}

