/// Script checks to see if user can fire and then fires
/// @arg weapon

var weapon = argument0;
if(weapon.weaponActive && weapon.weaponCool) {
	if(shootNewPress) {
		if(weapon.ammoOnScreen < weapon.maxAmmoOnScreen) {
			var proj = instance_create_layer(x + weapon.projXOffset, y + weapon.projYOffset, "ProjectileLayer", weapon.projectile);
			proj.parentWeapon = weapon;
			proj.xDir = xDir;
			if(xDir == 0) {
				proj.xDir = lastDir;
			}
			with(weapon) {
				currentAmmo--;
				cooldownCounter = cooldownPeriod;
				ammoOnScreen++;
			}
		}
	}
}