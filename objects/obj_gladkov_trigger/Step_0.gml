// Если игрок существует и мы еще не сработали
if (!triggered && instance_exists(obj_artem_player)) {
    var _dist = point_distance(x, y, obj_artem_player.x, obj_artem_player.y);
    
    // Если Артём подошел близко (на 100 пикселей)
    if (_dist < 100) {
        triggered = true;
        global.cutscene = true; // Замораживаем игрока
        
        // ФИКСИРУЕМ КАМЕРУ (чтобы она не улетела, когда начнется диалог)
        // Так как комната 640x640, а камера 640x360, ставим её ровно по центру:
        camera_set_view_pos(view_camera[0], 0, 140); 
        
        // Запускаем диалог перед битвой
        if (!instance_exists(obj_dialogue_gladkov)) {
            instance_create_depth(0, 0, -1000, obj_dialogue_gladkov);
        }
    }
}