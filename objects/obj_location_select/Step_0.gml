if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
    menu_index -= 1;
    if (menu_index < 0) menu_index = count - 1;
    if (audio_exists(snd_menu_move)) audio_play_sound(snd_menu_move, 5, false);
}

if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
    menu_index += 1;
    if (menu_index >= count) menu_index = 0;
    if (audio_exists(snd_menu_move)) audio_play_sound(snd_menu_move, 5, false);
}

if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) {
    if (audio_exists(snd_menu_move)) audio_play_sound(snd_menu_move, 5, false);
    
    global.cutscene = false; 
    global.player_hp = 40; // Даем полное хп для теста
    global.player_max_hp = 40;
    
    // ПРОВЕРКА: Если выбран последний пункт (Альфа)
    if (menu_index == 10) {
        global.start_alpha = true;
    } else {
        global.start_alpha = false;
    }
    
    room_goto(rooms[menu_index]); 
}

if (keyboard_check_pressed(vk_escape)) {
    instance_destroy();
    room_goto(rm_game_menu);
}