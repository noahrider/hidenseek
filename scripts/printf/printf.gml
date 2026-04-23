///@description Print a message to the IDE and Debugination consoles, with given arguments.
///@parameter {String} message The message to print.
///@parameter {Any*} [...] Any extra arguments. Keep in mind that the argument at the nth position will replace the text "{:n}".
function printf(message) {
	var argcount = argument_count;
	var offset = 1;
	var args;
	
	for (var i = 0; i < argcount; i++) {
		args[i] = argument[i];
	}
    
	message = scr_formatstring(message, args, offset);
	
	show_debug_message(message);
	
	if (instance_exists(obj_serverterminal)) {
		with (obj_serverterminal) {
			if (string_starts_with(message, "WARNING!! ")) {
				message = string_delete(message, 1, 10);
				array_push(messageSeverity, "warning");
			} else {
				array_push(messageSeverity, "none");
			}
			array_push(messages, message);
			terminalOffY -= messageSpacing;
		}
	}
}