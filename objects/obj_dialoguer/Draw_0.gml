xx = camerax();
yy = cameray();

if (!instance_exists(obj_atlas)) return;

if (!surface_exists(shineSurf)) shineSurf = surface_create(296, 303);
surface_set_target(shineSurf);
draw_clear_alpha(0, 0);

shineX += 4;
var shine = merge_color(color, c_white, 0.27);
draw_line_width_color(2, 0, 2, 303, 1, shine, shine);
draw_line_width_color(4, 0, 4, 303, 2, shine, shine);

surface_reset_target();

if (!surface_exists(textbox)) textbox = surface_create(296, 68);
surface_set_target(textbox);
draw_clear_alpha(0, 0);

draw_rectangle_solid(0, 0, 296, 68, c_black);
draw_rectangle_solid(1, 1, 295, 67, color);
draw_surface_ext(shineSurf, shineX, -10, 1, 1, -45, c_white, 1);
draw_rectangle_solid(1, 1, 296, 68, c_black, 1);

draw_rectangle_solid(3, 3, 293, 65, c_black);
surface_reset_target();

if (obj_atlas.y > yy+128) { //top
	draw_surface(textbox, xx + 12, yy + 12);
} else { //bottom
	draw_surface(textbox, xx + 12, yy + 162);
}