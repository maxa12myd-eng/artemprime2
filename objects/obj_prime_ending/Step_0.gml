switch (state) {
    case "waiting":
        if (instance_exists(obj_artem_prime_player)) {
            var _dist = point_distance(x, y, obj_artem_prime_player.x, obj_artem_prime_player.y);
            if (_dist < 120) {
                state = "jumpscare_sound";
                timer = 30;
                global.cutscene = true;
                if (audio_exists(snd_chara_jumpscare)) {
                    audio_stop_all();
                    audio_play_sound(snd_chara_jumpscare, 10, false);
                }
            }
        }
        break;
    
    case "jumpscare_sound":
        timer -= 1;
        if (timer <= 0) {
            state = "blood";
            timer = 60;
            if (instance_exists(obj_zheka)) {
                instance_create_layer(obj_zheka.x, obj_zheka.y, "Instances", obj_blood);
                instance_destroy(obj_zheka);
            }
            if (instance_exists(obj_mahmud)) {
                instance_create_layer(obj_mahmud.x, obj_mahmud.y, "Instances", obj_blood);
                instance_destroy(obj_mahmud);
            }
        }
        break;
    
    case "blood":
        timer -= 1;
        if (timer <= 0) {
            state = "cleaning";
            timer = 120;
        }
        break;
    
    case "cleaning":
        timer -= 1;
        if (timer <= 0) {
            state = "portal";
            timer = 60;
            if (instance_exists(obj_blood)) {
                var _blood = instance_find(obj_blood, 0);
                instance_create_layer(_blood.x, _blood.y, "Instances", obj_portal_ending);
            }
        }
        break;
    
    case "portal":
        timer -= 1;
        if (timer <= 0 && instance_exists(obj_artem_prime_player) && !obj_artem_prime_player.leaving) {
            if (instance_exists(obj_portal_ending)) {
                obj_artem_prime_player.leave_target_x = obj_portal_ending.x;
                obj_artem_prime_player.leave_target_y = obj_portal_ending.y;
            }
            obj_artem_prime_player.leaving = true;
            timer = 180;
        }
        if (!instance_exists(obj_artem_prime_player) && timer > 0) {
            state = "end";
        }
        break;
    
    case "end":
        timer -= 1;
        if (timer <= 0) {
            room_goto(rm_black_screen);
        }
        break;
}