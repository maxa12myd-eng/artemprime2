if (cooldown <= 0 && !global.cutscene) {
    // 1. Отнимаем здоровье
    if (variable_global_exists("player_hp")) {
        global.player_hp -= 2; 
    }
    
    // 2. Откидываем игрока
    var _dir = point_direction(x, y, obj_artem_player.x, obj_artem_player.y);
    obj_artem_player.x += lengthdir_x(40, _dir);
    obj_artem_player.y += lengthdir_y(40, _dir);
    
    // 3. Красный экран
    instance_create_depth(0, 0, -9999, obj_damage_flash);
    
    // 4. Звук
    if (audio_exists(snd_sludge)) {
        audio_play_sound(snd_sludge, 10, false);
    }
    
    // 5. Задержка
    cooldown = 60; 
}