/// @description Insert description here
// You can write your code in this editor

frameCount++;
if(frameCount - lastCheckTime >= 30) {
	lastCheckTime = frameCount;
	var chance = random_range(0, 100);
	if(chance < probability) {
		if(!isExploded) {
			isExploded = true;
			SpawnSlyvester();
		}
	}
}