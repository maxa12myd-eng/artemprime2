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
        
        // НОВЫЙ ЗВУК ДИАЛОГА
        if (audio_exists(snd_dialogue)) audio_play_sound(snd_dialogue, 5, false);
        
    } else {
        dialog_index += 1;
        type_pos = 0;
        done_typing = false;
        
        // НОВЫЙ ЗВУК ДИАЛОГА
        if (audio_exists(snd_dialogue)) audio_play_sound(snd_dialogue, 5, false);
        
        // Конец диалога
        if (dialog_index >= array_length(dialog_lines)) {
            global.cutscene = true; 
            
            if (instance_exists(obj_fade_out)) {
                var _fade = instance_create_depth(0, 0, -9999, obj_fade_out);
                _fade.next_room = rm_battle_borzen; 
            } else {
                room_goto(rm_battle_borzen);
            }
            
            instance_destroy();
            exit; 
        }
    }
}