///@description With this function you can draw a rectangle with a solid color.
function draw_rectangle_solid(x1, y1, x2, y2, color = draw_get_color(), outline = false) {
	draw_rectangle_color(x1, y1, x2, y2, color, color, color, color, outline);
};