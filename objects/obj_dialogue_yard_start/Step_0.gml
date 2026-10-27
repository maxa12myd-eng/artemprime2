if (!done_typing) {
    type_pos += type_speed;
    if (type_pos >= string_length(dialog_lines[dialog_index].text)) {
        type_pos = string_length(dialog_lines[dialog_index].text);
        done_typing = true;
    }
}

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

if (dialog_index >= array_length(dialog_lines) && !finished) {
    finished = true;
    instance_destroy();
    
    if (!instance_exists(obj_dialogue_prime_kill)) {
        instance_create_layer(0, 0, "Instances", obj_dialogue_prime_kill);
    }
}