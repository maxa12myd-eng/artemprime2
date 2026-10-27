// Если мы в комнате боя — камера не работает (чтобы не было черного экрана)
if (room == rm_battle_dirt) exit; // Отключаем камеру в бою

// Если цель существует
if (instance_exists(target)) {
    var _cam_w = camera_get_view_width(view_camera[0]);
    var _cam_h = camera_get_view_height(view_camera[0]);
    
    // Вычисляем, куда камера должна стремиться
    var _target_x = target.x - _cam_w / 2;
    var _target_y = target.y - _cam_h / 2;
    
    // Плавно перемещаем
    cam_x = lerp(cam_x, _target_x, smooth_speed);
    cam_y = lerp(cam_y, _target_y, smooth_speed);
    
    // Ограничиваем границами комнаты
    cam_x = clamp(cam_x, 0, room_width - _cam_w);
    cam_y = clamp(cam_y, 0, room_height - _cam_h);
    
    // Применяем позицию к камере
    camera_set_view_pos(view_camera[0], floor(cam_x), floor(cam_y));
}