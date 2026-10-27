if (instance_exists(obj_artem_player) && !global.cutscene) {
    var _dist = point_distance(x, y, obj_artem_player.x, obj_artem_player.y);
    
    // Если игрок близко к двери
    if (_dist < 80) {
        // Если нажали Enter или E
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("E"))) {
            
            global.cutscene = true; // Замораживаем игрока
            
            // Включаем звук двери
            if (audio_exists(snd_door_open)) {
                audio_play_sound(snd_door_open, 10, false);
            }
            
            // Создаем эффект затемнения
            var _fade = instance_create_depth(0, 0, -9999, obj_fade_out);
            _fade.next_room = rm_planet_dirt_2; // Указываем, куда идти
        }
    }
}