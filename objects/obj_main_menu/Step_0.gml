// Если открыты настройки, главное меню замирает и не реагирует на кнопки!
if (instance_exists(obj_settings)) exit;

var _up    = keyboard_check_pressed(vk_up)    || keyboard_check_pressed(ord("W"));
var _down  = keyboard_check_pressed(vk_down)  || keyboard_check_pressed(ord("S"));
var _enter = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("E"));

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

if (_enter) {
    if (audio_exists(snd_menu_move)) audio_play_sound(snd_menu_move, 5, false);
    
    switch (menu_index) {
        case 0: // ИГРАТЬ
            audio_stop_all();
            room_goto(rm_cutscene_mom); 
            break;
        case 1: // ЛОКАЦИИ
            audio_stop_all();
            room_goto(rm_location_select); 
            break;
        case 2: // НАСТРОЙКИ
            instance_create_layer(0, 0, "Instances", obj_settings);
            break;
        case 3: // ВЫХОД
            game_end();
            break;
    }
}