function sv_get_packet(buffer, socket) {
	buffer_seek(buffer, buffer_seek_start, 0);
	var messageID = buffer_read(buffer, buffer_u8);
	var userID = buffer_read(buffer, buffer_u8);
	
	var name;
	
	switch (messageID) {
		case PacketID.Ping:
			network_send_packet(socket, buffer, buffer_get_size(buffer));
			break;
		case PacketID.JoinServer:
			ds_list_add(sockets, socket);
			userID = ds_list_size(sockets);
			
			name = buffer_read(buffer, buffer_string);
			var requestedColorID = buffer_read(buffer, buffer_u8);
			
			if (strlen(name) > 12) {
				printf("WARNING!! Connector name length ({:1}) > 12. Trimming..", strlen(name));
				name = string_delete(name, 13, strlen(name) - 12);
			}
			
			global.player[userID].info.name = name;
			
			printf("New client \"{:1}\" connection ({:2})", name, userID);
			
			//if nobody is the host, make this random ass guy the host xd
			if (!array_find_index(global.player, function(e){return (e.host == true)})) {
				global.player[userID].host = true;
				printf("Setting user {:1} ({:2}) to host", name, userID);
			}
			
			if (scr_color_is_taken(global.colors[requestedColorID])) {
				do {
					requestedColorID = irandom(array_length(global.colors) - 1);
				} until (!scr_color_is_taken(global.colors[requestedColorID]));
			}
			
			global.player[userID].info.color = global.colors[requestedColorID];
			
			
			var _charax = irandom_range(20, 274);
			var _charay = irandom_range(100, 176);
			
			buffer_seek(buff, buffer_seek_start, 0);
			buffer_write(buff, buffer_u8, PacketID.NewConnection);
			buffer_write(buff, buffer_u8, userID);
			buffer_write(buff, buffer_string, name);
			buffer_write(buff, buffer_u8, requestedColorID);
			buffer_write(buff, buffer_bool, false);
			
			
			for (var i = 0; i < ds_list_size(sockets); i++) {
				if (i == (userID + 1)) continue;
				network_send_packet(sockets[| i], buff, buffer_tell(buff));
			}
			buffer_seek(buff, buffer_seek_start, buffer_tell(buff) - 1);
			buffer_write(buff, buffer_bool, true); //if YOU are the connectee
			network_send_packet(socket, buff, buffer_tell(buff));
			
			buffer_seek(buff, buffer_seek_start, 0);
			buffer_write(buff, buffer_u8, PacketID.HostChange);
			buffer_write(buff, buffer_u8, array_find_index(global.player, function(e){return (e.host == true)}));
			sv_send_broadcast_packet(buff);
			break;
		case PacketID.Movement:
			name = buffer_read(buffer, buffer_string);
			var colorID = buffer_read(buffer, buffer_u8);
			var roomName = buffer_read(buffer, buffer_string);
			var xx = buffer_read(buffer, buffer_u16);
			var yy = buffer_read(buffer, buffer_u16);
			var facing = buffer_read(buffer, buffer_u8);
			if (xx < 0) {
				buffer_seek(buffer, buffer_seek_start, string_length(roomName) + 2);
				buffer_write(buffer, buffer_u16, 0);
			}
			if (yy < 0) {
				buffer_seek(buffer, buffer_seek_start, string_length(roomName) + 3);
				buffer_write(buffer, buffer_u16, 0);
			}
			sv_send_broadcast_packet(buffer);
			break;
		case PacketID.Message:
			name = buffer_read(buffer, buffer_string);
			var message = buffer_read(buffer, buffer_string);
			
			if (strlen(message) > 140) {
				message = string_delete(name, 141, strlen(message) - 140);
			}
			sv_send_broadcast_packet(buffer);
			break;
		default:
			sv_send_broadcast_packet(buffer);
			break;
	}
}