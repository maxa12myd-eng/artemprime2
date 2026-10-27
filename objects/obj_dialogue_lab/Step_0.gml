// Спавн Жеки и Махмуда
if (dialog_index == 0 && !instance_exists(obj_zheka_t3000)) {
    instance_create_layer(150, 130, "Instances", obj_zheka_t3000);
}
if (dialog_index == 0 && !instance_exists(obj_evil_mahmud)) {
    instance_create_layer(490, 130, "Instances", obj_evil_mahmud);
}

// СПАВН ПОРТАЛА (реплика 8 - "А что это за штука в центре?")
if (dialog_index == 8 && !instance_exists(obj_portal_lab)) {
    instance_create_layer(320, 200, "Instances", obj_portal_lab);
}

// Печать текста
if (!done_typing) {
    type_pos += type_speed;
    if (type_pos >= string_length(dialog_lines[dialog_index].text)) {
        type_pos = string_length(dialog_lines[dialog_index].text);
        done_typing = true;
    }
}

// Enter / Space / E / Z
if (keyboard_check_pressed(vk_enter) 
    || keyboard_check_pressed(vk_space)
    || keyboard_check_pressed(ord("E"))
    || keyboard_check_pressed(ord("Z"))) {
    
    if (!done_typing) {
        type_pos = string_length(dialog_lines[dialog_index].text);
        done_typing = true;
        if (audio_exists(snd_dialogue)) audio_play_sound(snd_dialogue, 5, false);
    } else {
        dialog_index += 1;
        type_pos = 0;
        done_typing = false;
        if (audio_exists(snd_dialogue)) audio_play_sound(snd_dialogue, 5, false);
    }
}

// Конец диалога - переход на планету грязи
if (dialog_index >= array_length(dialog_lines) && !finished) {
    finished = true;
    global.cutscene = false; // Разморозка
    
    // Останавливаем музыку лаборатории, если она есть
    audio_stop_all(); 
    
    instance_destroy(); // Удаляем диалог
    room_goto(rm_planet_dirt); // Переход
}