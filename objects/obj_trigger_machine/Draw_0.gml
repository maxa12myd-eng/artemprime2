// Мигающий маркер (убери, если не хочешь)
if (!triggered && floor(current_time / 400) mod 2 == 0) {
    draw_set_color(c_yellow);
    draw_circle(x, y, 15, true);
}