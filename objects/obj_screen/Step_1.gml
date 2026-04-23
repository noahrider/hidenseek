global.time++;

if (global.gamepad == -1) {
	for (var i = 0; i < KEY.COUNT; i++) {
		global.inputPressed[i] = (keyboard_check_pressed(global.inputMapKB[i][0]) || keyboard_check_pressed(global.inputMapKB[i][1]));
		global.inputHeld[i] = (keyboard_check_direct(global.inputMapKB[i][0]) || keyboard_check_direct(global.inputMapKB[i][1]));
	}
} else {
	for (var i = 0; i < KEY.COUNT; i++) {
		global.inputPressed[i] = gamepad_button_check_pressed(global.gamepad, global.inputMapGP[i]);
		global.inputHeld[i] = gamepad_button_check_pressed(global.gamepad, global.inputMapGP[i]);
	}
}

var _d_MouseInstance = collision_point(mouse_x, mouse_y, all, true, true);
if (keyboard_check_pressed(vk_control) && _d_MouseInstance) {
	var str = $"variables for object {object_get_name(_d_MouseInstance.object_index)}\n";
	for (var i = 0; i < variable_instance_names_count(_d_MouseInstance); i++) {
		var variable = variable_instance_get_names(_d_MouseInstance)[i];
		str += $"{variable} = {variable_instance_get(_d_MouseInstance, variable)}\n";
	}
	show_message(str);
}