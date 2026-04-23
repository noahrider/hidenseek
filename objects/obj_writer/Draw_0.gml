///@description draw text

var xx, yy, finalcolor, n;
xx = writex;
yy = writey;
finalcolor = textcolor;

for (n = 1; n <= strpos; n++) {
	char = string_char_at(text, n);
	var char1 = string_char_at(text, n + 1);
	var char2 = string_char_at(text, n + 2);
	var char3 = string_char_at(text, n + 3);
	
	if (char == "#") {
		if (char1 == "c") {
			if (char2 == "R") finalcolor = c_alred;
			if (char2 == "G") finalcolor = c_atgreen;
			if (char2 == "B") finalcolor = c_blue;
			if (char2 == "X") finalcolor = textcolor;
			n += 2;
			continue;
		}
	}
	if (char == "|") {
		xx = writex;
		yy += vspacing;
		continue;
	}
	
	draw_set_font(textfont);
	draw_set_color(finalcolor)
	
	draw_text(xx, yy, char);
	xx += hspacing;
}