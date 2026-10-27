// Создаем эффект плавного появления при входе в комнату
// Глубина -9999 нужна, чтобы черный экран был поверх всего (даже поверх диалогов)
instance_create_depth(0, 0, -9999, obj_fade_in);
global.cutscene = false;
// Включаем музыку планеты (зацикленно)
if (audio_exists(snd_planet_theme)) {
    audio_stop_all(); // На всякий случай останавливаем всё, что играло до этого
    audio_play_sound(snd_planet_theme, 10, true); // true = зациклить
}