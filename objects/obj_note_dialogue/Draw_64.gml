var _current = dialog_lines[dialog_index];

// --- НОВЫЕ РАЗМЕРЫ ОКНА ---
var _box_w = 480; // Ширина поменьше
var _box_h = 140; // Высота поменьше
var _box_x = (640 - _box_w) / 2; // Автоматически ставим по центру
var _box_y = 200; // Опускаем чуть ниже

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

// 4. Табличка "ЗАПИСКА" (уменьшили масштаб с 2 до 1.5)
draw_set_color(c_yellow);
draw_text_transformed(_box_x, _box_y - 25, "ЗАПИСКА", 1.5, 1.5, 0);

// 5. Сам текст (уменьшили масштаб с 1.5 до 1.2)
var _visible_text = string_copy(_current.text, 1, floor(type_pos));
draw_set_color(c_white);
// line_height = 22, масштаб = 1.2
draw_text_ext_transformed(_box_x + 20, _box_y + 20, _visible_text, 22, _box_w - 40, 1.2, 1.2, 0);

// 6. Мигающая стрелочка внизу
if (done_typing && dialog_index < array_length(dialog_lines) - 1) {
    if (floor(current_time / 400) mod 2 == 0) {
        draw_set_color(c_yellow);
        draw_text_transformed(_box_x + _box_w - 30, _box_y + _box_h - 30, "Enter", 1.2, 1.2, 0);
    }
}

// Сброс
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);