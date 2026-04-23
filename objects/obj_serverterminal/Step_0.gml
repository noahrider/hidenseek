if (!visible) return;
	
if (keyboard_string != "") {
	input += keyboard_string;
	keyboard_string = "";
}

if (keyboard_check_pressed(vk_backspace) && strlen(input) > 0) {
	input = string_delete(input, strlen(input), 1);
}

if (keyboard_check_pressed(vk_enter)) {
	var arguments = string_split(input, " ");
	var command = arguments[0];
	
	if (CommandExists(command)) {
		var cmd = struct_get(commands, command);
		
		method_call(cmd.callback, arguments, 1);
	} else {
		printf("WARNING!! Command not recognized: {:1}", string_lower(command));
	}
	
	input = "";
}