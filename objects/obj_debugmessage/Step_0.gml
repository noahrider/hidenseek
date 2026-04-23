time++;

y = lerp(y, (5 + string_height(message)), time / 30);

if (time >= 90) {
	image_alpha -= 0.05;
	if (image_alpha <= 0) instance_destroy();
}