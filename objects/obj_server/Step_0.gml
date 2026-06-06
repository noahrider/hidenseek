if (keyboard_check_direct(vk_control) && keyboard_check_pressed(ord("S"))) {
	with (terminal) event_user(0);
}