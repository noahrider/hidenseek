function cl_send_packet(packetID, information) {
	try {
		buffer_seek(obj_client.buff, buffer_seek_start, 0);
		buffer_write(obj_client.buff, buffer_u8, packetID);
		buffer_write(obj_client.buff, buffer_u8, obj_client.userID);
		for (var i = 0; i < array_length(information); i++) {
			var type = information[i][0];
			var value = information[i][1];
			buffer_write(obj_client.buff, type, value);
		}
		network_send_packet(obj_client.client, obj_client.buff, buffer_tell(obj_client.buff));
	} catch (_ex) {
		printf("Failed to send packet to server ({:1})!", _ex.message);
	}
}