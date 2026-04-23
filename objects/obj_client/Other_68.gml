var event = async_load[? "type"];

var userBuffer = async_load[? "buffer"];
var userSocket = async_load[? "socket"];

switch (event) {
	case network_type_data:
		userSocket = async_load[? "id"];
		cl_get_packet(userBuffer, userSocket);
		break;
}