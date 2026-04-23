/// @description This function checks if your bounding box is colliding with a given element.
/// @argument {Id.TileMapElement OR Asset.GMObject OR Id.Instance OR Constant.All OR Constant.Other OR Array} obj The object to check for instance collisions.
/// @argument {bool} prec Whether the check is based on precise collisions (true, which is slower) or its bounding box in general (false, faster).
/// @argument {bool} notme Whether the calling instance, if relevant, should be excluded (true) or not (false).
/// @returns {Id.Instance} The instance you are colliding with.
function collision_object(obj, prec, notme) {
	return (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj, prec, notme));
}