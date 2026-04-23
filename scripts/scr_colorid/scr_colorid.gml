function scr_colorid(color) {
	try {
		return array_get_index(global.colors, color);
	} catch (_ex) {
		return 0;
	}
}