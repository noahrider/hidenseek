var event = async_load[? "type"];

var userBuffer = async_load[? "buffer"];
var userSocket = async_load[? "socket"];
var userID;

switch (event) {
	case network_type_connect:
		break;
	case network_type_disconnect:
		userID = ds_list_find_index(sockets, userSocket);
		ds_list_delete(sockets, userID);
		if (global.player[userID].host == true) {
			for (var i = 0; i < MAX_PLAYERS; i++) {
				
			}
		}
		printf("Disconnect from client (ID: {:1})", userID);
		break;
	case network_type_data:
		userSocket = async_load[? "id"];
		if (buffer_get_size(userBuffer)) {
			sv_get_packet(userBuffer, userSocket);
		}
		break;
}
