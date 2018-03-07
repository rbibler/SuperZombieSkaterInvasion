/// @description Insert description here
// You can write your code in this editor
//with(other) {
	//script_execute(takeMeleeHitScript, other.hitPoints);
//}

with(other) {
		xDir = sign(x - other.x);
		if(xDir == 0) {
			xDir = 1;
		}
		xSpd = 15 * xDir;
		if(!grounded) {
			ySpd = -5;
		}
	}