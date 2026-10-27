if (instance_exists(obj_artem_player) && !global.cutscene) {
    var _dist = point_distance(x, y, obj_artem_player.x, obj_artem_player.y);
    
    // Если Артём близко и нажимает Enter
    if (_dist < 50 && (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("E")))) {
        global.cutscene = true; // Замораживаем Артёма
        
        // Создаем объект с текстом записки
        if (!instance_exists(obj_note_dialogue)) {
            instance_create_depth(0, 0, -1000, obj_note_dialogue);
        }
        
        keyboard_clear(vk_enter); // Убираем нажатие, чтобы окно не закрылось сразу
    }
}