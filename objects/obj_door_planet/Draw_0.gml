draw_self(); // Рисуем саму дверь

if (instance_exists(obj_artem_player)) {
    var _dist = point_distance(x, y, obj_artem_player.x, obj_artem_player.y);
    if (_dist < 80) {
        draw_set_font(fnt_undertale);
        draw_set_halign(fa_center);
        draw_set_color(c_yellow);
        draw_text(x, y - 60, "Нажми ENTER");
        draw_set_halign(fa_left);
        draw_set_color(c_white);
    }
}