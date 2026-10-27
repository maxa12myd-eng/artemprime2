if (shake_timer > 0) shake_timer -= 1;
if (hp_visible_timer > 0) hp_visible_timer -= 1;

// 1. МЕНЮ
if (state == "menu") {
    if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"))) menu_index = (menu_index - 1 + 4) mod 4;
    if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"))) menu_index = (menu_index + 1) mod 4;
    
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) {
        if (menu_index == 0) { state = "fight"; fight_pos = 0; fight_dir = 1; }
        else if (menu_index == 1) { state = "action"; action_index = 0; }
        else if (menu_index == 2) { 
            player_hp = min(player_max_hp, player_hp + 10); 
            monster_dialog = "Ты съел Доширак. +10 HP!"; 
            state = "dialog"; 
        }
        else if (menu_index == 3) { 
            monster_dialog = "Гладков: Меня нельзя пощадить!"; 
            state = "dialog"; 
        }
        exit;
    }
}

// 2. ДЕЙСТВИЯ
if (state == "action") {
    if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"))) action_index = max(0, action_index - 1);
    if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"))) action_index = min(2, action_index + 1);
    
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) {
        if (action_index == 0) monster_dialog = "Гладков: Чипсы 5G - пища богов!";
        else if (action_index == 1) monster_dialog = "Гладков: Борзен был слабаком.";
        else if (action_index == 2) monster_dialog = "Гладков: Это запах свободы!";
        state = "dialog";
        exit;
    }
}

// 3. FIGHT METER
if (state == "fight") {
    if (!fight_hit) {
        fight_pos += fight_speed * fight_dir;
        if (fight_pos >= 100 || fight_pos <= 0) fight_dir *= -1;
        
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) {
            fight_hit = true; 
            if (audio_exists(snd_slash)) audio_play_sound(snd_slash, 10, false);
            shake_timer = 15; 
            hp_visible_timer = 120; 
            
            if (fight_pos >= 45 && fight_pos <= 55) { enemy_hp -= 5; monster_dialog = "КРИТ! (-5 HP)"; }
            else if (fight_pos >= 30 && fight_pos <= 70) { enemy_hp -= 3; monster_dialog = "Удар! (-3 HP)"; }
            else { enemy_hp -= 1; monster_dialog = "Промах..."; }
            
            alarm[0] = 30; 
        }
    }
}

// 4. ДИАЛОГ И ПЕРЕХОД В АЛЬФУ
if (state == "dialog") {
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) {
        if (enemy_hp <= 0 && !is_alpha) {
            if (phase2_dialog_index == 0) {
                audio_stop_all();
                if (audio_exists(snd_oh_my)) audio_play_sound(snd_oh_my, 15, false);
            }
            if (phase2_dialog_index < array_length(phase2_dialog)) {
                monster_dialog = phase2_dialog[phase2_dialog_index];
                phase2_dialog_index += 1;
            } else {
                state = "phase2_transform";
                transform_timer = 300; 
                with(obj_fat_bullet) instance_destroy();
                with(obj_bone_bullet) instance_destroy();
                with(obj_doshirak_bullet) instance_destroy();
                with(obj_chips_bullet) instance_destroy();
                with(obj_parkour_platform) instance_destroy();
                with(obj_soul_gladkov) instance_destroy();
            }
        }
        else if (enemy_hp > 0) {
            state = "enemy_turn";
            attack_timer = 300; 
            spawn_timer = 0;
            var _pick = irandom(array_length(attack_bag) - 1);
            pattern = attack_bag[_pick];
            array_delete(attack_bag, _pick, 1);
            instance_create_depth(box_x + box_w/2, box_y + box_h/2, -200, obj_soul_gladkov);
        }
        else if (enemy_hp <= 0 && is_alpha) {
            state = "win";
        }
        exit;
    }
}

// ТРАНСФОРМАЦИЯ
if (state == "phase2_transform") {
    transform_timer -= 1;
    if (transform_timer < 240) {
        white_fade += 0.01; 
        if (white_fade > 1) white_fade = 1;
    }
    if (transform_timer == 180) {
        if (audio_exists(snd_neo_theme)) {
            audio_stop_all();
            audio_play_sound(snd_neo_theme, 15, true);
        }
    }
    if (transform_timer <= 0) {
        state = "menu"; 
        is_alpha = true;
        enemy_max_hp = 35; 
        enemy_hp = 35;
        white_fade = 0;
        attack_bag = [6, 7, 8, 9, 10, 11, 12]; 
        monster_dialog = "";
    }
    exit;
}

// 5. АТАКИ
if (state == "enemy_turn") {
    attack_timer -= 1;
    spawn_timer -= 1;
    
    if (player_hp <= 0) {
        with(obj_fat_bullet) instance_destroy();
        with(obj_bone_bullet) instance_destroy();
        with(obj_doshirak_bullet) instance_destroy();
        with(obj_chips_bullet) instance_destroy();
        with(obj_parkour_platform) instance_destroy();
        with(obj_soul_gladkov) instance_destroy();
        room_goto(rm_game_over); exit;
    }
    
    if (spawn_timer <= 0 && attack_timer > 0) {
        var _b; var i;
        
        if (pattern == 0) {
            _b = instance_create_depth(box_x + irandom(box_w), box_y - 30, -100, obj_fat_bullet);
            if (instance_exists(_b)) { _b.speed = 6; _b.direction = 270; }
            spawn_timer = 6; 
        }
        else if (pattern == 1) {
            _b = instance_create_depth(box_x - 30, box_y + irandom(box_h), -100, obj_bone_bullet);
            if (instance_exists(_b)) { _b.speed = 8; _b.direction = 0; }
            _b = instance_create_depth(box_x + box_w + 30, box_y + irandom(box_h), -100, obj_bone_bullet);
            if (instance_exists(_b)) { _b.speed = 8; _b.direction = 180; }
            spawn_timer = 12; 
        }
        else if (pattern == 2) {
            if (instance_exists(obj_soul_gladkov)) {
                _b = instance_create_depth(box_x + irandom(box_w), box_y - 20, -100, obj_doshirak_bullet);
                if (instance_exists(_b)) { _b.speed = 3.5; _b.direction = point_direction(_b.x, _b.y, obj_soul_gladkov.x, obj_soul_gladkov.y); }
            }
            spawn_timer = 15;
        }
        else if (pattern == 3) {
            _b = instance_create_depth(box_x + irandom(box_w - 100), box_y - 30, -90, obj_parkour_platform);
            if (instance_exists(_b)) { _b.speed = 3; _b.direction = 270; }
            _b = instance_create_depth(box_x - 30, box_y + irandom(box_h), -100, obj_bone_bullet);
            if (instance_exists(_b)) { _b.speed = 6; _b.direction = 0; }
            _b = instance_create_depth(box_x + box_w + 30, box_y + irandom(box_h), -100, obj_bone_bullet);
            if (instance_exists(_b)) { _b.speed = 6; _b.direction = 180; }
            spawn_timer = 40; 
        }
        else if (pattern == 4) {
            var _cx = box_x + box_w/2; var _cy = box_y + box_h/2; var _ang = (300 - attack_timer) * 18; 
            _b = instance_create_depth(_cx, _cy, -100, obj_bone_bullet);
            if (instance_exists(_b)) { _b.speed = 5; _b.direction = _ang; }
            spawn_timer = 4; 
        }
        else if (pattern == 5) {
            for (i = 0; i < 3; i++) {
                _b = instance_create_depth(box_x + (box_w / 2) - 40 + (i * 40), box_y - 30, -100, obj_chips_bullet);
                if (instance_exists(_b)) { _b.speed = 7; _b.direction = 270 + irandom_range(-15, 15); }
            }
            spawn_timer = 25; 
        }
        else if (pattern == 6) {
            for (i = 0; i < 12; i++) {
                _b = instance_create_depth(box_x + box_w/2, box_y + box_h/2, -100, obj_chips_bullet);
                if (instance_exists(_b)) { _b.direction = i * 30; _b.speed = 4; }
            }
            spawn_timer = 60;
        }
        else if (pattern == 7) {
            if (instance_exists(obj_soul_gladkov)) {
                _b = instance_create_depth(box_x + irandom(box_w), box_y - 20, -100, obj_doshirak_bullet);
                if (instance_exists(_b)) { _b.speed = 6; _b.direction = point_direction(_b.x, _b.y, obj_soul_gladkov.x, obj_soul_gladkov.y); }
            }
            spawn_timer = 10;
        }
        else if (pattern == 8) {
            var _cx = box_x + box_w/2; var _cy = box_y + box_h/2; var _ang = (300 - attack_timer) * 25; 
            _b = instance_create_depth(_cx, _cy, -100, obj_bone_bullet);
            if (instance_exists(_b)) { _b.speed = 6; _b.direction = _ang; }
            _b = instance_create_depth(_cx, _cy, -100, obj_bone_bullet);
            if (instance_exists(_b)) { _b.speed = 6; _b.direction = _ang + 180; }
            spawn_timer = 6;
        }
        else if (pattern == 9) {
            _b = instance_create_depth(box_x + irandom(box_w - 100), box_y - 30, -90, obj_parkour_platform);
            if (instance_exists(_b)) { _b.speed = 6; _b.direction = 270; }
            _b = instance_create_depth(box_x - 30, box_y + irandom(box_h), -100, obj_bone_bullet);
            if (instance_exists(_b)) { _b.speed = 10; _b.direction = 0; }
            _b = instance_create_depth(box_x + box_w + 30, box_y + irandom(box_h), -100, obj_bone_bullet);
            if (instance_exists(_b)) { _b.speed = 10; _b.direction = 180; }
            spawn_timer = 30;
        }
        else if (pattern == 10) {
            var _cx = box_x + box_w/2; var _cy = box_y + box_h/2;
            for (i = 0; i < 4; i++) {
                _b = instance_create_depth(_cx, _cy, -100, obj_bone_bullet);
                if (instance_exists(_b)) { _b.speed = 5; _b.direction = i * 90; }
            }
            spawn_timer = 15; 
        }
        else if (pattern == 11) {
            _b = instance_create_depth(box_x + irandom(box_w), box_y - 20, -100, obj_chips_bullet);
            if (instance_exists(_b)) { _b.speed = 8; _b.direction = 270; }
            _b = instance_create_depth(box_x + irandom(box_w), box_y - 20, -100, obj_doshirak_bullet);
            if (instance_exists(_b)) { _b.speed = 4; _b.direction = 270; }
            spawn_timer = 10; 
        }
        else if (pattern == 12) {
            var _gap_y = box_y + irandom_range(30, box_h - 30); 
            for (i = 0; i < 10; i++) {
                var _spawn_y = box_y + (i * (box_h / 10));
                if (abs(_spawn_y - _gap_y) > 25) {
                    _b = instance_create_depth(box_x - 20, _spawn_y, -100, obj_fat_bullet);
                    if (instance_exists(_b)) { _b.speed = 7; _b.direction = 0; }
                }
            }
            spawn_timer = 60; 
        }
    }
    
    if (attack_timer <= 0) {
        with(obj_fat_bullet) instance_destroy();
        with(obj_bone_bullet) instance_destroy();
        with(obj_doshirak_bullet) instance_destroy();
        with(obj_chips_bullet) instance_destroy();
        with(obj_parkour_platform) instance_destroy();
        with(obj_soul_gladkov) instance_destroy();
        state = "menu";
        exit;
    }
}

// 6. ПОБЕДА
if (state == "win") {
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"))) {
        with(obj_fat_bullet) instance_destroy();
        with(obj_bone_bullet) instance_destroy();
        with(obj_doshirak_bullet) instance_destroy();
        with(obj_chips_bullet) instance_destroy();
        with(obj_parkour_platform) instance_destroy();
        with(obj_soul_gladkov) instance_destroy();
        room_goto(rm_game_menu); 
    }
}