// Если Артём близко, показываем подсказку и ждем Enter
if (instance_exists(obj_artem_player) && !global.cutscene) {
    var _dist = point_distance(x, y, obj_artem_player.x, obj_artem_player.y);
    
    if (_dist < 60) {
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("E"))) {
            global.cutscene = true;
            
            // Создаем маленькое облачко с текстом "..."
            var _bubble = instance_create_depth(x, y - 60, -800, obj_thought_bubble);
            _bubble.text = "...";
            _bubble.timer = 120; // Висит 2 секунды
            
            // Разморозка через таймер (чтобы игрок мог уйти)
            alarm[0] = 120; 
        }
    }
}