if (interact == 1) {
	if (!scr_hostisme()) {
		
	}
	
	global.action = 1;
	
	if (button_pressed(KEY.CANCEL)) {
		interact = 0;
		global.action = 0;
		return;
	}
	
	if (button_pressed(KEY.CONFIRM) && scr_hostisme()) {
		if (selected == 0) {
			
		}
	}
	
}