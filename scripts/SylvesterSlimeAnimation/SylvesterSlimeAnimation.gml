switch(state) {
	case MOVING:
		if(image_index >= 2) {
			image_index = 0;
		}
	break;
	case JUMPING:
	case FALLING:
		if(grounded) {
			state = MOVING;
			jumpPressed = false;
		}
	break;
}