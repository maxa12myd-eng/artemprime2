// 1. МЕНЮ
if (state == "menu") {
    if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"))) menu_index = (menu_index - 1 + 4) mod 4;
    if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"))) menu_index = (menu_index + 1) mod 4;
    
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) {
        if (menu_index == 0) { state = "fight"; fight_pos = 0; fight_dir = 1; }
        else if (menu_index == 1) { monster_dialog = "Монстр не понимает."; state = "dialog"; }
        else if (menu_index == 2) { player_hp = min(20, player_hp + 10); monster_dialog = "Лечение!"; state = "dialog"; }
        else if (menu_index == 3) { state = "win"; }
        exit;
    }
}

// 2. АТАКА (Полоска)
if (state == "fight") {
    fight_pos += 4 * fight_dir;
    if (fight_pos >= 100 || fight_pos <= 0) fight_dir *= -1;
    
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) {
        enemy_hp -= 2; 
        monster_dialog = "Удар!";
        state = "dialog";
        exit;
    }
}

// 3. ДИАЛОГ
if (state == "dialog") {
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) {
        if (enemy_hp <= 0) { state = "win"; }
        else {
            state = "enemy_turn";
            attack_timer = 180; 
            spawn_timer = 0;
            // Создаем сердце ровно по центру
            instance_create_depth(box_x + box_w/2, box_y + box_h/2, -100, obj_soul);
        }
        exit;
    }
}

// 4. УКЛОНЕНИЕ (Пули)
if (state == "enemy_turn") {
    attack_timer -= 1;
    spawn_timer -= 1;
    
    // Если игрок проиграл
       // Если игрок умер
    if (player_hp <= 0) {
        with(obj_bullet) instance_destroy();
        with(obj_soul) instance_destroy();
        
        global.player_hp = 0; // Запоминаем, что мы умерли
        global.cutscene = false;
        
        audio_stop_all(); // Выключаем музыку боя
        instance_destroy();
        
        // Переходим на экран Game Over
        room_goto(rm_game_over); 
        exit;
    }
    
    // Спавн пуль
    if (spawn_timer <= 0 && attack_timer > 0) {
        var _b = instance_create_depth(box_x + irandom(box_w), box_y - 20, -50, obj_bullet);
        if (instance_exists(_b)) { 
            _b.speed = 4; 
            _b.direction = 270; 
        }
        spawn_timer = 15;
    }
    
    // Конец атаки
    if (attack_timer <= 0) {
        with(obj_bullet) instance_destroy();
        with(obj_soul) instance_destroy();
        state = "menu";
        exit;
    }
}

// 5. КОНЕЦ БОЯ
if (state == "win" || state == "lose") {
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) {
        
        if (state == "win" && variable_global_exists("current_trigger_id")) {
            array_push(global.defeated_triggers, global.current_trigger_id);
        }
        
        with(obj_bullet) instance_destroy();
        with(obj_soul) instance_destroy();
        
        // ВЫКЛЮЧАЕМ ТОЛЬКО БОЕВУЮ МУЗЫКУ (музыка планеты останется на паузе)
        if (audio_is_playing(snd_battle_theme)) {
            audio_stop_sound(snd_battle_theme);
        }
        
        global.cutscene = false;
        instance_destroy();
        room_goto(rm_planet_dirt_2); 
		// Сохраняем здоровье перед выходом на карту
global.player_hp = player_hp;
    }
}