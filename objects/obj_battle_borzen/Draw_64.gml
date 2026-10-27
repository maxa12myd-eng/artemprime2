draw_set_color(c_black);
draw_rectangle(0, 0, 640, 360, false);

draw_set_font(fnt_undertale);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Спрайт Борзена
if (sprite_exists(spr_borzen_human)) {
    draw_sprite_stretched(spr_borzen_human, 0, 320 - 60, 20, 120, 120);
}

// Имя и HP Борзена
draw_set_color(c_white);
draw_text(320, 150, "БОРЗЕН");
draw_set_color(c_red);
draw_rectangle(240, 165, 400, 175, false);
draw_set_color(c_lime);
draw_rectangle(240, 165, 240 + (160 * (max(0, enemy_hp) / enemy_max_hp)), 175, false);

// Рамка
draw_set_color(c_black);
draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, false);
draw_set_color(c_white);
draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, true);
draw_rectangle(box_x + 4, box_y + 4, box_x + box_w - 4, box_y + box_h - 4, true);

// Статы игрока
draw_set_halign(fa_left);
draw_set_color(c_white);
draw_text(20, box_y + box_h + 15, "АРТЁМ  LV 2"); 
draw_set_color(c_yellow);
draw_text(180, box_y + box_h + 15, "HP");
draw_set_color(c_white);
draw_text(220, box_y + box_h + 15, string(player_hp) + " / " + string(player_max_hp));
draw_set_color(c_yellow);
draw_rectangle(20, box_y + box_h + 35, 20 + (player_hp * 5), box_y + box_h + 41, false);
draw_set_color(c_white);
draw_rectangle(20, box_y + box_h + 35, 20 + (player_max_hp * 5), box_y + box_h + 41, true);

// Кнопки
if (state == "menu" || state == "fight" || state == "dialog" || state == "action" || state == "death_dialog") {
    var _sprites = [spr_btn_fight, spr_btn_act, spr_btn_item, spr_btn_mercy];
    var _btn_y = 360 - 40;
    var _total_w = 0;
    for (var i = 0; i < 4; i++) _total_w += sprite_get_width(_sprites[i]) * 0.5 + 10;
    var _cur_x = (640 - _total_w + 10) / 2;
    
    for (var i = 0; i < 4; i++) {
        var _col = (i == menu_index) ? c_yellow : c_white;
        var _s = (i == menu_index) ? 0.55 : 0.5;
        draw_sprite_ext(_sprites[i], 0, _cur_x, _btn_y, _s, _s, 0, _col, 1);
        _cur_x += sprite_get_width(_sprites[i]) * 0.5 + 10;
    }
}

// ACT
if (state == "action") {
    draw_set_color(c_black);
    draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, false);
    draw_set_color(c_white);
    draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, true);
    draw_set_halign(fa_center);
    for (var i = 0; i < array_length(action_options); i++) {
        var _col = (i == action_index) ? c_yellow : c_white;
        draw_set_color(_col);
        draw_text(320, box_y + 30 + i * 25, action_options[i]);
    }
}

// FIGHT METER (УВЕЛИЧЕННЫЙ)
if (state == "fight") {
    if (sprite_exists(spr_fight_bar_bg)) {
        var _bar_scale = 2.0; // <--- ВОТ ТУТ МЕНЯЙ РАЗМЕР (2.0 = в 2 раза больше)
        
        // Вычисляем новые размеры
        var _bar_w = sprite_get_width(spr_fight_bar_bg) * _bar_scale;
        var _bar_h = sprite_get_height(spr_fight_bar_bg) * _bar_scale;
        
        // Центрируем внутри рамки боя
        var _bar_x = box_x + (box_w - _bar_w) / 2;
        var _bar_y = box_y + (box_h - _bar_h) / 2;
        
        // Рисуем увеличенный спрайт полоски
        draw_sprite_ext(spr_fight_bar_bg, 0, _bar_x, _bar_y, _bar_scale, _bar_scale, 0, c_white, 1);
        
        // Рисуем движущуюся линию (она тоже подстроится под ширину)
        var _line_x = _bar_x + (_bar_w * (fight_pos / 100));
        draw_set_color(c_white);
        draw_rectangle(_line_x - 2, _bar_y, _line_x + 2, _bar_y + _bar_h, false);
    }
}

// ДИАЛОГ
if (state == "dialog" || state == "death_dialog") {
    draw_set_color(c_black);
    draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, false);
    draw_set_color(c_white);
    draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, true);
    draw_set_halign(fa_center);
    draw_text_ext(320, box_y + box_h/2, monster_dialog, 20, box_w - 40);
}

// ПОБЕДА
if (state == "win") {
    draw_set_halign(fa_center);
    draw_set_color(c_yellow);
    draw_text(320, box_y + 40, "БОРЗЕН ПОВЕРЖЕН!");
    draw_set_color(c_white);
    draw_text(320, box_y + 70, "[ Нажми ENTER ]");
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);