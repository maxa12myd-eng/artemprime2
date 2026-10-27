// ДЕБАГ: Телепорт в начало комнаты
if (keyboard_check_pressed(vk_f2)) {
    global.cutscene = false; // Размораживаем на всякий случай
    room_restart(); // Перезапускает текущую комнату
    exit; // Выходим, чтобы не сработал остальной код
}
// Заморозка во время катсцены или диалога
if (global.cutscene) exit;

var _spd = 3;

var _move_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _move_left  = keyboard_check(vk_left)  || keyboard_check(ord("A"));
var _move_down  = keyboard_check(vk_down)  || keyboard_check(ord("S"));
var _move_up    = keyboard_check(vk_up)    || keyboard_check(ord("W"));

var _hmove = _move_right - _move_left;
var _vmove = _move_down - _move_up;

// ПРОВЕРКА СТОЛКНОВЕНИЙ (стены и невидимые стены)
// ВАЖНО: obj_dirt_puddle здесь НЕТ, чтобы можно было зайти в лужу
// ПРОВЕРКА СТОЛКНОВЕНИЙ
var _blocked_h = place_meeting(x + _hmove * _spd, y, obj_wall) 
              || place_meeting(x + _hmove * _spd, y, obj_invisible_wall)
              || place_meeting(x + _hmove * _spd, y, obj_dirt_puddle); // Лужа как стена

var _blocked_v = place_meeting(x, y + _vmove * _spd, obj_wall) 
              || place_meeting(x, y + _vmove * _spd, obj_invisible_wall)
              || place_meeting(x, y + _vmove * _spd, obj_dirt_puddle); // Лужа как стена
// Двигаемся, если путь свободен
if (!_blocked_h) x += _hmove * _spd;
if (!_blocked_v) y += _vmove * _spd;

// Ограничение границами комнаты
x = clamp(x, 32, room_width - 32);
y = clamp(y, 32, room_height - 32);

// Смена спрайтов
image_yscale = my_scale;

if (_hmove != 0) {
    sprite_index = spr_artem_side;
    image_xscale = -_hmove * my_scale;
} 
else if (_vmove > 0) {
    sprite_index = spr_artem_forward;
    image_xscale = my_scale;
} 
else if (_vmove < 0) {
    sprite_index = spr_artem_up;
    image_xscale = my_scale;
}