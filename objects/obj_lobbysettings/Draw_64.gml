if (interact != 1) return;
	
draw_set_color(c_white);


selected = menu_select_2D(selected, 1, 4);

for (var i = 0; i < 12; i++) {
	if (selected == i) draw_set_color(c_select);
	draw_text(20,20+(20*i),"hi");
	draw_set_color(c_white);
}