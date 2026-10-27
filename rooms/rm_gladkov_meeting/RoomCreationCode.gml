global.cutscene = false;
audio_stop_all(); // Останавливаем то, что играло до этого

// Включаем ветер (громкость 5, зацикливаем)
if (audio_exists(snd_wind)) {
    audio_play_sound(snd_wind, 5, true); 
}
global.cutscene = false;

global.cutscene = false;
audio_stop_all(); // Твоя музыка

// СОЗДАЕМ ФЕЙД ДЛЯ ПРОЯВЛЕНИЯ
var _f = instance_create_depth(0, 0, -9999, obj_fade_simple);
_f.mode = "in";
_f.alpha = 1; // Начинаем с черного экрана