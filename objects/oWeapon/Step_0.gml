/// @description Insert description here
// You can write your code in this editor
if(!weaponCool && weaponActive) {
	cooldownCounter--;
}
if(cooldownCounter == 0) {
	weaponCool = true;
}

