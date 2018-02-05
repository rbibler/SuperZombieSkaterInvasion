/// @description Insert description here
// You can write your code in this editor

// Slingshot
weapons[0] = ds_map_create();
ds_map_add(weapons[0], "Sprite", sSkaterSlingShot);
ds_map_add(weapons[0], "Sprite_Idle", sSkaterSlingShotIdle);
ds_map_add(weapons[0], "Fire_Rate", 30);
ds_map_add(weapons[0], "Hit_Power", 5);
ds_map_add(weapons[0], "Max_In_Flight", 5);
ds_map_add(weapons[0], "Immediate", true);
ds_map_add(weapons[0], "Projectile", oProjRock);

// Teleporter
// Slingshot
weapons[1] = ds_map_create();
ds_map_add(weapons[1], "Sprite", sSkaterSlingShot);
ds_map_add(weapons[1], "Sprite_Idle", sSkaterSlingShotIdle);
ds_map_add(weapons[1], "Fire_Rate", 120);
ds_map_add(weapons[1], "Hit_Power", 0);
ds_map_add(weapons[1], "Max_In_Flight", 1);
ds_map_add(weapons[1], "Immediate", true);
ds_map_add(weapons[1], "Projectile", oTeleporterBall);

currentWeapon = 0;
ammoOnScreen = 0;


ammo[array_length_1d(weapons) - 1] = 0;
ammo[currentWeapon] = 25;

var weaponMap = weapons[currentWeapon];
sprite = weaponMap[? "Sprite"];
spriteIdle = weaponMap[? "Sprite_Idle"];
fireRate = weaponMap[? "Fire_Rate"];
hitPower = weaponMap[? "Hit_Power"];
maxInFlight = weaponMap[? "Max_In_Flight"];
immediate = weaponMap[? "Immediate"];
projectile = weaponMap[? "Projectile"];


