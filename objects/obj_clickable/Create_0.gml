callback = function() { printf("No callback function defined in obj_clickable"); };

selected = false;

if (!instance_exists(mg_clickable)) {
	instance_create_depth(0, 0, 0, mg_clickable);
}