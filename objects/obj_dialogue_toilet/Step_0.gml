// СПАВН ПОРТАЛА №1 (реплика 7)
if (dialog_index == 7 && !instance_exists(obj_portal_evil)) {
    instance_create_layer(150, 130, "Instances", obj_portal_evil);
}

// СПАВН ЗЛОГО МАХМУДА (реплика 8, выше — Y = 130)
if (dialog_index == 8 && !instance_exists(obj_evil_mahmud)) {
    instance_create_layer(150, 130, "Instances", obj_evil_mahmud);
}

// СПАВН ПОРТАЛА №2 (реплика 16, выше — Y = 130)
if (dialog_index == 16 && !variable_instance_exists(id, "portal2_spawned")) {
    portal2_spawned = true;
    var _p2 = instance_create_layer(490, 130, "Instances", obj_portal_evil);
    _p2.image_xscale = 1.5;
    _p2.image_yscale = 1.5;
}

// СПАВН ЖЕКИ T-3000 (реплика 17, выше — Y = 130)
if (dialog_index == 17 && !instance_exists(obj_zheka_t3000)) {
    instance_create_layer(490, 130, "Instances", obj_zheka_t3000);
}

// ПЕЧАТЬ ТЕКСТА
if (!done_typing) {
    type_pos += type_speed;
    if (type_pos >= string_length(dialog_lines[dialog_index].text)) {
        type_pos = string_length(dialog_lines[dialog_index].text);
        done_typing = true;
    }
}

// ENTER / E / SPACE / Z — следующая реплика
if (keyboard_check_pressed(vk_enter) 
    || keyboard_check_pressed(ord("E"))
    || keyboard_check_pressed(vk_space)
    || keyboard_check_pressed(ord("Z"))) {
    
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

// КОНЕЦ ДИАЛОГА — переход в лабораторию Жеки
if (dialog_index >= array_length(dialog_lines) && !finished) {
    finished = true;
    instance_destroy();
    global.cutscene = false;
    room_goto(rm_lab_zheka);
}