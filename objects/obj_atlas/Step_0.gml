switch (global.facing) {
	case 0: sprite_index = spr_charad; break;
	case 1: sprite_index = spr_charar; break;
	case 2: sprite_index = spr_charau; break;
	case 3: sprite_index = spr_charal; break;
}

moving = false;
if (movement && window_has_focus()) {
	mx = 0;
	my = 0;
	
	if (button_held(KEY.DOWN)) {
		global.facing = 0;
		moving = true;
		if (CheckCollision(x, y + moveSpeed) && !button_held(KEY.UP)) my = moveSpeed;
	}
	if (button_held(KEY.RIGHT)) {
		global.facing = 1;
		moving = true;
		if (CheckCollision(x + moveSpeed, y) && !button_held(KEY.LEFT)) mx = moveSpeed;
	}
	if (button_held(KEY.UP)) {
		global.facing = 2;
		moving = true;
		if (CheckCollision(x, y + -moveSpeed)) my = -moveSpeed;
	}
	if (button_held(KEY.LEFT)) {
		global.facing = 3;
		moving = true;
		if (CheckCollision(x + -moveSpeed, y)) mx = -moveSpeed;
	}
	
	x += mx;
	y += my;
}

if (cutscene) {
	
} else if (moving) {
	image_speed = 1;
} else {
	image_speed = 0;
	image_index = 0;
}

if (button_pressed(KEY.CONFIRM)) event_user(8);
	
with (collision_object(obj_triggerable, false, false)) {
	if (touched == 0) touched = 1;
}

scr_depth();

if (moving || forceMovePacket) {
	forceMovePacket = false;
	cl_send_packet(PacketID.Movement, [
		[buffer_string, global.clname],
		[buffer_u8, scr_colorid(color)],
		[buffer_string, room_get_name(room)],
		[buffer_u16, x],
		[buffer_u16, y],
		[buffer_u8, global.facing],
	]);
}