// ВЫВОДИМ СООБЩЕНИЕ, ЧТО ТАЙМЕР СРАБОТАЛ
show_debug_message("=== СРАБОТАЛ ALARM 0 (Переключение) ===");

// НИКАКОГО window_set_fullscreen! Только безопасное растягивание окна.
if (global.is_borderless) {
    // Возвращаемся в окошко 640x360
    window_set_size(640, 360);
    window_center();
    window_set_caption("ARTEM PRIME");
    global.is_borderless = false;
    show_debug_message("Режим: ОКНО");
} else {
    // Делаем окно без рамок на весь монитор
    var _w = display_get_width();
    var _h = display_get_height();
    window_set_size(_w, _h);
    window_set_position(0, 0);
    window_set_caption(""); // Убираем полоску с названием
    global.is_borderless = true;
    show_debug_message("Режим: ПОЛНЫЙ ЭКРАН");
}