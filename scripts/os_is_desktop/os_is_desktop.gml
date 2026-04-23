function os_is_desktop() {
	if (os_type == os_windows) return true;
	if (os_type == os_macosx) return true;
	if (os_type == os_linux) return true;
	
	return false;
}