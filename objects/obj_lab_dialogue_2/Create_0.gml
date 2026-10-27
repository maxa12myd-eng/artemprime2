// Фиксируем размер интерфейса
display_set_gui_size(640, 360);

depth = -1000;
dialog_index = 0;
type_pos = 0;
type_speed = 1;
done_typing = false;

// Текст диалога
dialog_lines = [
    {who: "mahmud", text: "Артём, смотри! Я нашел это на свалке."},
    {who: "artem",  text: "Что это? Пачка от доширака?"},
    {who: "mahmud", text: "Не просто пачка. На ней ОТПЕЧАТКИ ПАЛЬЦЕВ Гладкова!"},
    {who: "zheka",  text: "Я прогнал их через базу данных. Он прячется в старом бункере."},
    {who: "mahmud", text: "Это его логово. Пора с ним покончить."},
    {who: "artem",  text: "Я готов. Открывайте портал."}
];