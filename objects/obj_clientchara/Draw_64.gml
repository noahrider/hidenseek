draw_set_color(c_white);

draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
var guix = ((x - camerax()) / (cameraw() * display_get_gui_width()));
var guiy = ((y - cameray()) / (camerah() * display_get_gui_height()));
draw_text(guix + sprite_width, guiy - 5, global.player[clientID].info.name);
draw_set_halign(fa_left);
draw_set_valign(fa_top);