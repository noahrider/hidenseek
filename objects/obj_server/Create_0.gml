event_user(0); //creates the server

ipGet = http_get("https://api.ipify.org/?format=json");

terminal = instance_create_depth(0, 0, depth - 1, obj_serverterminal);

//"wait for connector information", holds the client ID of the person connecting
waitForConnInfo = -1;