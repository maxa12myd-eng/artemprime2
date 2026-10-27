// Кого сейчас преследует камера
target = obj_artem_player; 

// Текущая позиция камеры (для плавности)
cam_x = 0;
cam_y = 0;

// Скорость догона (чем меньше, тем плавнее и медленнее)
smooth_speed = 0.08; 

// Сразу ставим камеру на цель, чтобы не было рывка при старте
if (instance_exists(target)) {
    cam_x = target.x - camera_get_view_width(view_camera[0]) / 2;
    cam_y = target.y - camera_get_view_height(view_camera[0]) / 2;
}