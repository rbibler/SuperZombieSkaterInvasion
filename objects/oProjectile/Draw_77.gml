/// @description Insert description here
// You can write your code in this editor
//if(x >= room_width || x < 8)
//{
	//instance_destroy();
	
//}
if(!on_screen()) {
	instance_destroy();
	with(parentWeapon) {
		ammoOnScreen--;
	}
}


