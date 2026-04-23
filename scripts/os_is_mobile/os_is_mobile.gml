function os_is_mobile() {
	if (os_type == os_ios) return true;
	if (os_type == os_android) return true;
	
	return false;
}