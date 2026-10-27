var _current = dialog_lines[dialog_index];

// Размеры окна (классический Undertale-стиль)
var _box_x = 20;
var _box_y = 220; // Окно внизу
var _box_w = 600; // Ширина на весь экран
var _box_h = 120; // Высота умеренная

// 1. Черный фон окна
draw_set_alpha(0.9);
draw_set_color(c_black);
draw_rectangle(_box_x, _box_y, _box_x + _box_w, _box_y + _box_h, false);
draw_set_alpha(1);

// 2. Белая двойная рамка
draw_set_color(c_white);
draw_rectangle(_box_x, _box_y, _box_x + _box_w, _box_y + _box_h, true);
draw_rectangle(_box_x + 4, _box_y + 4, _box_x + _box_w - 4, _box_y + _box_h - 4, true);

// 3. Настройки шрифта
draw_set_font(fnt_undertale);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// 4. Имя (масштаб 1.2, стоит чуть выше рамки)
var _name = "";
if (_current.who == "artem") _name = "АРТЁМ";
if (_current.who == "evil_mahmud") _name = "ЗЛОЙ МАХМУД";
if (_current.who == "zheka_t3000") _name = "ЖЕКА T-3000";

if (_name != "") {
    draw_set_color(c_yellow);
    draw_text_transformed(_box_x + 10, _box_y - 25, _name, 1.2, 1.2, 0);
}

// 5. Сам текст (масштаб 1.0, ровно влезает в рамку)
var _visible_text = string_copy(_current.text, 1, floor(type_pos));
draw_set_color(c_white);
// 20 - отступ, 22 - межстрочный интервал, _box_w - 40 - ширина, 1.0 - масштаб шрифта
draw_text_ext_transformed(_box_x + 20, _box_y + 20, _visible_text, 22, _box_w - 40, 1.0, 1.0, 0);

// 6. Стрелочка внизу
if (done_typing && dialog_index < array_length(dialog_lines) - 1) {
    if (floor(current_time / 400) mod 2 == 0) {
        draw_set_color(c_yellow);
        draw_text_transformed(_box_x + _box_w - 30, _box_y + _box_h - 30, "V", 1.2, 1.2, 0);
    }
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);