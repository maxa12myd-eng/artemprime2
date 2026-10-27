// Привязываем GUI к комнате 640x360
display_set_gui_size(640, 360);

menu_index = 0;
menu_count = 4;

if (!variable_global_exists("global_volume")) {
    global_volume = 1;
}
volume = global_volume;

// Запоминаем, в каком режиме экрана мы находимся
if (!variable_global_exists("is_borderless")) {
    global.is_borderless = false;
}