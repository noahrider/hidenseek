///@description Create the server

server = network_create_server(network_socket_tcp, global.svport, MAX_PLAYERS);
buff = buffer_create(1024, buffer_fixed, 1);
sockets = ds_list_create();