/// Script checks to see if user can fire and then fires
/// @arg weapon

var weapon = argument0;
if(weapon.weaponActive && weapon.weaponCool) {
	if(shootNewPress) {
		if(weapon.ammoOnScreen < weapon.maxAmmoOnScreen) {
			var proj = instance_create_layer(x, y, "ProjectileLayer", weapon.projectile);
			with(weapon) {
				currentAmmo--;
				cooldownCounter = cooldownPeriod;
				ammoOnScreen++;
			}
		}
	}
}