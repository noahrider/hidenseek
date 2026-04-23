if ((clientID > 0 && clientID == obj_client.userID) || clientID == 0) {
	instance_destroy();
} else {
	color = global.player[clientID].info.color;
}