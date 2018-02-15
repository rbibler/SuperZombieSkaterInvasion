middleGrounded = InFloor(tilemap,x, bbox_bottom + 1) >= 0;
leftGrounded = InFloor(tilemap, bbox_left, bbox_bottom + 1) >= 0;
rightGrounded = InFloor(tilemap, bbox_right, bbox_bottom + 1) >= 0;

grounded = middleGrounded || leftGrounded || rightGrounded;