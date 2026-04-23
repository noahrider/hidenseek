///@description Write a message with a writer object
function scr_write(messageID = 0, text = "", textRender = -1) {
	global.mid = messageID;
	if (text != "") global.msg[0] = text;
	if (textRender != -1) global.txr = textRender;
	
	writer = instance_create(0, 0, obj_dialoguer);
	writer.lock = 0;
	
	return writer;
}

function scr_instawrite(messageID = 0, text = "", textRender = -1) {
	global.mid = messageID;
	if (text != "") global.msg[0] = text;
	if (textRender != -1) global.txr = textRender;
	
	writer = instance_create(0, 0, obj_dialoguer);
	writer.lock = 0;
	
	return writer;
}

///@description Localize a string.
///@argument {String} defaultString The default English string.
///@argument {String} jsonKey The JSON key to search for.
function locstring(defaultString, jsonKey) {
	return scr_gettext(defaultString, jsonKey);
}

///@description Localize a string, with given arguments.
///@argument {String} defaultString The default English string.
///@argument {String} jsonKey The JSON key to search for.
///@argument {Any} [...] Any extra arguments. Keep in mind that the argument at the nth position will replace the text "{:n}".
function locstringargs(defaultString, jsonKey = "") {
	var argcount = argument_count;
	var offset = 2;
	var args;
	
	for (var i = 0; i < argcount; i++) {
		args[i] = argument[i];
	}
	
	if (global.language != "en") {
		defaultString = scr_gettext(defaultString, jsonKey);
	}
    
	defaultString = scr_formatstring(defaultString, args, offset);
	
	return locstring(defaultString, jsonKey);
}

function scr_setmsg(defaultString, jsonKey = "") {
	for (var i = 0; i < 48; i++)
		global.msg[i] = "%%";
	
	global.msgno = 0;
	global.msg[global.msgno] = scr_gettext(defaultString, jsonKey);
}

function scr_nextmsg(defaultString, jsonKey = "") {
	global.msgno++;
	global.msg[global.msgno] = scr_gettext(defaultString, jsonKey);
}

///@description Set the first message in the global.msg array, with given arguments
///@argument {String} defaultString The default English string.
///@argument {String} jsonKey The JSON key to search for.
///@argument {Any} [...] Any extra arguments. Keep in mind that the argument at the nth position will replace the text "{:n}". Starts indexing at 1.
function scr_setmsgargs(defaultString, jsonKey = "") {
	var argcount = argument_count;
	var offset = 2;
	var args;
	
	for (var i = 0; i < argcount; i++) {
		args[i] = argument[i];
	}
	
	if (global.language != "en") {
		defaultString = scr_gettext(defaultString, jsonKey);
	}
    
	defaultString = scr_formatstring(defaultString, args, offset);
	
	scr_setmsg(defaultString);
}
///@description Set the next message in the global.msg array, with given arguments
///@argument {String} defaultString The default English string.
///@argument {String} jsonKey The JSON key to search for.
///@argument {Any} [...] Any extra arguments. Keep in mind that the argument at the nth position will replace the text "{:n}". Starts indexing at 1.
function scr_nextmsgargs(defaultString, jsonKey = "") {
	var argcount = argument_count;
	var offset = 2;
	var args;
	
	for (var i = 0; i < argcount; i++) {
		args[i] = argument[i];
	}
	
	if (global.language != "en") {
		defaultString = scr_gettext(defaultString, jsonKey);
	}
    
	defaultString = scr_formatstring(defaultString, args, offset);
	
	scr_nextmsg(defaultString);
}

function scr_settxr(txr = "") {
	var letter = "X";
    txr = string_lower(txr);
    if (txr == "") letter = "X";
    if (txr == "noone") letter = "X";
    if (txr == "echo") letter = "E";
    if (txr == "alyn") letter = "A";
	global.msgno++;
    global.msg[global.msgno] = "#T" + letter + "%";
}