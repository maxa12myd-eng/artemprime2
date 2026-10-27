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
        
        // 3. КОНЕЦ ДИАЛОГА (ВЫЗОВ ФЕЙДА)
        if (dialog_index >= array_length(dialog_lines)) {
            global.cutscene = true; // Замораживаем игрока
			        if (dialog_index >= array_length(dialog_lines)) {
            global.cutscene = true; 
            
            // Создаем НОВЫЙ фейд
            var _f = instance_create_depth(0, 0, -9999, obj_screen_fade);
            _f.alpha = 0;          // Начинаем с прозрачного
            _f.target_alpha = 1;   // Затемняемся до черного
            _f.next_room = rm_boss_borzen; // Куда идем
            
            instance_destroy();
            exit;
        }
            
            // ВЫВОДИМ СООБЩЕНИЕ ДЛЯ ПРОВЕРКИ
            show_debug_message("ДИАЛОГ ЗАКОНЧЕН! Вызываю фейд...");
            
            if (instance_exists(obj_fade_out)) {
                var _f = instance_create_depth(0, 0, -9999, obj_fade_out);
                _f.next_room = rm_boss_borzen; // Куда идем
                show_debug_message("Объект фейда создан! Идем в rm_boss_borzen");
            } else {
                show_debug_message("ОШИБКА: obj_fade_out НЕ СУЩЕСТВУЕТ!");
                room_goto(rm_boss_borzen); // Аварийный переход
            }
            
            instance_destroy(); // Удаляем диалог
            exit; // Выходим из события, чтобы не выполнять код ниже
        }
    }
}