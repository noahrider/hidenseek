movement = false;
moving = false;
cutscene = false;
intextend = 24;
moveSpeed = 3;
forceMovePacket = false;

color = global.player[obj_client.userID].info.color;
//color = c_fuchsia;

mx = 0;
my = 0;

image_speed = 0;

CheckCollision = function(xx, yy) {
	//if (global.noclip) return true;
	return (!place_meeting(xx, yy, obj_simplesolid) && !place_meeting(xx, yy, obj_simplesolidnpc));
}