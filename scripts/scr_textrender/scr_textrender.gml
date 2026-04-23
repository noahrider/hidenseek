function scr_textrender(txr) {
	if (txr != 0) global.txr = txr;
	switch(global.txr) {
		case 4: //main overworld
			hspacing = 8;
			vspacing = 16;
			writex = x + 12;
			writey = y + 6;
			textfont = fnt_main;
			textcolor = c_white;
			textsound = snd_txt1;
			textspeed = 1;
			textshake = 0;
			maxchar = 34;
			break;
	}
}