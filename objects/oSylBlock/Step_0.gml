/// @description Insert description here
// You can write your code in this editor
if(!willPop || isExploded) {
	return;
}

if(!isTriggered) {
	if(playerTrigger) {
		if(on_screen()) {
			isTriggered = abs(oPlayer.x - x) <= 25;
		}
	} else {
		isTriggered = on_screen();
	}
} else {
	if(frameCount - lastCheckTime >= 60) {
		lastCheckTime = frameCount;
		seconds++;
		if(seconds >= timeTillPop) {
			isExploded = true;
			SpawnSlyvester();
		}
	}
}

frameCount++;