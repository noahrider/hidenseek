if (touched == 1) {
	touched = 2;
	global.action = 1;
	scr_setmsg("* Are you sure you want to #cGleave this lobby#cX?", "");
	scr_write();
}

if (touched == 2 && !instance_exists(obj_writer)) {
	touched = 3;
	global.action = 0;
	obj_atlas.y += 6;
	//TODO: check global.choice, disconnect if 0
}