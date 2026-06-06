if (instance_exists(inst_6BD6A7AA)) {
	instance_destroy(inst_6BD6A7AA);
}

global.action = 1;
layer_background_alpha(layer_background_get_id("Background"), 0);

//sound_play(snd_thud);

progress = 0;
ready = false;
alarm[0] = 60;