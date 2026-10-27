// Уменьшаем кулдаун
if (cooldown > 0) {
    cooldown -= 1;
}

// Если Артём подошел вплотную к луже (10 пикселей) и кулдаун прошел
if (cooldown <= 0 && !global.cutscene) {
    
    if (distance_to_object(obj_artem_player) < 10) {
        
        // 1. Отнимаем ХП
        if (variable_global_exists("player_hp")) {
            global.player_hp -= 2;
        }
        
        // 2. Красный экран
        instance_create_depth(0, 0, -9999, obj_damage_flash);
        
        // 3. Звук
        if (audio_exists(snd_sludge)) {
            audio_play_sound(snd_sludge, 10, false);
        }
        
        // 4. Отскок (60 пикселей от центра лужи)
        var _dir = point_direction(x, y, obj_artem_player.x, obj_artem_player.y);
        obj_artem_player.x += lengthdir_x(60, _dir);
        obj_artem_player.y += lengthdir_y(60, _dir);
        
        // 5. Задержка (1 секунда)
        cooldown = 60;
    }
}

// Проверка на Game Over
if (variable_global_exists("player_hp") && global.player_hp <= 0 && !global.cutscene) {
    global.cutscene = false;
    room_goto(rm_game_over);
}