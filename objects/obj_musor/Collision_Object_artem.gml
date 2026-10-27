instance_destroy();
if (audio_exists(snd_bag)) audio_play_sound(snd_bag, 1, false);
global.trash_cleaned += 1;