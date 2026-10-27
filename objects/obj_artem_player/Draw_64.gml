// Показываем ХП игрока в левом верхнем углу экрана
if (variable_global_exists("player_hp")) {
    draw_set_font(fnt_undertale);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
    // Тень
    draw_set_color(c_black);
    draw_text(22, 22, "HP: " + string(global.player_hp) + " / " + string(global.player_max_hp));
    
    // Текст
    draw_set_color(c_yellow);
    draw_text(20, 20, "HP: " + string(global.player_hp) + " / " + string(global.player_max_hp));
    
    draw_set_color(c_white);
}