if (global.cutscene) exit;
// Заморозка во время катсцены
if (global.cutscene) {
    sprite_index = spr_artem_forward;
    image_xscale = 0.35;
    image_yscale = 0.35;
    exit;
}
// Если идёт катсцена — Артём замер
if (global.cutscene) {
    sprite_index = spr_artem_forward;
    image_xscale = 0.35;
    image_yscale = 0.35;
    exit;
}

var _spd = 3;

var _move_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _move_left  = keyboard_check(vk_left)  || keyboard_check(ord("A"));
var _move_down  = keyboard_check(vk_down)  || keyboard_check(ord("S"));
var _move_up    = keyboard_check(vk_up)    || keyboard_check(ord("W"));

var _hmove = _move_right - _move_left;
var _vmove = _move_down - _move_up;

if (!place_meeting(x + _hmove * _spd, y, obj_wall)) x += _hmove * _spd;
if (!place_meeting(x, y + _vmove * _spd, obj_wall)) y += _vmove * _spd;

var _scale = 0.35;
image_yscale = _scale;

if (_hmove != 0) {
    sprite_index = spr_artem_side;
    image_xscale = -_hmove * _scale;
} 
else if (_vmove != 0) {
    image_xscale = _scale;
    if (_vmove > 0) sprite_index = spr_artem_forward;
    else            sprite_index = spr_artem_up;
} 
else {
    image_xscale = _scale;
}