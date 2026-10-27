if (!triggered && instance_exists(obj_artem_player)) {
    var _dist = point_distance(x, y, obj_artem_player.x, obj_artem_player.y);
    if (_dist < 100) {
        triggered = true;
        global.cutscene = true;
        if (!instance_exists(obj_dialogue_lab)) {
            instance_create_layer(0, 0, "Instances", obj_dialogue_lab);
        }
    }
}