// Отладка
show_debug_message("line: " + string(line_index) + " / " + string(array_length(lines)));

// ПЕРЕХОД
if (line_index >= array_length(lines)) {
    if (audio_is_playing(snd_black_screen_music)) {
        audio_stop_sound(snd_black_screen_music);
    }
    room_goto(rm_school_toilet);
    exit;
}

// ПЕЧАТЬ ТЕКСТА
if (!done_typing) {
    type_pos += type_speed;
    if (type_pos >= string_length(lines[line_index])) {
        type_pos = string_length(lines[line_index]);
        done_typing = true;
    }
}

// ENTER / E / SPACE / Z
if (keyboard_check_pressed(vk_enter) 
    || keyboard_check_pressed(ord("E"))
    || keyboard_check_pressed(vk_space)
    || keyboard_check_pressed(ord("Z"))) {
    
    if (!done_typing) {
        type_pos = string_length(lines[line_index]);
        done_typing = true;
        if (audio_exists(snd_menu_move)) audio_play_sound(snd_menu_move, 5, false);
    } else {
        line_index += 1;
        type_pos = 0;
        done_typing = false;
        if (audio_exists(snd_menu_move)) audio_play_sound(snd_menu_move, 5, false);
    }
}