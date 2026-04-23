function scr_debugmessage(title) {
	if (!global.debug) return noone;
	var message = instance_create_depth(5, 5, -9999, obj_debugmessage, {message: title});
	return message;
}