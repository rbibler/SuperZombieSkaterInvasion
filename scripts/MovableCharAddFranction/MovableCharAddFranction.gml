xSpd += xFraction;
ySpd += yFraction;

xFraction = xSpd - (floor(abs(xSpd)) * sign(xSpd));
xSpd -= xFraction;
yFraction = ySpd - (floor(abs(ySpd)) * sign(ySpd));
ySpd -= yFraction;