// 1. РИСУЕМ УМЕНЬШЕННЫЙ СПРАЙТ НАВЕРХУ
if (sprite_exists(spr_game_over_bg)) {
    // Масштаб 0.7 (уменьшает спрайт). Если хочешь еще меньше - ставь 0.5 или 0.6
    var _scale = 0.7; 
    
    // Вычисляем ширину и высоту уменьшенного спрайта
    var _w = sprite_get_width(spr_game_over_bg) * _scale;
    var _h = sprite_get_height(spr_game_over_bg) * _scale;
    
    // Центрируем по горизонтали (X) и прижимаем к верху (Y = 20)
    var _x = (640 - _w) / 2; 
    var _y = 20; 
    
    draw_sprite_ext(spr_game_over_bg, 0, _x, _y, _scale, _scale, 0, c_white, 1);
} else {
    // Если спрайта нет - черный фон
    draw_set_color(c_black);
    draw_rectangle(0, 0, 640, 360, false);
}

draw_set_font(fnt_undertale);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// 2. ТВОЙ ТЕКСТ ПРО ПИПИДАСТР (В самом низу)
var _visible_text = string_copy(text, 1, floor(text_pos));
draw_set_color(c_white);
// Текст стоит на Y = 280 (под уменьшенным спрайтом)
draw_text_ext_transformed(320, 280, _visible_text, 24, 550, 1.0, 1.0, 0);

// 3. ПОДСКАЗКА (Еще ниже)
if (finished) {
    if (floor(current_time / 400) mod 2 == 0) {
        draw_set_color(c_yellow);
        draw_text_transformed(320, 340, "[ Нажми ENTER ]", 0.8, 0.8, 0);
    }
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);