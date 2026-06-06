if (button_pressed(KEY.UP)) {
	selected -= 1;
	if (selected == -1) selected = (optionno - 1);
}
if (button_pressed(KEY.DOWN)) {
	selected += 1;
	if (selected == (optionno)) selected = 0;
}
if (button_pressed(KEY.CONFIRM)) {
	if (selected == 0) {
		room_goto_next();
	}
	if (selected == 1) {
		room_goto(room_server);
	}
	if (selected == 2) {
		global.clname = get_string("Please enter your name.\n(leave blank for a random name)", "");
		if (global.clname == "") {
			for (var i = 0; i < irandom_range(4, 12); i++) {
				global.clname += chr(irandom_range(33, 126));
			}
		}
		if (strlen(global.clname) > 12) {
			global.clname = string_delete(global.clname, 13, strlen(global.clname) - 12);
		}
		instance_create_depth(0, 0, -999, obj_client);
		//instance_destroy();
	}
	if (selected == 3) {
		game_end();
	}
}