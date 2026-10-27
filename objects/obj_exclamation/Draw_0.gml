draw_set_font(fnt_undertale);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Черная обводка для читаемости
draw_set_color(c_black);
draw_text_transformed(x + 2, y + y_offset + 2, "!", 4, 4, 0); 
// Желтый сам знак (можно заменить на красный c_red)
draw_set_color(c_yellow);
draw_text_transformed(x, y + y_offset, "!", 4, 4, 0);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);