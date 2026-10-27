// 1. ГЛАВНОЕ МЕНЮ
if (state == "menu") {
    if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"))) {
        menu_index = (menu_index - 1 + 4) mod 4;
    }
    if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"))) {
        menu_index = (menu_index + 1) mod 4;
    }
    
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) {
        if (menu_index == 0) { 
            state = "fight"; 
            fight_pos = 0; 
            fight_dir = 1; 
        }
        else if (menu_index == 1) { 
            state = "action"; 
            action_index = 0; 
        }
        else if (menu_index == 2) { 
            player_hp = min(player_max_hp, player_hp + 10); 
            monster_dialog = "Ты съел Доширак. +10 HP!"; 
            state = "dialog"; 
        }
        else if (menu_index == 3) { 
            monster_dialog = "Борзен: Мне не нужно твое пощажение!"; 
            state = "dialog"; 
        }
        exit;
    }
}

// 2. МЕНЮ ДЕЙСТВИЙ (ACT)
if (state == "action") {
    if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"))) action_index = max(0, action_index - 1);
    if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"))) action_index = min(2, action_index + 1);
    
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) {
        if (action_index == 0) monster_dialog = "Борзен: Сам ты жирный!";
        else if (action_index == 1) monster_dialog = "Борзен: Моя душа человека... Но я её продал.";
        else if (action_index == 2) monster_dialog = "Борзен: Я устал быть рабом.";
        state = "dialog";
        exit;
    }
}

// 3. ПОЛОСКА АТАКИ
if (state == "fight") {
    if (!fight_hit) {
        fight_pos += fight_speed * fight_dir;
        if (fight_pos >= 100 || fight_pos <= 0) fight_dir *= -1;
        
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) {
            fight_hit = true; 
            if (audio_exists(snd_slash)) audio_play_sound(snd_slash, 10, false);
            
            if (fight_pos >= 45 && fight_pos <= 55) { enemy_hp -= 3; monster_dialog = "КРИТ! (-3 HP)"; }
            else if (fight_pos >= 30 && fight_pos <= 70) { enemy_hp -= 2; monster_dialog = "Удар! (-2 HP)"; }
            else { enemy_hp -= 1; monster_dialog = "Промах... (-1 HP)"; }
            
            alarm[0] = 30; 
        }
    }
}

// 4. ОБЫЧНЫЙ ДИАЛОГ
if (state == "dialog") {
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) {
        if (enemy_hp <= 0) { 
            state = "win"; 
        } else {
            state = "enemy_turn";
            attack_timer = 180; 
            spawn_timer = 0;
            pattern = irandom(1); 
            
            // Создаем сердце для Борзена
            instance_create_depth(box_x + box_w/2, box_y + box_h/2, -200, obj_soul_borzen);
        }
        exit;
    }
}

// 5. ПРЕДСМЕРТНЫЙ ДИАЛОГ
if (state == "death_dialog") {
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) {
        death_index += 1;
        if (death_index < array_length(death_dialog)) {
            monster_dialog = death_dialog[death_index];
        } else {
            state = "win";
        }
        exit;
    }
}

// 6. АТАКИ БОРЗЕНА (ЖИР) - ТУТ НОВЫЙ ОБЪЕКТ obj_fat_bullet_borzen
if (state == "enemy_turn") {
    attack_timer -= 1;
    spawn_timer -= 1;
    
    if (player_hp <= 0) {
        with(obj_fat_bullet_borzen) instance_destroy();
        with(obj_soul_borzen) instance_destroy();
        global.player_hp = 0;
        audio_stop_all(); 
        instance_destroy(); 
        room_goto(rm_game_over); 
        exit;
    }
    
    // СПАВН ПУЛЬ
    if (spawn_timer <= 0 && attack_timer > 0) {
        var _b;
        if (pattern == 0) { // Дождь
            _b = instance_create_depth(box_x + irandom(box_w), box_y - 20, -100, obj_fat_bullet_borzen);
            if (instance_exists(_b)) { _b.speed = 5; _b.direction = 270; }
            spawn_timer = 15;
        }
        else if (pattern == 1) { // Волны с двух сторон
            _b = instance_create_depth(box_x - 20, box_y + irandom(box_h), -100, obj_fat_bullet_borzen);
            if (instance_exists(_b)) { _b.speed = 4; _b.direction = 0; }
            _b = instance_create_depth(box_x + box_w + 20, box_y + irandom(box_h), -100, obj_fat_bullet_borzen);
            if (instance_exists(_b)) { _b.speed = 4; _b.direction = 180; }
            spawn_timer = 20;
        }
    }
    
    // Конец атаки
    if (attack_timer <= 0) {
        with(obj_fat_bullet_borzen) instance_destroy();
        with(obj_soul_borzen) instance_destroy();
        state = "menu";
        exit;
    }
}

// 7. ПОБЕДА
if (state == "win") {
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) {
        with(obj_fat_bullet_borzen) instance_destroy();
        with(obj_soul_borzen) instance_destroy();
        audio_stop_all(); 
        global.player_hp = player_hp; 
        
        // САМОЕ ВАЖНОЕ: СТАВИМ ФЛАГ, ЧТО БОРЗЕН УБИТ
        global.borzen_defeated = true; 
        
        // Плавный переход (если используешь obj_screen_fade)
        if (instance_exists(obj_screen_fade)) {
            var _f = instance_create_depth(0, 0, -9999, obj_screen_fade);
            _f.alpha = 0;
            _f.target_alpha = 1;
            _f.next_room = rm_boss_borzen; 
        } else {
            room_goto(rm_boss_borzen); 
        }
        
        instance_destroy();
    }
}