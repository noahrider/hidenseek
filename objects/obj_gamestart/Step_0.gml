if (!ready) return;

if (progress == 0) {
	if (obj_atlas.x < 147) global.facing = 1;
	else if (obj_atlas.x > 147) global.facing = 3;
	else progress = 1;
	
	if (abs(obj_atlas.x - 147) <= obj_atlas.moveSpeed) progress = 1;
	
	if (global.facing == 1) obj_atlas.x += obj_atlas.moveSpeed;
	if (global.facing == 3) obj_atlas.x -= obj_atlas.moveSpeed;
}

if (progress == 1) {
	global.facing = 0;
	if (obj_atlas.y < 340) {
		obj_atlas.y += obj_atlas.moveSpeed;
	} else {
		progress = 2;
	}
}

if (progress == 2) {
	
}