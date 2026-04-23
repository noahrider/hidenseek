function scr_draw_my_name(xx, yy, clientID) {
	var reset = draw_get_color();
	
	draw_set_color(c_white);
	if (global.player[clientID].host == true) draw_set_color(c_yellow);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	
	draw_text(xx, yy, global.player[clientID].info.name);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	draw_set_color(reset);
}