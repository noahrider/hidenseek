if (!global.debug) return;

draw_set_font(fnt_main);

draw_set_color(c_ltgray);
draw_set_halign(fa_right);

draw_text(635, 005, $"server information");
draw_text(635, 025, $"port {global.svport}");
draw_text(635, 045, $"clients: {ds_list_size(sockets)}/{MAX_PLAYERS}");

draw_set_color(c_white);

if (room == room_server) {
	draw_set_font(fnt_mainb);
	draw_set_halign(fa_center);
	
	draw_text(320, 50, $"IP Address: {global.svip}");
	draw_text(320, 100, $"Port: {global.svport}");
	
	draw_set_font(fnt_main);
}

draw_set_halign(fa_left);