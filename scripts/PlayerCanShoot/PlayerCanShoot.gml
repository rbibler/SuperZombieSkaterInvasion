var notTooMuchAmmo = ammoOnScreen < ammoMax;
var cooldownCool = cooldown <= 0;

return notTooMuchAmmo && cooldownCool;