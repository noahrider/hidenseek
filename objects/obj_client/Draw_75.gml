if (!global.debug) return;

draw_set_halign(fa_right);
draw_set_color(c_ltgray);

draw_text(635, 005, $"client information");
draw_text(635, 025, $"ID: {(userID == -1) ? "???" : userID}");
draw_text(635, 045, $"ping: {ping}ms");

draw_set_halign(fa_left);
draw_set_color(c_white);