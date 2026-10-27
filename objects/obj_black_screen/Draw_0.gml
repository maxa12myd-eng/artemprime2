// Чёрный фон
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);

// Текст
draw_set_font(fnt_undertale);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

var _x = 80;
var _line_height = 22;
var _visible_lines = 12;
var _bottom_y = room_height - 80;

var _start = max(0, line_index - _visible_lines + 1);

for (var i = _start; i <= line_index; i++) {
    if (i >= array_length(lines)) break;
    var _text = lines[i];
    if (i == line_index) {
        _text = string_copy(lines[i], 1, floor(type_pos));
    }
    var _y = _bottom_y - (line_index - i) * _line_height;
    draw_text(_x, _y, _text);
}

if (done_typing && line_index < array_length(lines) - 1) {
    if (floor(current_time / 400) mod 2 == 0) {
        draw_set_color(c_yellow);
        draw_text(540, 340, "enter");
    }
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);