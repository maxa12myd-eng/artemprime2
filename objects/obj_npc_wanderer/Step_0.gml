if (cooldown > 0) cooldown -= 1;

if (instance_exists(obj_artem_player)) {
    var _dist = point_distance(x, y, obj_artem_player.x, obj_artem_player.y);
    
    if (_dist < 100 && !instance_exists(obj_dialogue_wanderer) && cooldown == 0) {
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("E"))) {
            
            global.cutscene = true;
            instance_create_depth(0, 0, -1000, obj_dialogue_wanderer);
            
            cooldown = 30; 
        }
    }
}