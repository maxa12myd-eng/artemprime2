// Находим контроллер камеры
var _cam = instance_find(obj_camera, 0);

if (instance_exists(_cam)) {
    // Переключаем цель камеры на маркер
    _cam.target = obj_camera_target;
}