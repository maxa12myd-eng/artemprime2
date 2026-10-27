menu_index = 0;
menu_count = 4; // Играть, Локации, Настройки, Выход

// Убираем сглаживание текста, чтобы шрифт был четким
gpu_set_tex_filter(false); 

// На всякий случай размораживаем игрока
global.cutscene = false;

// Запуск музыки меню
if (audio_exists(snd_menu_music)) {
    if (!audio_is_playing(snd_menu_music)) {
        audio_stop_all();
        audio_play_sound(snd_menu_music, 10, true);
    }
}