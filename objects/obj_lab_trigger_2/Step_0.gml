if (!triggered && instance_exists(obj_artem_player)) {
    var _dist = point_distance(x, y, obj_artem_player.x, obj_artem_player.y);
    if (_dist < 100) {
        triggered = true;
        global.cutscene = true;
        instance_create_depth(0, 0, -1000, obj_lab_dialogue_2);
    }
}