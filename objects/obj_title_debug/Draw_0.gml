for (var i = 0; i < optionno; i++) {
	if (selected == i) draw_set_color(c_select);
	draw_text(120, 80 + (16 * i), options[i]);
	draw_set_color(c_white);
}