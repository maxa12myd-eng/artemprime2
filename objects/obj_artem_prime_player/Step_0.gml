// УХОД В ПОРТАЛ
if (leaving) {
    x = lerp(x, leave_target_x, 0.05);
    y = lerp(y, leave_target_y, 0.05);
    
    image_xscale = lerp(image_xscale, 0, 0.05);
    image_yscale = lerp(image_yscale, 0, 0.05);
    image_alpha -= 0.03;
    
    if (image_alpha <= 0.05) instance_destroy();
    exit;
}

// Заморозка во время катсцены
if (global.cutscene) exit;

var _spd = 3;

var _move_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _move_left  = keyboard_check(vk_left)  || keyboard_check(ord("A"));
var _move_down  = keyboard_check(vk_down)  || keyboard_check(ord("S"));
var _move_up    = keyboard_check(vk_up)    || keyboard_check(ord("W"));

var _hmove = _move_right - _move_left;
var _vmove = _move_down - _move_up;

if (!place_meeting(x + _hmove * _spd, y, obj_wall)) x += _hmove * _spd;
if (!place_meeting(x, y + _vmove * _spd, obj_wall)) y += _vmove * _spd;

x = clamp(x, 32, room_width - 32);
y = clamp(y, 32, room_height - 32);

// СМЕНА СПРАЙТОВ
if (_hmove != 0) {
    sprite_index = spr_artem_prime_side;
    image_xscale = -_hmove * 1.5;
    image_yscale = 1.5;
} 
else if (_vmove > 0) {
    sprite_index = spr_artem_prime;
    image_xscale = 1.5;
    image_yscale = 1.5;
} 
else if (_vmove < 0) {
    sprite_index = spr_artem_prime_up;
    image_xscale = 1.5;
    image_yscale = 1.5;
}