/// @description  Draw text with a certain HAlign and VAlign.
/// @parameter {Real} x The x coordinate of the drawn string.
/// @parameter {Real} y The y coordinate of the drawn string.
/// @parameter {String} string The string to draw.
/// @parameter {Constant.HAlign} [halign] The horizantal alignment of the drawn string.
/// @parameter {Constant.VAlign} [valign] The vertical alignment of the drawn string.
function draw_text_align(x, y, string, halign = fa_center, valign = fa_top) {
	var hreset = draw_get_halign();
	var vreset = draw_get_valign();
	
	draw_set_halign(halign);
	draw_set_valign(valign);
	
	draw_text(x, y, string);
	
	draw_set_halign(hreset);
	draw_set_valign(vreset);
}