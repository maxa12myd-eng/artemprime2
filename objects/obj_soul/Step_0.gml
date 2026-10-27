// Если бой пропал - удаляем сердце
if (!instance_exists(obj_battle)) { 
    instance_destroy(); 
    exit; 
}

// Мигание при уроне
if (invincible > 0) {
    invincible -= 1;
    image_blend = c_red;
} else {
    image_blend = c_white;
}

// Движение стрелочками или WASD
var _spd = 2.5;
var _h = (keyboard_check(vk_right) || keyboard_check(ord("D"))) - (keyboard_check(vk_left) || keyboard_check(ord("A")));
var _v = (keyboard_check(vk_down) || keyboard_check(ord("S"))) - (keyboard_check(vk_up) || keyboard_check(ord("W")));

x += _h * _spd;
y += _v * _spd;

// Жестко держим внутри рамки
x = clamp(x, obj_battle.box_x + 10, obj_battle.box_x + obj_battle.box_w - 10);
y = clamp(y, obj_battle.box_y + 10, obj_battle.box_y + obj_battle.box_h - 10);