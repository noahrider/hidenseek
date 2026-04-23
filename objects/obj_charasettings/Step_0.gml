if (interact == 1) {
	global.action = 1;
	
	if (button_pressed(KEY.CANCEL)) {
		interact = 0;
		global.action = 0;
		return;
	}
	
	
}