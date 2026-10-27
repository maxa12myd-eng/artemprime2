global.cutscene = false;

// Восстанавливаем позицию Артёма
if (variable_global_exists("player_x") && variable_global_exists("player_y")) {
    with (obj_artem_player) {
        x = global.player_x;
        y = global.player_y;
    }
}

// ПРОДОЛЖАЕМ МУЗЫКУ С ТОГО ЖЕ МЕСТА
if (audio_is_playing(snd_planet_theme)) {
    // Если она на паузе - снимаем с паузы
    audio_resume_sound(snd_planet_theme);
} else {
    // Если она вообще не играла (первый заход в комнату) - включаем
    audio_play_sound(snd_planet_theme, 10, true);
}
// Принудительно снимаем заморозку
global.cutscene = false;

// Ставим Артёма на координаты, которые мы сохранили (со сдвигом)
if (variable_global_exists("player_x") && variable_global_exists("player_y")) {
    with (obj_artem_player) {
        x = global.player_x;
        y = global.player_y;
    }
}
global.cutscene = false; // <--- РАЗМОРАЖИВАЕМ ИГРОКА

// Эффект плавного появления
instance_create_depth(0, 0, -9999, obj_fade_in);
// Уменьшаем Артёма только для этой локации
with (obj_artem_player) {
    my_scale = 0.8; // Можешь попробовать 0.7 или 1.0
    image_xscale = my_scale;
    image_yscale = my_scale;
}