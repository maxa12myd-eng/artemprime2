// === ПОРТРЕТ ПЕРСОНАЖА (только мама) ===
var _current = dialog_lines[dialog_index];
var _portrait = -1;
var _portrait_x = room_width * 0.15;

if (_current.who == "mom" && sprite_exists(spr_mom)) {
    _portrait = spr_mom;
    _portrait_x = room_width * 0.15;
}

if (_portrait != -1) {
    var _ph = 140;
    var _scale = _ph / sprite_get_height(_portrait);
    draw_sprite_ext(_portrait, 0, _portrait_x, room_height - 200,
        _scale, _scale, 0, c_white, 1);
}

// === ОКНО ДИАЛОГА ===
var _box_x = 20;
var _box_y = room_height - 110;
var _box_w = room_width - 40;
var _box_h = 95;

draw_set_alpha(0.9);
draw_set_color(c_black);
draw_rectangle(_box_x, _box_y, _box_x + _box_w, _box_y + _box_h, false);
draw_set_alpha(1);

draw_set_color(c_white);
draw_rectangle(_box_x, _box_y, _box_x + _box_w, _box_y + _box_h, true);
draw_rectangle(_box_x + 4, _box_y + 4, _box_x + _box_w - 4, _box_y + _box_h - 4, true);

// === ИМЯ ===
draw_set_font(fnt_undertale);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _name = "";
switch (_current.who) {
    case "mom":      _name = "МАМА"; break;
    case "artem":    _name = "АРТЁМ"; break;
    case "narrator": _name = ""; break;
}

if (_name != "") {
    draw_set_color(c_yellow);
    draw_text(_box_x + 15, _box_y - 18, _name);
}

// === ТЕКСТ ===
var _visible_text = string_copy(_current.text, 1, floor(type_pos));
draw_set_color(c_white);
draw_text_ext(_box_x + 15, _box_y + 15, _visible_text, 16, _box_w - 30);

// === СТРЕЛКА ===
if (done_typing && dialog_index < array_length(dialog_lines) - 1) {
    if (floor(current_time / 400) mod 2 == 0) {
        draw_set_color(c_yellow);
        draw_text(_box_x + _box_w - 25, _box_y + _box_h - 25, "▼");
    }
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);