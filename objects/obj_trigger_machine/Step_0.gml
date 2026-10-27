if (!triggered && instance_exists(obj_artem_prime_player)) {
    var _dist = point_distance(x, y, obj_artem_prime_player.x, obj_artem_prime_player.y);
    
    if (_dist < 80) {
        triggered = true;
        global.cutscene = true; // ← замораживаем Прайма
        
        if (!instance_exists(obj_dialogue_yard_start)) {
            instance_create_layer(0, 0, "Instances", obj_dialogue_yard_start);
        }
    }
}