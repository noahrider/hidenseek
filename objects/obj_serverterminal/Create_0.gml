visible = false;

//each command will have its name as the name of the struct
//for exampe, the clients command is in there bitch
commands = {
	help: {
		desc: "List of all commands.",
		usage: "help [command]",
		callback: function(command = ""){
			var cmdStruct = other.commands;
			if (command != "") {
				if (CommandExists(command)) {
					var cmd = struct_get(cmdStruct, command);
					printf("{:1} ({:2}) - {:3}", commandName, cmd.usage, cmd.desc);
				} else {
					printf("WARNING!! Command not found: {:1}", string_lower(command));
				}
			} else {
				for (var i = 0; i < variable_instance_names_count(cmdStruct); i++) {
					var commandName = variable_instance_get_names(cmdStruct)[i];
					var cmd = struct_get(cmdStruct, commandName);
					
					printf("{:1} ({:2}) - {:3}", commandName, cmd.usage, cmd.desc);
				}
			}
		},
	},
	clients: {
		desc: "Gets the list of connected clients, and their IDs.",
		usage: "clients",
		callback: function(){
			
		},
	},
	host: {
		desc: "Set a specific user as the host of the server.",
		usage: "host username",
		callback: function(username){
			
		},
	},
};

messages = [];
messageSeverity = [];

input = "";
messageSpacing = 12;

terminalOffY = (display_get_gui_height() - 5);

CommandExists = function(commandName) {
	return struct_exists(commands, string_lower(commandName));
}