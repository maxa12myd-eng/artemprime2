// Уменьшаем таймер задержки с каждым кадром
if (cooldown > 0) cooldown -= 1;

if (instance_exists(obj_artem_player)) {
    var _dist = point_distance(x, y, obj_artem_player.x, obj_artem_player.y);
    
    // Если Артём близко, диалога еще нет и задержка прошла
    if (_dist < 100 && !instance_exists(obj_dialogue_npc) && cooldown == 0) {
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("E"))) {
            
            global.cutscene = true;
            instance_create_depth(0, 0, -1000, obj_dialogue_npc);
            
            // Ставим кулдаун 30 кадров (полсекунды), чтобы не было бесконечного диалога
            cooldown = 30; 
        }
    }
}