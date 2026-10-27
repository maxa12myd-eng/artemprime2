// Черный фон
draw_set_alpha(1);
draw_set_color(c_black);
draw_rectangle(0, 0, 640, 360, false);

draw_set_font(fnt_undertale);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Заголовок
draw_set_color(c_yellow);
draw_text_transformed(320, 50, "НАСТРОЙКИ", 1.5, 1.5, 0);

// Пункты меню (жестко по Y)
draw_set_color(menu_index == 0 ? c_yellow : c_white);
draw_text(320, 120, "ГРОМКОСТЬ: " + string(round(volume * 100)) + "%");

draw_set_color(menu_index == 1 ? c_yellow : c_white);
var _fs_text = global.is_borderless ? "ВКЛ" : "ВЫКЛ";
draw_text(320, 160, "ПОЛНЫЙ ЭКРАН: " + _fs_text);

draw_set_color(menu_index == 2 ? c_yellow : c_white);
draw_text(320, 200, "УПРАВЛЕНИЕ");

draw_set_color(menu_index == 3 ? c_yellow : c_white);
draw_text(320, 240, "НАЗАД");

// Подсказка управления
if (menu_index == 2) {
    draw_set_color(c_gray);
    draw_text_transformed(320, 280, "WASD / Стрелки - ходьба", 0.7, 0.7, 0);
    draw_text_transformed(320, 300, "Enter / Z - подтвердить", 0.7, 0.7, 0);
    draw_text_transformed(320, 320, "F2 - дебаг (телепорт)", 0.7, 0.7, 0);
}

draw_set_color(c_white);
draw_text_transformed(320, 340, "Стрелки - выбор, Enter - изменить, ESC - назад", 0.5, 0.5, 0);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);