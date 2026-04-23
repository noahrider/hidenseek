draw_self();
var shirt = -1;
switch (sprite_index) {
	case spr_charad: shirt = spr_charad_shirt; break;
	case spr_charar: shirt = spr_charar_shirt; break;
	case spr_charau: shirt = spr_charau_shirt; break;
	case spr_charal: shirt = spr_charal_shirt; break;
}

draw_sprite_ext(shirt, image_index, x, y, image_xscale, image_yscale, 0, color, image_alpha);

scr_draw_my_name(x + (sprite_width / 2), y - 5, global.clientID);

if (global.debug) {
	if (button_pressed(KEY.CONFIRM)) {
		draw_set_color(c_red);
		switch (global.facing) {
			case 0: draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom + intextend, true); break; //down
			case 1: draw_rectangle(bbox_left, bbox_top, bbox_right + intextend, bbox_bottom, true); break; //right
			case 2: draw_rectangle(bbox_left, bbox_top - intextend, bbox_right, bbox_bottom, true); break; //up
			case 3: draw_rectangle(bbox_left - intextend, bbox_top, bbox_right, bbox_bottom, true); break; //left
		}
	}
	draw_set_color(c_white);
}