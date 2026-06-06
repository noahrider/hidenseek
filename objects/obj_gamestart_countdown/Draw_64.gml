draw_set_font(fnt_main);

var timeleft = string(alarm[0] / 30);
if (strlen(timeleft) == 1) timeleft += ".00";

if (!surface_exists(surface)) surface = surface_create(string_width(timeleft), string_height(timeleft));
surface_resize(surface, string_width(timeleft), string_height(timeleft));
surface_set_target(surface);
draw_clear_alpha(0, 0);
draw_text(0, 0, timeleft);
surface_reset_target();

var xx = (320 - ((surface_get_width(surface) * image_xscale) / 2));
var yy = (240 - ((surface_get_height(surface) * image_yscale) / 2));

draw_surface_ext(surface, xx, yy, image_xscale, image_yscale, 0, c_white, 1);