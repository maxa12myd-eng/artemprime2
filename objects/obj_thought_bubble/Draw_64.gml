// Рисуем само облачко (из кругов) над Борзеном
var _cx = 320; // Центр по X
var _cy = 100; // Над головой Борзена

draw_set_color(c_white);
// Основа облака
draw_circle(_cx, _cy, 50, false);
draw_circle(_cx - 40, _cy + 10, 30, false);
draw_circle(_cx + 40, _cy + 10, 30, false);
draw_circle(_cx - 20, _cy - 30, 25, false);
draw_circle(_cx + 20, _cy - 30, 25, false);
// Хвостик облака
draw_triangle(_cx - 10, _cy + 40, _cx + 10, _cy + 40, _cx, _cy + 70, false);

// Текст внутри
draw_set_font(fnt_undertale);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);
draw_text_ext(_cx, _cy, text, 18, 140);
draw_set_color(c_white);