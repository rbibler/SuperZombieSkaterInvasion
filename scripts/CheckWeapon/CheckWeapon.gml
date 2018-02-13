/// Checks if the player can fire a weapon. If so, fires it.
/// @arg shootPressed
/// @arg shootReleased


var shootPressed = argument0;
var shootReleased = argument1;

var weapon = oWeapon;
var cooldown = weapon.cooldown;
var notTooMuchAmmo = weapon.ammoOnScreen < weapon.maxInFlight;
var cooldownCool = cooldown <= 0;
var immediate = weapon.immediate;

var canShoot = immediate ? shootPressed : shootReleased;

if(canShoot && notTooMuchAmmo && cooldownCool) {
	var proj = instance_create_layer(x, y, "Collidable_Objects", weapon.projectile);	
	proj.right = right;
	proj.left = left;
	proj.up = up;
	proj.down = down;
	weapon.ammoOnScreen++;
	weapon.cooldown = weapon.fireRate;
}