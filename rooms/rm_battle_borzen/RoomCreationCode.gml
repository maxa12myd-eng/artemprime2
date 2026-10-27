// Включаем ремикс Enemy Approaching
if (audio_exists(snd_borzen_theme)) {
    audio_stop_all();
    audio_play_sound(snd_borzen_theme, 10, true);
}

global.cutscene = false;
if (instance_exists(obj_fade_in)) {
    instance_create_depth(0, 0, -9999, obj_fade_in);
}