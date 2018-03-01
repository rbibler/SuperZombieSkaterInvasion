var cam = view_camera[0];
var viewX = camera_get_view_x(cam);
var viewY = camera_get_view_y(cam);
var viewW = camera_get_view_width(cam);
var viewH = camera_get_view_height(cam);

return x >= viewX && x <= viewX + viewW && y >= viewY && y <= viewY + viewH;