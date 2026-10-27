// Печать текста посимвольно
if (!done_typing) {
    type_pos += type_speed;
    if (type_pos >= string_length(dialog_lines[dialog_index].text)) {
        type_pos = string_length(dialog_lines[dialog_index].text);
        done_typing = true;
    }
}

// Обработка нажатия клавиш
if (keyboard_check_pressed(vk_enter) 
    || keyboard_check_pressed(vk_space)
    || keyboard_check_pressed(ord("Z"))
    || keyboard_check_pressed(ord("E"))) {
    
    if (!done_typing) {
        type_pos = string_length(dialog_lines[dialog_index].text);
        done_typing = true;
        // НОВЫЙ ЗВУК ДИАЛОГА
        if (audio_exists(snd_dialogue)) audio_play_sound(snd_dialogue, 5, false);
    } else {
        dialog_index += 1;
        type_pos = 0;
        done_typing = false;
        // НОВЫЙ ЗВУК ДИАЛОГА
        if (audio_exists(snd_dialogue)) audio_play_sound(snd_dialogue, 5, false);
        
        if (dialog_index >= array_length(dialog_lines)) {
            global.cutscene = false; 
            
            keyboard_clear(vk_enter);
            keyboard_clear(vk_space);
            keyboard_clear(ord("Z"));
            keyboard_clear(ord("E"));
            
            instance_destroy(); 
            exit; 
        }
    }
}