global.cutscene = false;
audio_stop_all();

// Фейд появления в комнате
if (instance_exists(obj_screen_fade)) {
    var _f = instance_create_depth(0, 0, -9999, obj_screen_fade);
    _f.alpha = 1;
    _f.target_alpha = 0;
    _f.next_room = -1;
}

// ПРОВЕРЯЕМ, УБИТ ЛИ БОРЗЕН
if (variable_global_exists("borzen_defeated") && global.borzen_defeated) {
    
    // 1. УДАЛЯЕМ ЖИВОГО БОРЗЕНА (если игра вылетает, проверь имя объекта в комнате!)
    with (obj_borzen) instance_destroy(); 
    with (obj_boss_borzen_trigger) instance_destroy(); // Удаляем триггер диалога
    
    // 2. СОЗДАЕМ ТРУП И ПОРТАЛ
    instance_create_depth(320, 250, -10, obj_borzen_dead); // Труп
    instance_create_depth(320, 150, -5, obj_return_to_lab); // Портал (в лабу)
    
    // 3. ВКЛЮЧАЕМ ЭМБИЕНТ
    if (audio_exists(snd_but_nobody_came)) {
        audio_play_sound(snd_but_nobody_came, 10, true);
    }
} else {
    // Если Борзен ЖИВ, включаем музыку его дома (если есть)
    // if (audio_exists(snd_house_theme)) audio_play_sound(snd_house_theme, 10, true);
}