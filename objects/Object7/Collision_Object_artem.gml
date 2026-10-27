instance_destroy();
if (audio_exists(snd_crunch)) audio_play_sound(snd_crunch, 1, false);
global.trash_cleaned += 1;