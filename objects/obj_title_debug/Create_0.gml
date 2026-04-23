if (!global.debug) {
	room_goto_next();
	return;
}

options = [];

array_push(options, "Start Game");
array_push(options, "Host Server");
array_push(options, "Join Server");
array_push(options, "Terminate");

optionno = array_length(options);
selected = 0;