// Черный фон
draw_set_color(c_black);
draw_rectangle(0, 0, 640, 360, false);

draw_set_font(fnt_undertale);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Заголовок
draw_set_color(c_yellow);
draw_text(320, 25, "ВЫБОР ЛОКАЦИИ");

// Список
draw_set_halign(fa_left);
var _start_y = 60;
var _step_y = 22; // Уменьшили, чтобы всё влезло

for (var i = 0; i < count; i++) {
    var _y = _start_y + i * _step_y;
    
    if (i == menu_index) {
        draw_set_color(c_yellow);
        draw_text(80, _y, "> " + names[i] + " <");
    } else {
        draw_set_color(c_white);
        draw_text(80, _y, names[i]);
    }
}

// Подсказка внизу
draw_set_halign(fa_center);
draw_set_color(c_gray);
draw_text(320, 340, "Стрелки - выбор, ENTER - играть, ESC - назад");

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);