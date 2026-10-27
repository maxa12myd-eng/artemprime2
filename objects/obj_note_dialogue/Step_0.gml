// 1. Печать текста
if (!done_typing) {
    type_pos += type_speed;
    if (type_pos >= string_length(dialog_lines[dialog_index].text)) {
        type_pos = string_length(dialog_lines[dialog_index].text);
        done_typing = true;
    }
}

// 2. Перелистывание
if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_space)) {
    if (!done_typing) {
        type_pos = string_length(dialog_lines[dialog_index].text);
        done_typing = true;
    } else {
        dialog_index += 1;
        type_pos = 0;
        done_typing = false;
        
        // Конец записки
        if (dialog_index >= array_length(dialog_lines)) {
            global.cutscene = false; // Размораживаем Артёма
            keyboard_clear(vk_enter);
            instance_destroy();
            exit;
        }
    }
}