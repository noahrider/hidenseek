if (lock == 1) {
	lock = 0;
	pageno++;
	text = global.msg[pageno];
	if (text == "%%") {
		instance_destroy();
		return;
	}
	event_user(2);
}