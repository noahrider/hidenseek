function cl_get_packet(buffer, socket) {
	buffer_seek(buffer, buffer_seek_start, 0);
	var messageID = buffer_read(buffer, buffer_u8);
	var userID = buffer_read(buffer, buffer_u8);
	
	if (userID > MAX_PLAYERS) {
		if (messageID != PacketID.Ping) {
			printf("Invalid packet recieved (Type: {:1}) ({:2})", messageID, userID);
			return;
		} else userID = 0;
	}
	if (global.player[userID].connected == false) {
		global.player[userID].connected = true;
	}
	
	var colorID;
	
	switch (messageID) {
		case PacketID.Ping:
			var time = buffer_read(buffer, buffer_u32);
			ping = (current_time - time);
			buffer_seek(buff, buffer_seek_start, 0);
			buffer_write(buff, buffer_u8, PacketID.Ping);
			buffer_write(buff, buffer_u8, userID);
			buffer_write(buff, buffer_u32, current_time);
			
			network_send_packet(client, buff, buffer_tell(buff));
			lastPing = current_time;
			break;
		case PacketID.NewConnection:
			var name = buffer_read(buffer, buffer_string);
			colorID = buffer_read(buffer, buffer_u8);
			var myself = buffer_read(buffer, buffer_bool);
			
			global.player[userID].connected = true;
			global.player[userID].info.name = name;
			
			if (colorID > array_length(global.colors)) {
				printf("WARNING!! Shirt color is outside range ({:1} > {:2})", colorID, array_length(global.colors));
				colorID = 0;
				global.player[userID].info.color = DEFAULT_SHIRT_COLOR;
			} else {
				global.player[userID].info.color = global.colors[colorID];
			}
			
			with (obj_atlas) {
				cl_send_packet(PacketID.Movement, [
					[buffer_string, global.clname],
					[buffer_u8, scr_colorid(color)],
					[buffer_string, room_get_name(room)],
					[buffer_u16, x],
					[buffer_u16, y],
					[buffer_u8, global.facing],
				]);
			}
			
			if (!myself && userID != obj_client.userID) {
				printf("New player in room (ID: {:1})", userID);
				if (room == room_lobby) {
					var chara = instance_create_depth(0, 0, 0, obj_clientchara);
					chara.clientID = userID;
					chara.color = global.colors[colorID];
				}
			} else {
				printf("Connected! (ID: {:1})", userID);
				obj_client.userID = userID;
				obj_client.alarm[0] = 4;
				
				global.clientID = userID;
				
				//cl_send_packet(PacketID.Movement, [
					//[buffer_string, name],
					//[buffer_u8, scr_colorid(colorID)],
					//[buffer_string, room_get_name(room)],
					//[buffer_u16, _charax],
					//[buffer_u16, _charay],
					//[buffer_u8, 0],
				//]);
	
				with (obj_client) {
					buffer_seek(buff, buffer_seek_start, 0);
					buffer_write(buff, buffer_u8, PacketID.Ping);
					buffer_write(buff, buffer_u8, userID);
					buffer_write(buff, buffer_u32, current_time);
					
					network_send_packet(client, buff, buffer_tell(buff));
					lastPing = current_time;
				}
			}
			break;
		case PacketID.Movement:
			if (userID == obj_client.userID) return;
			name = buffer_read(buffer, buffer_string);
			colorID = buffer_read(buffer, buffer_u8);
			var roomName = buffer_read(buffer, buffer_string);
			var xx = buffer_read(buffer, buffer_u16);
			var yy = buffer_read(buffer, buffer_u16);
			var _facing = buffer_read(buffer, buffer_u8);
			
			var roomx = asset_get_index(roomName);
			
			global.player[userID].lastKnownPosition = {
				x: xx,
				y: yy,
				room: roomx,
				facing: _facing,
			};
			global.player[userID].info.name = name;
			
			if (colorID > array_length(global.colors)) {
				printf("WARNING!! Shirt color is outside range ({:1} > {:2})", colorID, array_length(global.colors));
				colorID = 0;
				global.player[userID].info.color = DEFAULT_SHIRT_COLOR;
			} else {
				global.player[userID].info.color = global.colors[colorID];
			}
			
			if (roomx != room) return;
			
			with (obj_clientchara) {
				if (clientID == userID) {
					x = xx;
					y = yy;
					facing = _facing;
					color = global.player[clientID].info.color;
				}
			}
			break;
		case PacketID.InfoChange:
			name = buffer_read(buffer, buffer_string);
			colorID = buffer_read(buffer, buffer_u8);
			
			global.player[userID].info.name = name;
			global.player[userID].info.color = global.colors[colorID];
			break;
		case PacketID.CustomPlayerInfo:
			var jsonString = buffer_read(buffer, buffer_string);
			
			var json = json_parse(jsonString);
			var keys = variable_struct_get_names(json);
			
			for (var i = 0; i < array_length(keys); i++) {
				struct_set(global.player[userID], keys[i], json[keys[i]]);
			}
			break;
		case PacketID.HostChange:
			for (var i = 0; i < MAX_PLAYERS; i++) {
				global.player[i].host = false;
			}
			global.player[userID].host = true;
			break;
		case PacketID.Event:
			var eventID = buffer_read(buffer, buffer_u8);
			switch(eventID) {
				case EventID.GameStart:
					var starting = buffer_read(buffer, buffer_bool);
					if (starting) {
						
					} else {
						//if we're here, that means it was cancelled (someone left, or by the hand of the host, it was stopped)
					}
					break;
				case EventID.NewTagger:
					break;
				default:
					printf("Invalid event packet recieved ({:1})!", eventID);
					break;
			}
			break;
		default:
			printf("Invalid packet recieved ({:1})!", messageID);
			break;
	}
}