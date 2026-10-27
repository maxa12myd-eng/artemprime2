// Создаем глобальный массив для побежденных триггеров (если его еще нет)
if (!variable_global_exists("defeated_triggers")) {
    global.defeated_triggers = [];
}
// Принудительный размер GUI
display_set_gui_size(room_width, room_height);

// СТАВИМ МУЗЫКУ ПЛАНЕТЫ НА ПАУЗУ (если она играет)
if (audio_is_playing(snd_planet_theme)) {
    audio_pause_sound(snd_planet_theme);
}

// Включаем боевую музыку
if (audio_exists(snd_battle_theme)) {
    audio_play_sound(snd_battle_theme, 10, true);
}

// Переменные
state = "menu"; 
menu_index = 0;
// Берем здоровье из глобальной переменной (которое могло уменьшиться из-за лужи)
player_hp = global.player_hp;
player_max_hp = global.player_max_hp;
enemy_hp = 5;
fight_pos = 0;
fight_dir = 1;
attack_timer = 0;
spawn_timer = 0;
monster_dialog = "";

// Рамка (координаты)
box_w = 400;
box_h = 120;
box_x = (room_width - box_w) / 2;
box_y = 170;