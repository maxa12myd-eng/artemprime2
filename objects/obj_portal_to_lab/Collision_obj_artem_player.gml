if (!global.cutscene) {
    global.cutscene = true;
    
    // Запускаем эффект затемнения
    if (instance_exists(obj_fade_out)) {
        var _fade = instance_create_depth(0, 0, -9999, obj_fade_out);
        _fade.next_room = rm_lab_zheka2; // Куда идем
    } else {
        room_goto(rm_lab_zheka2); // Если объекта фейда нет, переходим сразу
    }
}