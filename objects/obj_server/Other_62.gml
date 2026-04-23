//get the ip address of our computer for connection
if (async_load[? "id"] == ipGet) {
	var status = async_load[? "status"];
	var result = (status == 0) ? async_load[? "result"] : "null";
	var json = json_decode(result);
	//global.svip = json[? "ip"];
}