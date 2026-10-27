// 1. Печать текста
if (!done_typing) {
    type_pos += type_speed;
    if (type_pos >= string_length(dialog_lines[dialog_index].text)) {
        type_pos = string_length(dialog_lines[dialog_index].text);
        done_typing = true;
    }
}

// 2. Листание текста
if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_space)) {
    if (!done_typing) {
        type_pos = string_length(dialog_lines[dialog_index].text);
        done_typing = true;
        if (audio_exists(snd_dialogue)) audio_play_sound(snd_dialogue, 5, false);
    } else {
        dialog_index += 1;
        type_pos = 0;
        done_typing = false;
        if (audio_exists(snd_dialogue)) audio_play_sound(snd_dialogue, 5, false);
        
        // 3. КОНЕЦ ДИАЛОГА (Переход в бой)
        if (dialog_index >= array_length(dialog_lines)) {
            global.cutscene = true; 
            room_goto(rm_battle_gladkov); // Просто переходим в комнату боя
            instance_destroy();
            exit;
        }
    }
}