/// Handles collisions with foreign bodies
/// @arg hitpoints

var hitPointsTaken = argument0;

currentHealth -= hitPointsTaken;
if(currentHealth <= 0) {
	instance_destroy();
}