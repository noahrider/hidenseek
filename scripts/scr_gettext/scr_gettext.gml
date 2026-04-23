///@description Get a string of text from the lang.json file.
///@argument {String} defaultString The default English string.
///@argument {String} jsonKey The JSON key to search for. If this is blank (or not provided), it will fallback to the default string.
///@returns {String}
function scr_gettext(defaultString, jsonKey = "") {
	var file, buff, read, json, message;
	//if the json key is blank, that means we probably already have the localized string
	if (global.language == "en" || jsonKey == "")
		return defaultString;
	try {
		//examplez: lang_en.json / lang_ja.json / lang_ru.json
		file = $"{working_directory}lang/lang_{global.language}.json";
		if (!file_exists(file)) {
			show_message("Language file not found.");
			return "-unknown-string-";
		}
		buff = buffer_load(file);	
		read = buffer_read(buff, buffer_text);
		json = json_parse(read);
		buffer_delete(buff);
		message = json[$ jsonKey];
		if (message == "" || message == "undefined" || message = undefined) {
			message = "-unknown-string-";
		}
	} catch (_ex) {
		printf("An error occured trying to convert JSON text.");
		printf(_ex.longMessage);
		message = "-unknown-string-";
	}
	return message;
}