var _current = dialog_lines[dialog_index];

// Получаем размеры экрана
var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

// Делаем окно огромным (на 80% ширины экрана)
var _box_w = _gui_w * 0.8;
var _box_h = 180;
var _box_x = (_gui_w - _box_w) / 2; // Центрируем по горизонтали
var _box_y = _gui_h - _box_h - 40;  // Прижимаем к низу

// Фон окна (черный, полупрозрачный)
draw_set_alpha(0.85);
draw_set_color(c_black);
draw_rectangle(_box_x, _box_y, _box_x + _box_w, _box_y + _box_h, false);
draw_set_alpha(1);

// Двойная белая рамка
draw_set_color(c_white);
draw_rectangle(_box_x, _box_y, _box_x + _box_w, _box_y + _box_h, true);
draw_rectangle(_box_x + 5, _box_y + 5, _box_x + _box_w - 5, _box_y + _box_h - 5, true);

// Настройки шрифта
draw_set_font(fnt_undertale);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Имя говорящего
var _name = "";
if (_current.who == "artem") _name = "АРТЁМ";
if (_current.who == "survivor") _name = "ВЫЖИВШИЙ";

if (_name != "") {
    draw_set_color(c_yellow);
    draw_text_transformed(_box_x + 25, _box_y - 25, _name, 1.5, 1.5, 0);
}

// Текст (увеличенный)
var _visible_text = string_copy(_current.text, 1, floor(type_pos));
draw_set_color(c_white);
// Масштаб 1.5 делает текст в 1.5 раза больше
draw_text_ext_transformed(_box_x + 25, _box_y + 25, _visible_text, 28, _box_w - 50, 1.5, 1.5, 0);

// Мигающая стрелка внизу
if (done_typing && dialog_index < array_length(dialog_lines) - 1) {
    if (floor(current_time / 400) mod 2 == 0) {
        draw_set_color(c_yellow);
        draw_text_transformed(_box_x + _box_w - 40, _box_y + _box_h - 40, "V", 1.5, 1.5, 0);
    }
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);