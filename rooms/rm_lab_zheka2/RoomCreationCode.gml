global.cutscene = false;
audio_stop_all(); // Твоя музыка

// СОЗДАЕМ ФЕЙД ДЛЯ ПРОЯВЛЕНИЯ
var _f = instance_create_depth(0, 0, -9999, obj_fade_simple);
_f.mode = "in";
_f.alpha = 1; // Начинаем с черного экрана
global.cutscene = false;
global.player_hp = global.player_max_hp; // На всякий случай лечим перед сценой
// 1. ОСТАНАВЛИВАЕМ СТАРУЮ МУЗЫКУ
audio_stop_all();


global.cutscene = false;
global.player_hp = global.player_max_hp; 