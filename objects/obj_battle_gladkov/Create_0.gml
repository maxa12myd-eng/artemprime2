// ПРОВЕРКА ФАЗЫ И МУЗЫКА
if (variable_global_exists("start_alpha") && global.start_alpha == true) {
    is_alpha = true;
    enemy_max_hp = 35;
    enemy_hp = 35;
    global.start_alpha = false; 
} else {
    is_alpha = false;
    enemy_max_hp = 60;
    enemy_hp = 60;
}

audio_stop_all(); // ОБЯЗАТЕЛЬНО
if (is_alpha) {
    if (audio_exists(snd_neo_theme)) audio_play_sound(snd_neo_theme, 15, true);
} else {
    if (audio_exists(snd_gladkov_amalgam)) audio_play_sound(snd_gladkov_amalgam, 10, true);
}
display_set_gui_size(640, 360);
depth = 100;

// ПРОВЕРКА ФАЗЫ
if (variable_global_exists("start_alpha") && global.start_alpha == true) {
    is_alpha = true;
    enemy_max_hp = 35;
    enemy_hp = 35;
    global.start_alpha = false; 
} else {
    is_alpha = false;
    enemy_max_hp = 60;
    enemy_hp = 60;
}

// ОТЛАДКА МУЗЫКИ
show_debug_message("=== БОЙ НАЧАЛСЯ ===");
if (variable_global_exists("start_alpha")) {
    show_debug_message("Флаг Альфы: " + string(global.start_alpha));
} else {
    show_debug_message("Флага Альфы нет");
}

show_debug_message("Существует ли snd_gladkov_amalgam? " + string(audio_exists(snd_gladkov_amalgam)));
show_debug_message("Существует ли snd_neo_theme? " + string(audio_exists(snd_neo_theme)));

audio_stop_all(); 
if (is_alpha) {
    if (audio_exists(snd_neo_theme)) {
        audio_play_sound(snd_neo_theme, 15, true);
        show_debug_message("ВКЛЮЧИЛ МЕТТАТОНА");
    }
} else {
    if (audio_exists(snd_gladkov_amalgam)) {
        audio_play_sound(snd_gladkov_amalgam, 10, true);
        show_debug_message("ВКЛЮЧИЛ ОБЫЧНУЮ МУЗЫКУ");
    }
}
// СТАТЫ
player_hp = 40;
player_max_hp = 40;

state = "menu"; 
menu_index = 0;
action_index = 0;
action_options = ["Чипсы", "Борзен", "Вонь"];

box_w = 420;
box_h = 110;
box_x = (640 - box_w) / 2;
box_y = 150;

fight_pos = 0;
fight_dir = 1;
fight_speed = 6;
fight_hit = false;

attack_timer = 0;
spawn_timer = 0;
pattern = 0;
monster_dialog = "";
shake_timer = 0;
hp_visible_timer = 0; 
white_fade = 0;
phase2_dialog_index = 0;

// МЕШОК АТАК
if (is_alpha) {
    attack_bag = [6, 7, 8, 9, 10, 11, 12];
} else {
    attack_bag = [0, 1, 2, 3, 4, 5];
}

phase2_dialog = [
    "Гладков:  Думаешь, ты меня победил?",
    "Гладков: Мне стыдно... Стыдно, что меня смог одолеть какой-то чистый выродок!",
    "Гладков: Ты недостоин даже смотреть на мою истинную форму!",
    "Гладков: Я покажу тебе... настоящую СИЛУ СВАЛКИ!",
    "Гладков: Я стану... АЛЬФОЙ!"
];