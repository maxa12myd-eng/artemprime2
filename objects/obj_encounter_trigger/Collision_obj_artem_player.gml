if (!global.cutscene) {
    global.cutscene = true; 
    
   // Запоминаем ТОЧНЫЕ координаты, без сдвигов
global.player_x = obj_artem_player.x;
global.player_y = obj_artem_player.y;
    
    // ЗАПОМИНАЕМ ID ТЕКУЩЕГО ТРИГГЕРА (его координаты x и y)
    global.current_trigger_id = string(x) + "_" + string(y);
    
    // Создаем восклицательный знак над Артёмом
    instance_create_depth(obj_artem_player.x, obj_artem_player.y - 60, -9999, obj_exclamation);
    
    // Звук восклицательного знака
    if (audio_exists(snd_exclamation)) {
        audio_play_sound(snd_exclamation, 10, false);
    }
    
    // Запускаем таймер до перехода в бой (полсекунды)
    alarm[0] = 30; 
}