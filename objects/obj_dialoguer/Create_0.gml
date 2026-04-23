color = global.player[global.clientID].info.color;
xx = camerax();
yy = cameray();
x1 = (xx + 12);
y1 = (yy + 162);
x2 = (xx + 308);
y2 = (yy + 228);
writerx = (xx + 13);
writery = (yy + 13);
if (instance_exists(obj_atlas)) {
	if (obj_atlas.y > yy + 128) { //top
		writery = (yy + 12);
		top = true;
	} else { //bottom
		writery = (yy + 164);
		top = false;
	}
}

writer = instance_create(writerx, writery, obj_writer);
writer.creator = id;

textbox = -1;
shineSurf = -1;
shineX = 99999;
debugangle = -45;
alarm[0] = 90 + random(120);