draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);

draw_set_font(fnt_undertale);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Монстр
if (sprite_exists(spr_dirt_monster)) {
    draw_sprite_stretched(spr_dirt_monster, 0, (room_width / 2) - 60, 20, 120, 120);
}

// Имя и HP врага
draw_set_color(c_white);
draw_text(room_width / 2, 150, "ГРЯЗНЫЙ МОНСТР");
draw_set_color(c_red);
draw_rectangle(room_width / 2 - 80, 165, room_width / 2 + 80, 175, false);
draw_set_color(c_lime);
draw_rectangle(room_width / 2 - 80, 165, room_width / 2 - 80 + (160 * (max(0, enemy_hp) / 5)), 175, false);

// Рамка (черная заливка, сетка, белые края)
draw_set_color(c_black);
draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, false);
draw_set_color(c_dkgray);
for (var i = box_x; i <= box_x + box_w; i += 40) draw_line(i, box_y, i, box_y + box_h);
for (var j = box_y; j <= box_y + box_h; j += 40) draw_line(box_x, j, box_x + box_w, j);
draw_set_color(c_white);
draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, true);
draw_rectangle(box_x + 4, box_y + 4, box_x + box_w - 4, box_y + box_h - 4, true);

// Статы игрока
draw_set_halign(fa_left);
draw_set_color(c_white);
draw_text(20, box_y + box_h + 15, "АРТЁМ  LV 1");
draw_set_color(c_yellow);
draw_text(180, box_y + box_h + 15, "HP");
draw_set_color(c_white);
draw_text(220, box_y + box_h + 15, string(max(0, player_hp)) + " / 20");
draw_set_color(c_yellow);
draw_rectangle(20, box_y + box_h + 35, 20 + (max(0, player_hp) * 5), box_y + box_h + 41, false);
draw_set_color(c_white);
draw_rectangle(20, box_y + box_h + 35, 120, box_y + box_h + 41, true);

// Кнопки
if (state == "menu" || state == "fight" || state == "dialog") {
    var _sprites = [spr_btn_fight, spr_btn_act, spr_btn_item, spr_btn_mercy];
    var _btn_y = room_height - 40;
    var _total_w = 0;
    for (var i = 0; i < 4; i++) _total_w += sprite_get_width(_sprites[i]) * 0.5 + 10;
    var _cur_x = (room_width - _total_w + 10) / 2;
    
    for (var i = 0; i < 4; i++) {
        var _col = (i == menu_index) ? c_yellow : c_white;
        var _s = (i == menu_index) ? 0.55 : 0.5;
        draw_sprite_ext(_sprites[i], 0, _cur_x, _btn_y, _s, _s, 0, _col, 1);
        _cur_x += sprite_get_width(_sprites[i]) * 0.5 + 10;
    }
}

// Полоска атаки
if (state == "fight") {
    draw_set_color(c_white);
    draw_rectangle(box_x + 50, box_y + box_h/2 - 15, box_x + box_w - 50, box_y + box_h/2 + 15, true);
    draw_set_color(c_green);
    draw_rectangle(box_x + 50 + ((box_w - 100) * 0.4), box_y + box_h/2 - 15, box_x + 50 + ((box_w - 100) * 0.6), box_y + box_h/2 + 15, false);
    draw_set_color(c_red);
    var _lx = box_x + 50 + ((box_w - 100) * (fight_pos / 100));
    draw_rectangle(_lx - 2, box_y + box_h/2 - 15, _lx + 2, box_y + box_h/2 + 15, false);
}

// Диалог
if (state == "dialog") {
    draw_set_color(c_black);
    draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, false);
    draw_set_color(c_white);
    draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, true);
    draw_set_halign(fa_center);
    draw_text_ext(room_width / 2, box_y + box_h/2, monster_dialog, 20, box_w - 40);
}

// Победа/Поражение
if (state == "win" || state == "lose") {
    draw_set_halign(fa_center);
    draw_set_color(state == "win" ? c_yellow : c_red);
    draw_text(room_width / 2, box_y + 40, state == "win" ? "ПОБЕДА!" : "ТЫ ПРОИГРАЛ...");
    draw_set_color(c_white);
    draw_text(room_width / 2, box_y + 70, "[ ENTER ]");
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);