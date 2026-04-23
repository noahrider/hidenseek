draw_self();

draw_set_color(c_white);

var shirt = -1;
switch (sprite_index) {
	case spr_charad: shirt = spr_charad_shirt; break;
	case spr_charar: shirt = spr_charar_shirt; break;
	case spr_charau: shirt = spr_charau_shirt; break;
	case spr_charal: shirt = spr_charal_shirt; break;
}

draw_sprite_ext(shirt, image_index, x, y, image_xscale, image_yscale, 0, color, image_alpha);

scr_draw_my_name(x + (sprite_width / 2), y - 5, clientID);