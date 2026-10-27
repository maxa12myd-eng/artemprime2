// Если настройки открылись, главное меню уже спит. Читаем кнопки.
var _up    = keyboard_check_pressed(vk_up)    || keyboard_check_pressed(ord("W"));
var _down  = keyboard_check_pressed(vk_down)  || keyboard_check_pressed(ord("S"));
var _left  = keyboard_check_pressed(vk_left)  || keyboard_check_pressed(ord("A"));
var _right = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
var _enter = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
var _esc   = keyboard_check_pressed(vk_escape);

if (_up) {
    menu_index -= 1;
    if (menu_index < 0) menu_index = menu_count - 1;
    if (audio_exists(snd_menu_move)) audio_play_sound(snd_menu_move, 5, false);
}
if (_down) {
    menu_index += 1;
    if (menu_index >= menu_count) menu_index = 0;
    if (audio_exists(snd_menu_move)) audio_play_sound(snd_menu_move, 5, false);
}

if (menu_index == 0) { // ГРОМКОСТЬ
    if (_left) {
        volume = max(0, volume - 0.1);
        global_volume = volume;
        audio_master_gain(global_volume);
    }
    if (_right) {
        volume = min(1, volume + 0.1);
        global_volume = volume;
        audio_master_gain(global_volume);
    }
}

if (menu_index == 1) { // ПОЛНЫЙ ЭКРАН
    if (_enter) {
        if (audio_exists(snd_menu_move)) audio_play_sound(snd_menu_move, 5, false);
        alarm[0] = 5; // Откладываем переключение, чтобы не вылетело
    }
}

if (_esc || (menu_index == 3 && _enter)) {
    if (audio_exists(snd_menu_move)) audio_play_sound(snd_menu_move, 5, false);
    instance_destroy();
}