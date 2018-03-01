image_index = 1;

var xLocation = x;
var yLocation = y;
var sylState = 0;
var sylXDir = 0;
var sylXDirGround = 0;


var initialDirection = random_range(-1, 1);
if(initialDirection < 0) {
	initialDirection = -1;
} else {
	initialDirection = 1;
}


if(spawnDir == 1) {
	sylState = FALLING;
	sylXDir = 0;
	sylXDirGround = initialDirection;
	yLocation = y + 16;
} else {
	sylState = MOVING;
	sylXDir = initialDirection;
	sylXDirGround = sylXDir;
}

var sylvester = instance_create_layer(xLocation, yLocation, "EnemyLayer", oSylvesterSlime);
sylvester.xDirAtJump = sylXDirGround;
sylvester.xDir = sylXDir;
sylvester.state = sylState;
sylvester.normalXMax = spawnXSpd;