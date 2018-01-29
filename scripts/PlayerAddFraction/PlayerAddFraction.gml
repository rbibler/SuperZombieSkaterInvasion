xSpd += x_fraction;
ySpd += y_fraction;

x_fraction = xSpd - (floor(abs(xSpd)) * sign(xSpd));
xSpd -= x_fraction;
y_fraction = ySpd - (floor(abs(ySpd)) * sign(ySpd));
ySpd -= y_fraction;