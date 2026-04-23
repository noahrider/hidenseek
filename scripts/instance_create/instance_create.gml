function instance_create(x, y, obj, var_struct = {}) {
	return instance_create_depth(x, y, object_get_depth(obj), obj, var_struct);
}