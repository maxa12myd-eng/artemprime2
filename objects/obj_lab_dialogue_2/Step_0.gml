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
        
        // 3. КОНЕЦ ДИАЛОГА
        if (dialog_index >= array_length(dialog_lines)) {
            global.cutscene = false; // Размораживаем игрока, чтобы он мог войти в портал
            
            // Открываем портал к Гладкову прямо в лаборатории
            if (!instance_exists(obj_gladkov_portal)) {
                instance_create_depth(320, 150, -5, obj_gladkov_portal); 
            }
            
            instance_destroy();
            exit;
        }
    }
}