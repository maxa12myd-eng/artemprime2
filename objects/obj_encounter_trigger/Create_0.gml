// Если глобального массива нет - создаем
if (!variable_global_exists("defeated_triggers")) {
    global.defeated_triggers = [];
}

// Получаем ID этого конкретного триггера
var _my_id = string(x) + "_" + string(y);
var _is_defeated = false;

// Проверяем, есть ли наш ID в списке побежденных
for (var i = 0; i < array_length(global.defeated_triggers); i++) {
    if (global.defeated_triggers[i] == _my_id) {
        _is_defeated = true;
        break;
    }
}

// Если этот конкретный триггер уже побежден - удаляем его
if (_is_defeated) {
    instance_destroy();
}