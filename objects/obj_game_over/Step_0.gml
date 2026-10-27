// 1. Эффект печати
if (!finished) {
    text_pos += text_speed;
    
    // Если текст допечатался до конца
    if (text_pos >= string_length(text)) {
        text_pos = string_length(text);
        finished = true;
    }
}

// 2. Ожидание нажатия Enter (только когда текст допечатан)
if (finished && (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")))) {
    
    // Восстанавливаем здоровье игрока перед возрождением
    if (variable_global_exists("player_max_hp")) {
        global.player_hp = global.player_max_hp;
    } else {
        global.player_hp = 20; // Запасной вариант
    }
    
    // Выключаем музыку Game Over
    if (audio_exists(snd_game_over)) {
        audio_stop_sound(snd_game_over);
    }
    
    // Возвращаем игрока в комнату, которую мы запомнили
    if (variable_global_exists("respawn_room")) {
        room_goto(global.respawn_room);
    } else {
        room_goto(rm_planet_dirt_2); // Если переменная потерялась
    }
}