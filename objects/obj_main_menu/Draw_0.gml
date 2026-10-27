// Фон меню (если используется картинка)
if (sprite_exists(spr_menu_bg)) {
    draw_sprite_ext(spr_menu_bg, 0, 0, 0,
        room_width  / sprite_get_width(spr_menu_bg),
        room_height / sprite_get_height(spr_menu_bg),
        0, c_white, 1);
} else {
    draw_set_color(c_black);
    draw_rectangle(0, 0, room_width, room_height, false);
}

// Затемнение фона, чтобы текст читался
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);

// Настройки шрифта
draw_set_font(fnt_undertale);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Заголовок
draw_set_color(c_black);
draw_text_transformed(room_width / 2 + 2, 42, "ХРОНИКИ АРТЁМА ПРАЙМА", 1.2, 1.2, 0);
draw_set_color(c_yellow);
draw_text_transformed(room_width / 2, 40, "ХРОНИКИ АРТЁМА ПРАЙМА", 1.2, 1.2, 0);

// Подзаголовок
draw_set_color(c_white);
draw_text_transformed(room_width / 2, 70, "- ГЛАВНОЕ МЕНЮ -", 0.8, 0.8, 0);

// Пункты меню
var _y_start = 120;
var _y_step  = 40;
var _items   = ["ИГРАТЬ", "ЛОКАЦИИ", "НАСТРОЙКИ", "ВЫХОД"];

for (var i = 0; i < menu_count; i++) {
    var _y = _y_start + i * _y_step;
    
    if (i == menu_index) {
        // Выбранный пункт (желтый, с тенями и стрелочками)
        draw_set_color(c_black);
        draw_text_transformed(room_width / 2 + 1, _y + 1, "> " + _items[i] + " <", 1.0, 1.0, 0);
        draw_set_color(c_yellow);
        draw_text_transformed(room_width / 2, _y, "> " + _items[i] + " <", 1.0, 1.0, 0);
    } else {
        // Обычный пункт (серый)
        draw_set_color(c_black);
        draw_text_transformed(room_width / 2 + 1, _y + 1, _items[i], 0.9, 0.9, 0);
        draw_set_color(c_gray);
        draw_text_transformed(room_width / 2, _y, _items[i], 0.9, 0.9, 0);
    }
}

// Подсказка внизу
draw_set_color(c_black);
draw_text_transformed(room_width / 2 + 1, room_height - 17, "WASD / Стрелки - выбор    Enter / E - OK", 0.55, 0.55, 0);
draw_set_color(c_ltgray);
draw_text_transformed(room_width / 2, room_height - 18, "WASD / Стрелки - выбор    Enter / E - OK", 0.55, 0.55, 0);

// Сброс выравнивания
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);