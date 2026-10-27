// Печать текста
if (!done_typing) {
    type_pos += type_speed;
    if (type_pos >= string_length(dialog_lines[dialog_index].text)) {
        type_pos = string_length(dialog_lines[dialog_index].text);
        done_typing = true;
    }
}

// Enter / Space
if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
    if (!done_typing) {
        type_pos = string_length(dialog_lines[dialog_index].text);
        done_typing = true;
        if (audio_exists(snd_menu_move)) audio_play_sound(snd_menu_move, 5, false);
    } else {
        dialog_index += 1;
        type_pos = 0;
        done_typing = false;
        if (audio_exists(snd_menu_move)) audio_play_sound(snd_menu_move, 5, false);
    }
}

// КОНЕЦ ДИАЛОГА — разморозка + переход в уборку
if (dialog_index >= array_length(dialog_lines) && !finished) {
    finished = true;
    global.cutscene = false; // ← РАЗМОРАЖИВАЕМ АРТЁМА
    instance_destroy();
    room_goto(Room1);
}