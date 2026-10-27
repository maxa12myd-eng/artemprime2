// Флаг завершения (чтобы room_goto не вызвался дважды)
if (variable_instance_exists(id, "finished") == false) {
    finished = false;
}

// Печать текста посимвольно
if (!done_typing) {
    type_pos += type_speed;
    if (type_pos >= string_length(dialog_lines[dialog_index].text)) {
        type_pos = string_length(dialog_lines[dialog_index].text);
        done_typing = true;
    }
}

// Нажатие Enter / E
if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("E"))) {
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

// Конец диалога — переход в комнату
if (dialog_index >= array_length(dialog_lines) && !finished) {
    finished = true;
    
    if (instance_exists(obj_artem_prime)) {
        obj_artem_prime.leaving = true;
    }
    
    global.cutscene = false;
    
    room_goto(rm_megion_yard);
    instance_destroy();
}