global.clientID = userID;

if (image_alpha < 1) {
	image_alpha += 0.05;
} else if (!triedConnection) {
	triedConnection = true;
	ClientSetup();
	if (connection == -1) {
		
		return;
	}
	return;
}

//disconnect after 5 seconds
if (current_time - lastPing > 5000) {
	show_message("Disconnect from server");
	game_end();
}






