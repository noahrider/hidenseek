buff = buffer_create(1024, buffer_fixed, 1);

ini_open("config.ini");
preferredColorID = ini_read_real("General", "preferredColorID", irandom(array_length(global.colors) - 1));
ini_close();

ClientSetup = function() {
	client = network_create_socket(network_socket_tcp);
	connection = network_connect(client, global.svip, global.svport);
	
	buffer_seek(buff, buffer_seek_start, 0);
	buffer_write(buff, buffer_u8, PacketID.JoinServer);
	buffer_write(buff, buffer_u8, userID);
	buffer_write(buff, buffer_string, global.clname);
	buffer_write(buff, buffer_u8, preferredColorID);
	
	network_send_packet(client, buff, buffer_tell(buff));
	
	lastPing = current_time;
}
client = -1;
connection = -1;

image_alpha = 0;
triedConnection = false;
connected = false;
ping = 0;
userID = -1;
lastPing = current_time;