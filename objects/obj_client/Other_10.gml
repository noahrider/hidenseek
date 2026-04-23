///@description Create instances for all current players

for (var i = 0; i < MAX_PLAYERS; i++) {
	if (!global.player[i].connected) continue;
	if (i == userID) continue;
	
	var position = global.player[i].lastKnownPosition;
	var chara = instance_create_depth(position.x, position.y, 0, obj_clientchara);
	chara.clientID = i;
	chara.color = global.player[i].info.color;
}