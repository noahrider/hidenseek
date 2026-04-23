function scr_color_is_taken(color) {
	for (var i = 0; i < MAX_PLAYERS; i++) {
		if (global.player[i].info.color == color) return true;
	}
	return false;
}