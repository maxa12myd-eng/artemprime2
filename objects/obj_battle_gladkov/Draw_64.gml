draw_set_color(c_black);
draw_rectangle(0, 0, 640, 360, false);
draw_set_font(fnt_undertale);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _shake_x = 0;
var _shake_y = 0;
if (shake_timer > 0) {
    _shake_x = random_range(-5, 5);
    _shake_y = random_range(-5, 5);
}

if (is_alpha) {
    draw_set_color(c_red);
    draw_text(320, 20, "ГЛАДКОВ АЛЬФА");
    if (sprite_exists(spr_gladkov_alpha)) {
        draw_sprite_stretched(spr_gladkov_alpha, 0, 320 - 60 + _shake_x, 40 + _shake_y, 120, 120);
    }
} else {
    draw_set_color(c_white);
    draw_text(320, 20, "ГЛАДКОВ МАТВЕЙ");
    if (sprite_exists(spr_gladkov)) {
        draw_sprite_stretched(spr_gladkov, 0, 320 - 60 + _shake_x, 40 + _shake_y, 120, 120);
    }
}

if (hp_visible_timer > 0) {
    var _hp_width = 200;
    var _hp_pct = max(0, enemy_hp / enemy_max_hp);
    draw_set_color(c_red);
    draw_rectangle(320 - (_hp_width/2), 125, 320 + (_hp_width/2), 135, false);
    draw_set_color(c_lime);
    draw_rectangle(320 - (_hp_width/2), 125, 320 - (_hp_width/2) + (_hp_width * _hp_pct), 135, false);
}

draw_set_color(c_black);
draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, false);
draw_set_color(c_white);
for (var i = 0; i < 3; i++) draw_rectangle(box_x + i, box_y + i, box_x + box_w - i, box_y + box_h - i, true);

draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_set_color(c_white);
draw_text(20, 270, "АРТЁМ  LV 3");
draw_set_color(c_yellow);
draw_text(160, 270, "HP");
draw_set_color(c_white);
draw_text(190, 270, string(player_hp) + " / " + string(player_max_hp));
draw_set_color(c_yellow);
draw_rectangle(20, 285, 20 + (player_hp * 4), 291, false);
draw_set_color(c_white);
draw_rectangle(20, 285, 20 + (player_max_hp * 4), 291, true);

if (state == "menu" || state == "fight" || state == "dialog" || state == "action" || state == "phase2_transform") {
    var _sprites = [spr_btn_fight, spr_btn_act, spr_btn_item, spr_btn_mercy];
    var _btn_scale = 0.5; 
    var _btn_y = 315;     
    var _spacing = 15;
    var _total_w = 0;
    for (var i = 0; i < 4; i++) _total_w += (sprite_get_width(_sprites[i]) * _btn_scale) + _spacing;
    _total_w -= _spacing;
    var _cur_x = (640 - _total_w) / 2;
    for (var i = 0; i < 4; i++) {
        var _is_selected = (i == menu_index && state == "menu");
        var _current_scale = _is_selected ? (_btn_scale * 1.2) : _btn_scale;
        var _y_offset = _is_selected ? -5 : 0; 
        var _col = _is_selected ? c_yellow : c_white;
        draw_sprite_ext(_sprites[i], 0, _cur_x, _btn_y + _y_offset, _current_scale, _current_scale, 0, _col, 1);
        _cur_x += (sprite_get_width(_sprites[i]) * _btn_scale) + _spacing;
    }
}

if (state == "fight") {
    if (sprite_exists(spr_fight_bar_bg)) {
        var _bar_scale = 2.0;
        var _bar_w = sprite_get_width(spr_fight_bar_bg) * _bar_scale;
        var _bar_h = sprite_get_height(spr_fight_bar_bg) * _bar_scale;
        var _bar_x = box_x + (box_w - _bar_w) / 2;
        var _bar_y = box_y + (box_h - _bar_h) / 2;
        draw_sprite_ext(spr_fight_bar_bg, 0, _bar_x, _bar_y, _bar_scale, _bar_scale, 0, c_white, 1);
        var _line_x = _bar_x + (_bar_w * (fight_pos / 100));
        draw_set_color(c_white);
        draw_rectangle(_line_x - 3, _bar_y, _line_x + 3, _bar_y + _bar_h, false);
    }
}

if (state == "action") {
    draw_set_color(c_black);
    draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, false);
    draw_set_color(c_white);
    draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, true);
    draw_set_halign(fa_center);
    draw_text(320, box_y + 25, "* Выбери действие:");
    for (var i = 0; i < array_length(action_options); i++) {
        var _col = (i == action_index) ? c_yellow : c_white;
        draw_set_color(_col);
        draw_text(320, box_y + 55 + i * 25, action_options[i]);
    }
}

if (state == "dialog" || state == "phase2_transform") {
    draw_set_color(c_black);
    draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, false);
    draw_set_color(c_white);
    draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, true);
    draw_set_halign(fa_center);
    draw_text_ext(320, box_y + box_h/2, monster_dialog, 20, box_w - 40);
}

if (state == "phase2_transform") {
    if (white_fade > 0) {
        draw_set_alpha(white_fade);
        draw_set_color(c_white);
        draw_rectangle(0, 0, 640, 360, false);
        draw_set_alpha(1);
    }
    if (white_fade > 0.8) {
        draw_set_color(c_black); 
        draw_text_transformed(320, 180, "ГЛАДКОВ АЛЬФА", 2.5, 2.5, 0);
        draw_text_transformed(320, 220, "ЯВИЛСЯ НА СЦЕНУ!", 1.5, 1.5, 0);
    }
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);draw_set_color(c_black);
draw_rectangle(0, 0, 640, 360, false);
draw_set_font(fnt_undertale);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _shake_x = 0;
var _shake_y = 0;
if (shake_timer > 0) {
    _shake_x = random_range(-5, 5);
    _shake_y = random_range(-5, 5);
}

if (is_alpha) {
    draw_set_color(c_red);
    draw_text(320, 20, "ГЛАДКОВ АЛЬФА");
    if (sprite_exists(spr_gladkov_alpha)) {
        draw_sprite_stretched(spr_gladkov_alpha, 0, 320 - 60 + _shake_x, 40 + _shake_y, 120, 120);
    }
} else {
    draw_set_color(c_white);
    draw_text(320, 20, "ГЛАДКОВ МАТВЕЙ");
    if (sprite_exists(spr_gladkov)) {
        draw_sprite_stretched(spr_gladkov, 0, 320 - 60 + _shake_x, 40 + _shake_y, 120, 120);
    }
}

if (hp_visible_timer > 0) {
    var _hp_width = 200;
    var _hp_pct = max(0, enemy_hp / enemy_max_hp);
    draw_set_color(c_red);
    draw_rectangle(320 - (_hp_width/2), 125, 320 + (_hp_width/2), 135, false);
    draw_set_color(c_lime);
    draw_rectangle(320 - (_hp_width/2), 125, 320 - (_hp_width/2) + (_hp_width * _hp_pct), 135, false);
}

draw_set_color(c_black);
draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, false);
draw_set_color(c_white);
for (var i = 0; i < 3; i++) draw_rectangle(box_x + i, box_y + i, box_x + box_w - i, box_y + box_h - i, true);

draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_set_color(c_white);
draw_text(20, 270, "АРТЁМ  LV 3");
draw_set_color(c_yellow);
draw_text(160, 270, "HP");
draw_set_color(c_white);
draw_text(190, 270, string(player_hp) + " / " + string(player_max_hp));
draw_set_color(c_yellow);
draw_rectangle(20, 285, 20 + (player_hp * 4), 291, false);
draw_set_color(c_white);
draw_rectangle(20, 285, 20 + (player_max_hp * 4), 291, true);

if (state == "menu" || state == "fight" || state == "dialog" || state == "action" || state == "phase2_transform") {
    var _sprites = [spr_btn_fight, spr_btn_act, spr_btn_item, spr_btn_mercy];
    var _btn_scale = 0.5; 
    var _btn_y = 315;     
    var _spacing = 15;
    var _total_w = 0;
    for (var i = 0; i < 4; i++) _total_w += (sprite_get_width(_sprites[i]) * _btn_scale) + _spacing;
    _total_w -= _spacing;
    var _cur_x = (640 - _total_w) / 2;
    for (var i = 0; i < 4; i++) {
        var _is_selected = (i == menu_index && state == "menu");
        var _current_scale = _is_selected ? (_btn_scale * 1.2) : _btn_scale;
        var _y_offset = _is_selected ? -5 : 0; 
        var _col = _is_selected ? c_yellow : c_white;
        draw_sprite_ext(_sprites[i], 0, _cur_x, _btn_y + _y_offset, _current_scale, _current_scale, 0, _col, 1);
        _cur_x += (sprite_get_width(_sprites[i]) * _btn_scale) + _spacing;
    }
}

if (state == "fight") {
    if (sprite_exists(spr_fight_bar_bg)) {
        var _bar_scale = 2.0;
        var _bar_w = sprite_get_width(spr_fight_bar_bg) * _bar_scale;
        var _bar_h = sprite_get_height(spr_fight_bar_bg) * _bar_scale;
        var _bar_x = box_x + (box_w - _bar_w) / 2;
        var _bar_y = box_y + (box_h - _bar_h) / 2;
        draw_sprite_ext(spr_fight_bar_bg, 0, _bar_x, _bar_y, _bar_scale, _bar_scale, 0, c_white, 1);
        var _line_x = _bar_x + (_bar_w * (fight_pos / 100));
        draw_set_color(c_white);
        draw_rectangle(_line_x - 3, _bar_y, _line_x + 3, _bar_y + _bar_h, false);
    }
}

if (state == "action") {
    draw_set_color(c_black);
    draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, false);
    draw_set_color(c_white);
    draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, true);
    draw_set_halign(fa_center);
    draw_text(320, box_y + 25, "* Выбери действие:");
    for (var i = 0; i < array_length(action_options); i++) {
        var _col = (i == action_index) ? c_yellow : c_white;
        draw_set_color(_col);
        draw_text(320, box_y + 55 + i * 25, action_options[i]);
    }
}

if (state == "dialog" || state == "phase2_transform") {
    draw_set_color(c_black);
    draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, false);
    draw_set_color(c_white);
    draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, true);
    draw_set_halign(fa_center);
    draw_text_ext(320, box_y + box_h/2, monster_dialog, 20, box_w - 40);
}

if (state == "phase2_transform") {
    if (white_fade > 0) {
        draw_set_alpha(white_fade);
        draw_set_color(c_white);
        draw_rectangle(0, 0, 640, 360, false);
        draw_set_alpha(1);
    }
    if (white_fade > 0.8) {
        draw_set_color(c_black); 
        draw_text_transformed(320, 180, "ГЛАДКОВ АЛЬФА", 2.5, 2.5, 0);
        draw_text_transformed(320, 220, "ЯВИЛСЯ НА СЦЕНУ!", 1.5, 1.5, 0);
    }
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);