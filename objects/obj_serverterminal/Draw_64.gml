var yy = (terminalOffY - messageSpacing);

draw_set_font(fnt_main);

draw_set_color(c_white);

for (var i = 0; i < array_length(messages); i++) {
	if (messageSeverity[i] == "none") draw_set_color(c_white);
	if (messageSeverity[i] == "warning") draw_set_color(c_alred);
	
	draw_text(5, yy + (messageSpacing * i), messages[i]);
	
	draw_set_color(c_white);
}
draw_text(5, yy + (messageSpacing * array_length(messages)), $"$ {input}");