if (!triggered && instance_exists(obj_artem_player)) {
    var _dist = point_distance(x, y, obj_artem_player.x, obj_artem_player.y);
    if (_dist < 100) {
        triggered = true;
        global.cutscene = true;
        
        // ПРОВЕРЯЕМ, УБИТ ЛИ БОРЗЕН
        if (!variable_global_exists("borzen_defeated") || global.borzen_defeated == false) {
            // Если не убит - Жека отправляет нас к нему (Первый диалог)
            instance_create_depth(0, 0, -1000, obj_dialogue_lab_borzen);
        } else {
            // Если уже убит - Махмуд показывает отпечатки (Второй диалог)
            instance_create_depth(0, 0, -1000, obj_lab_dialogue_2);
        }
    }
}