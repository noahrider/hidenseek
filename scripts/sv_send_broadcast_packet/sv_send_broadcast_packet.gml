function sv_send_broadcast_packet(buffer) {
	with (obj_server) {
		for (var i = 0; i < ds_list_size(sockets); i++) {
			network_send_packet(sockets[| i], buffer, buffer_tell(buffer));
		}
	}
}