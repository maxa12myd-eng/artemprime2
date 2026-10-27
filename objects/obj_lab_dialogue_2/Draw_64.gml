var _current = dialog_lines[dialog_index];

var _box_w = 480;
var _box_h = 140;
var _box_x = (640 - _box_w) / 2;
var _box_y = 200;

// Черный фон окна
draw_set_alpha(0.9);
draw_set_color(c_black);
draw_rectangle(_box_x, _box_y, _box_x + _box_w, _box_y + _box_h, false);
draw_set_alpha(1);

// Белая рамка
draw_set_color(c_white);
draw_rectangle(_box_x, _box_y, _box_x + _box_w, _box_y + _box_h, true);
draw_rectangle(_box_x + 4, _box_y + 4, _box_x + _box_w - 4, _box_y + _box_h - 4, true);

// Шрифт
draw_set_font(fnt_undertale);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Имя
var _name = "";
if (_current.who == "artem") _name = "АРТЁМ";
if (_current.who == "evil_mahmud") _name = "ЗЛОЙ МАХМУД";
if (_current.who == "zheka_t3000") _name = "ЖЕКА T-3000";

if (_name != "") {
    draw_set_color(c_yellow);
    draw_text_transformed(_box_x + 10, _box_y - 25, _name, 1.2, 1.2, 0);
}

// Текст
var _visible_text = string_copy(_current.text, 1, floor(type_pos));
draw_set_color(c_white);
draw_text_ext_transformed(_box_x + 20, _box_y + 20, _visible_text, 22, _box_w - 40, 1.0, 1.0, 0);

// Стрелка
if (done_typing && dialog_index < array_length(dialog_lines) - 1) {
    if (floor(current_time / 400) mod 2 == 0) {
        draw_set_color(c_yellow);
        draw_text_transformed(_box_x + _box_w - 30, _box_y + _box_h - 30, "V", 1.2, 1.2, 0);
    }
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);